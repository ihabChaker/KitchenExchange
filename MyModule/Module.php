<?php
namespace MyModule;

use Omeka\Module\AbstractModule;
use Laminas\View\Model\ViewModel;
use Laminas\Mvc\Controller\AbstractController;
use Laminas\EventManager\Event;
use Laminas\EventManager\SharedEventManagerInterface;
use Laminas\View\Renderer\PhpRenderer;

class Module extends AbstractModule
{
    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function getConfigForm(PhpRenderer $renderer)
    {
        $settings = $this->getServiceLocator()->get('Omeka\Settings');
        $ollamaHost = $settings->get('my_module_ollama_host', 'localhost');
        $ollamaPort = $settings->get('my_module_ollama_port', '11434');
        $ollamaModel = $settings->get('my_module_ollama_model', 'llama2');
        $ollamaTemperature = $settings->get('my_module_ollama_temperature', '0.7');

        return '<div class="field">
            <div class="two columns alpha">
                <label for="ollama_host">Ollama Host</label>
            </div>
            <div class="inputs five columns omega">
                <input type="text" id="ollama_host" name="ollama_host" value="' . $renderer->escapeHtml($ollamaHost) . '">
                <p class="explanation">Hostname or IP address (e.g., localhost, 192.168.1.100)</p>
            </div>
        </div>
        <div class="field">
            <div class="two columns alpha">
                <label for="ollama_port">Ollama Port</label>
            </div>
            <div class="inputs five columns omega">
                <input type="text" id="ollama_port" name="ollama_port" value="' . $renderer->escapeHtml($ollamaPort) . '">
                <p class="explanation">Default is 11434</p>
            </div>
        </div>
        <div class="field">
            <div class="two columns alpha">
                <label for="ollama_model">Model Name</label>
            </div>
            <div class="inputs five columns omega">
                <input type="text" id="ollama_model" name="ollama_model" value="' . $renderer->escapeHtml($ollamaModel) . '">
                <p class="explanation">Model to use (e.g., llama2, mistral, codellama, phi, qwen)</p>
            </div>
        </div>
        <div class="field">
            <div class="two columns alpha">
                <label for="ollama_temperature">Temperature</label>
            </div>
            <div class="inputs five columns omega">
                <input type="text" id="ollama_temperature" name="ollama_temperature" value="' . $renderer->escapeHtml($ollamaTemperature) . '">
                <p class="explanation">Controls randomness (0.0-1.0). Lower = more focused, Higher = more creative</p>
            </div>
        </div>';
    }

    public function handleConfigForm(AbstractController $controller)
    {
        $settings = $this->getServiceLocator()->get('Omeka\Settings');
        $params = $controller->getRequest()->getPost();
        $settings->set('my_module_ollama_host', $params['ollama_host'] ?? 'localhost');
        $settings->set('my_module_ollama_port', $params['ollama_port'] ?? '11434');
        $settings->set('my_module_ollama_model', $params['ollama_model'] ?? 'llama2');
        $settings->set('my_module_ollama_temperature', $params['ollama_temperature'] ?? '0.7');
        return true;
    }
}