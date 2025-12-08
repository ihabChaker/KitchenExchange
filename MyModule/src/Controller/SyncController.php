<?php
namespace MyModule\Controller;

use Laminas\Mvc\Controller\AbstractActionController;
use Laminas\View\Model\ViewModel;

class SyncController extends AbstractActionController
{
    public function syncAction()
    {
        $services = $this->getEvent()->getApplication()->getServiceManager();
        $api = $services->get('Omeka\ApiManager');
        $settings = $services->get('Omeka\Settings');
        $dispatcher = $services->get('Omeka\Job\Dispatcher');

        $view = new ViewModel();

        // Initialize variables with defaults
        $itemSets = [];
        $lastSync = null;

        if (!$this->getRequest()->isPost()) {
            // Get available resource classes
            $resourceClasses = $api->search('resource_classes', [
                'vocabulary_namespace_uri' => 'https://github.com/ihabChaker/KitchenExchange#',
            ])->getContent();

            // Get available item sets
            $itemSets = $api->search('item_sets', [])->getContent();

            // Get last sync time
            $lastSync = $settings->get('my_module_last_anythingllm_sync');

            $view->setVariable('resourceClasses', $resourceClasses);
            $view->setVariable('itemSets', $itemSets);
            $view->setVariable('lastSync', $lastSync);

            return $view;
        }

        // Process form submission
        $data = $this->params()->fromPost();

        $resourceTypes = $data['resource_types'] ?? ['Recipe'];
        $itemSets = $data['item_sets'] ?? [];
        $fullSync = isset($data['full_sync']) ? (bool) $data['full_sync'] : false;
        $batchSize = isset($data['batch_size']) ? (int) $data['batch_size'] : 50;

        try {
            // Dispatch the sync job
            $job = $dispatcher->dispatch('MyModule\Job\SyncToAnythingLLM', [
                'resource_types' => $resourceTypes,
                'item_sets' => $itemSets,
                'full_sync' => $fullSync,
                'batch_size' => $batchSize,
            ]);

            $this->messenger()->addSuccess(sprintf(
                'Sync job started (Job #%d). Check the Jobs page for progress.',
                $job->getId()
            ));

            return $this->redirect()->toRoute('admin/id', [
                'controller' => 'job',
                'action' => 'show',
                'id' => $job->getId()
            ]);

        } catch (\Exception $e) {
            $this->messenger()->addError('Error starting sync job: ' . $e->getMessage());
            $view->setVariable('itemSets', $itemSets);
            $view->setVariable('lastSync', $lastSync);
            return $view;
        }
    }
}
