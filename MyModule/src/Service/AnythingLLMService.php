<?php
namespace MyModule\Service;

class AnythingLLMService
{
    protected $apiUrl;
    protected $apiKey;
    protected $workspaceSlug;

    public function __construct($apiUrl, $apiKey, $workspaceSlug)
    {
        $this->apiUrl = rtrim($apiUrl, '/');
        $this->apiKey = $apiKey;
        $this->workspaceSlug = $workspaceSlug;

        // Ensure workspace folder exists
        $this->ensureWorkspaceFolder();
    }

    /**
     * Ensure the workspace folder exists in AnythingLLM
     * Creates it if it doesn't exist
     */
    protected function ensureWorkspaceFolder()
    {
        try {
            $endpoint = "{$this->apiUrl}/api/v1/document/create-folder";

            $ch = curl_init($endpoint);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Content-Type: application/json',
                'Authorization: Bearer ' . $this->apiKey,
            ]);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode([
                'name' => $this->workspaceSlug,
            ]));
            curl_setopt($ch, CURLOPT_TIMEOUT, 10);

            curl_exec($ch);
            curl_close($ch);

            // Ignore errors - folder may already exist
        } catch (\Exception $e) {
            // Silently ignore - folder creation is best-effort
        }
    }

    /**
     * Send a message to AnythingLLM with conversation history
     *
     * @param array $messages Array of messages with 'role' and 'content' keys
     * @return array Response from AnythingLLM
     * @throws \Exception
     */
    public function sendMessage($message, array $conversationHistory = [])
    {
        $endpoint = "{$this->apiUrl}/api/v1/workspace/{$this->workspaceSlug}/chat";

        // Build the request payload
        $payload = [
            'message' => $message,
            'mode' => 'chat',
        ];

        // Initialize cURL
        $ch = curl_init($endpoint);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/json',
            'Authorization: Bearer ' . $this->apiKey,
        ]);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload));
        curl_setopt($ch, CURLOPT_TIMEOUT, 300); // 5 minutes for RAG queries

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $error = curl_error($ch);
        curl_close($ch);

        if ($error) {
            throw new \Exception("cURL error: {$error}");
        }

        if ($httpCode !== 200) {
            throw new \Exception("AnythingLLM API returned HTTP {$httpCode}: {$response}");
        }

        $data = json_decode($response, true);
        if (json_last_error() !== JSON_ERROR_NONE) {
            throw new \Exception("Invalid JSON response from AnythingLLM: " . json_last_error_msg());
        }

        return $data;
    }

    /**
     * Test the connection to AnythingLLM
     *
     * @return bool
     */
    public function testConnection()
    {
        try {
            $endpoint = "{$this->apiUrl}/api/v1/workspace/{$this->workspaceSlug}";

            $ch = curl_init($endpoint);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Authorization: Bearer ' . $this->apiKey,
            ]);
            curl_setopt($ch, CURLOPT_TIMEOUT, 10);

            $response = curl_exec($ch);
            $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);

            return $httpCode === 200;
        } catch (\Exception $e) {
            return false;
        }
    }

    /**
     * Upload a text document to AnythingLLM workspace
     *
     * @param string $content Document content
     * @param string $title Document title
     * @param array $metadata Additional metadata
     * @return array Response from AnythingLLM
     * @throws \Exception
     */
    public function uploadDocument($content, $title, array $metadata = [])
    {
        // Step 1: Upload raw text to AnythingLLM's document system
        $uploadEndpoint = "{$this->apiUrl}/api/v1/document/raw-text";

        $uploadPayload = [
            'textContent' => $content,
            'metadata' => array_merge([
                'title' => $title,
            ], $metadata),
        ];

        $ch = curl_init($uploadEndpoint);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/json',
            'Authorization: Bearer ' . $this->apiKey,
        ]);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($uploadPayload));
        curl_setopt($ch, CURLOPT_TIMEOUT, 120);

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $error = curl_error($ch);
        curl_close($ch);

        if ($error) {
            throw new \Exception("cURL error during upload: {$error}");
        }

        if ($httpCode !== 200) {
            throw new \Exception("Document upload failed with HTTP {$httpCode}: {$response}");
        }

        $uploadData = json_decode($response, true);
        if (json_last_error() !== JSON_ERROR_NONE) {
            throw new \Exception("Invalid JSON response from upload: " . json_last_error_msg());
        }

        if (!isset($uploadData['success']) || !$uploadData['success']) {
            $errorMsg = $uploadData['error'] ?? 'Unknown error';
            throw new \Exception("Document upload failed: {$errorMsg}");
        }

        // Step 2: Move document to workspace folder and add to workspace
        if (isset($uploadData['documents']) && is_array($uploadData['documents']) && count($uploadData['documents']) > 0) {
            $document = $uploadData['documents'][0];
            $docLocation = $document['location'];

            // Extract filename from location
            $filename = basename($docLocation);
            $workspaceFolder = $this->workspaceSlug; // Use workspace slug as folder name
            $newLocation = "{$workspaceFolder}/{$filename}";

            // Move the file to workspace folder
            $moveEndpoint = "{$this->apiUrl}/api/v1/document/move-files";
            $movePayload = [
                'files' => [
                    [
                        'from' => $docLocation,
                        'to' => $newLocation,
                    ],
                ],
            ];

            $ch = curl_init($moveEndpoint);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Content-Type: application/json',
                'Authorization: Bearer ' . $this->apiKey,
            ]);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($movePayload));
            curl_setopt($ch, CURLOPT_TIMEOUT, 60);

            $moveResponse = curl_exec($ch);
            $moveHttpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);

            if ($moveHttpCode !== 200) {
                throw new \Exception("Failed to move document to folder: {$moveResponse}");
            }

            // Step 3: Add the document to the workspace for embedding
            $updateEndpoint = "{$this->apiUrl}/api/v1/workspace/{$this->workspaceSlug}/update-embeddings";

            $embedPayload = [
                'adds' => [$newLocation],
            ];

            $ch = curl_init($updateEndpoint);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Content-Type: application/json',
                'Authorization: Bearer ' . $this->apiKey,
            ]);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($embedPayload));
            curl_setopt($ch, CURLOPT_TIMEOUT, 120);

            $embedResponse = curl_exec($ch);
            $embedHttpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            $embedError = curl_error($ch);
            curl_close($ch);

            if ($embedError) {
                throw new \Exception("cURL error during embedding: {$embedError}");
            }

            if ($embedHttpCode !== 200) {
                throw new \Exception("Document embedding failed with HTTP {$embedHttpCode}: {$embedResponse}");
            }

            $embedData = json_decode($embedResponse, true);
            return [
                'upload' => $uploadData,
                'moved_to' => $newLocation,
                'embed' => $embedData,
            ];
        }

        return $uploadData;
    }    /**
         * Check if a document exists in the workspace
         *
         * @param string $documentId Document identifier
         * @return bool
         */
    public function checkDocumentExists($documentId)
    {
        // For now, return false to always upload new documents
        // In a full implementation, you would query AnythingLLM's document list API
        return false;
    }

    /**
     * Update an existing document in AnythingLLM
     *
     * @param string $documentId Document identifier
     * @param array $document Document data with 'title' and 'content'
     * @return array Response from AnythingLLM
     * @throws \Exception
     */
    public function updateDocument($documentId, array $document)
    {
        // For now, we'll delete and re-upload
        // In a full implementation, use AnythingLLM's update API if available
        return $this->uploadDocument($document['content'], $document['title'], [
            'document_id' => $documentId,
        ]);
    }
}
