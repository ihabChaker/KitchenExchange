<?php
namespace MyModule\Job;

use Omeka\Job\AbstractJob;

class SyncToAnythingLLM extends AbstractJob
{
    public function perform()
    {
        $services = $this->getServiceLocator();
        $api = $services->get('Omeka\ApiManager');
        $logger = $services->get('Omeka\Logger');
        $settings = $services->get('Omeka\Settings');
        
        // Get AnythingLLM service
        $anythingLLMService = $services->get('MyModule\AnythingLLMService');
        
        // Get export service
        $dataExporter = $services->get('MyModule\OmekaDataExporter');
        
        // Get job arguments
        $resourceTypes = $this->getArg('resource_types', ['Recipe']);
        $itemSets = $this->getArg('item_sets', []);
        $fullSync = $this->getArg('full_sync', false);
        $batchSize = $this->getArg('batch_size', 50);
        
        $logger->info('Starting AnythingLLM sync job...');
        $logger->info(sprintf('Resource types: %s', implode(', ', $resourceTypes)));
        $logger->info(sprintf('Full sync: %s', $fullSync ? 'yes' : 'no'));
        
        $stats = [
            'processed' => 0,
            'uploaded' => 0,
            'updated' => 0,
            'skipped' => 0,
            'errors' => 0,
        ];
        
        try {
            // Test connection first
            if (!$anythingLLMService->testConnection()) {
                throw new \Exception('Cannot connect to AnythingLLM. Please check configuration.');
            }
            
            // Get last sync timestamp (unless doing full sync)
            $lastSyncKey = 'my_module_last_anythingllm_sync';
            $lastSync = $fullSync ? null : $settings->get($lastSyncKey);
            
            if ($lastSync) {
                $logger->info(sprintf('Incremental sync since: %s', $lastSync));
            } else {
                $logger->info('Performing full sync...');
            }
            
            foreach ($resourceTypes as $resourceType) {
                $logger->info(sprintf('Processing resource type: %s', $resourceType));
                
                // Build query to find items
                $query = [
                    'resource_class_label' => $resourceType,
                ];
                
                // Add item set filter if specified
                if (!empty($itemSets)) {
                    $query['item_set_id'] = $itemSets;
                }
                
                // Add modified filter for incremental sync
                if ($lastSync) {
                    $query['modified']['after'] = $lastSync;
                }
                
                // Get total count
                $response = $api->search('items', $query, ['returnScalar' => 'id']);
                $itemIds = $response->getContent();
                $totalItems = count($itemIds);
                
                $logger->info(sprintf('Found %d items to process for %s', $totalItems, $resourceType));
                
                // Process in batches
                foreach (array_chunk($itemIds, $batchSize) as $batchNum => $idsChunk) {
                    if ($this->shouldStop()) {
                        $logger->warn('Job stopped by user');
                        return;
                    }
                    
                    $logger->info(sprintf('Processing batch %d/%d (%d items)', 
                        $batchNum + 1, 
                        ceil($totalItems / $batchSize),
                        count($idsChunk)
                    ));
                    
                    foreach ($idsChunk as $itemId) {
                        if ($this->shouldStop()) {
                            $logger->warn('Job stopped by user');
                            return;
                        }
                        
                        $stats['processed']++;
                        
                        try {
                            // Get full item data
                            $item = $api->read('items', $itemId)->getContent();
                            
                            // Convert to document
                            $document = $dataExporter->exportItemAsDocument($item, $resourceType);
                            
                            if (!$document) {
                                $logger->warn(sprintf('Skipping item #%d - no exportable data', $itemId));
                                $stats['skipped']++;
                                continue;
                            }
                            
                            // Check if document exists in AnythingLLM (by checking metadata)
                            $documentId = 'omeka-item-' . $itemId;
                            $exists = $anythingLLMService->checkDocumentExists($documentId);
                            
                            // Upload or update document
                            if ($exists) {
                                $result = $anythingLLMService->updateDocument($documentId, $document);
                                $stats['updated']++;
                                $logger->info(sprintf('Updated document for item #%d (%s)', $itemId, $document['title']));
                            } else {
                                $result = $anythingLLMService->uploadDocument($document['content'], $document['title'], [
                                    'omeka_id' => $itemId,
                                    'omeka_type' => $resourceType,
                                    'document_id' => $documentId,
                                ]);
                                $stats['uploaded']++;
                                $logger->info(sprintf('Uploaded new document for item #%d (%s)', $itemId, $document['title']));
                            }
                            
                        } catch (\Exception $e) {
                            $stats['errors']++;
                            $logger->err(sprintf('Error processing item #%d: %s', $itemId, $e->getMessage()));
                        }
                    }
                }
            }
            
            // Update last sync timestamp
            $settings->set($lastSyncKey, date('Y-m-d\TH:i:s'));
            
            // Log final stats
            $logger->info('Sync completed successfully!');
            $logger->info(sprintf('Total processed: %d', $stats['processed']));
            $logger->info(sprintf('New uploads: %d', $stats['uploaded']));
            $logger->info(sprintf('Updated: %d', $stats['updated']));
            $logger->info(sprintf('Skipped: %d', $stats['skipped']));
            $logger->info(sprintf('Errors: %d', $stats['errors']));
            
        } catch (\Exception $e) {
            $logger->err(sprintf('Sync job failed: %s', $e->getMessage()));
            throw $e;
        }
    }
}
