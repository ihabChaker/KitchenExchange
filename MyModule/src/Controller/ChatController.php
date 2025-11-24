<?php
namespace MyModule\Controller;

use Laminas\Mvc\Controller\AbstractActionController;
use Laminas\View\Model\ViewModel;
use Laminas\View\Model\JsonModel;

class ChatController extends AbstractActionController
{
    public function indexAction()
    {
        $view = new ViewModel();
        return $view;
    }

    public function queryAction()
    {
        $request = $this->getRequest();
        if (!$request instanceof \Laminas\Http\Request || !$request->isPost()) {
            $result = new JsonModel(['error' => 'Method not allowed']);
            $result->setTerminal(true);
            return $result;
        }

        $content = $request->getContent();
        $data = json_decode($content, true);
        $message = $data['message'] ?? '';

        if (empty($message)) {
            $result = new JsonModel(['error' => 'Message is empty']);
            $result->setTerminal(true);
            return $result;
        }

        $services = $this->getEvent()->getApplication()->getServiceManager();
        $settings = $services->get('Omeka\Settings');
        $ollamaHost = $settings->get('my_module_ollama_host', 'localhost');
        $ollamaPort = $settings->get('my_module_ollama_port', '11434');
        $ollamaModel = $settings->get('my_module_ollama_model', 'llama2');
        $ollamaTemperature = $settings->get('my_module_ollama_temperature', '0.7');

        if (empty($ollamaHost) || empty($ollamaPort) || empty($ollamaModel)) {
            $result = new JsonModel(['error' => 'Ollama not configured properly']);
            $result->setTerminal(true);
            return $result;
        }

        // Call Ollama API
        $response = $this->callOllama($ollamaHost, $ollamaPort, $ollamaModel, $ollamaTemperature, $message);

        $result = new JsonModel($response);
        $result->setTerminal(true);
        return $result;
    }

    private function callOllama($host, $port, $model, $temperature, $message)
    {
        $url = "http://{$host}:{$port}/api/chat";
        $data = [
            'model' => $model,
            'messages' => [
                ['role' => 'user', 'content' => $message]
            ],
            'stream' => false,
            'options' => [
                'temperature' => floatval($temperature)
            ]
        ];

        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/json'
        ]);
        curl_setopt($ch, CURLOPT_TIMEOUT, 120);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);

        $result = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curlError = curl_error($ch);
        curl_close($ch);

        if ($curlError) {
            return ['error' => 'Connection error: ' . $curlError . '. Make sure Ollama is running at ' . $host . ':' . $port];
        }

        if ($httpCode !== 200) {
            return ['error' => 'Ollama API Error (HTTP ' . $httpCode . '): ' . $result];
        }

        $response = json_decode($result, true);
        
        if (isset($response['error'])) {
            return ['error' => 'Ollama error: ' . $response['error']];
        }
        
        $reply = $response['message']['content'] ?? 'No response';

        return ['reply' => $reply];
    }
}
