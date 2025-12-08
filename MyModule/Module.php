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
        $apiUrl = $settings->get('my_module_anythingllm_api_url', 'http://localhost:3001');
        $apiKey = $settings->get('my_module_anythingllm_api_key', '');
        $workspaceSlug = $settings->get('my_module_anythingllm_workspace_slug', 'default');

        return '<div class="field">
            <div class="two columns alpha">
                <label for="anythingllm_api_url">AnythingLLM API URL</label>
            </div>
            <div class="inputs five columns omega">
                <input type="text" id="anythingllm_api_url" name="anythingllm_api_url" value="' . $renderer->escapeHtml($apiUrl) . '">
                <p class="explanation">Full URL to AnythingLLM instance (e.g., http://localhost:3001 or https://anythingllm.yourdomain.com)</p>
            </div>
        </div>
        <div class="field">
            <div class="two columns alpha">
                <label for="anythingllm_api_key">API Key</label>
            </div>
            <div class="inputs five columns omega">
                <input type="password" id="anythingllm_api_key" name="anythingllm_api_key" value="' . $renderer->escapeHtml($apiKey) . '">
                <p class="explanation">API key for authentication (generated in AnythingLLM settings)</p>
            </div>
        </div>
        <div class="field">
            <div class="two columns alpha">
                <label for="anythingllm_workspace_slug">Workspace Slug</label>
            </div>
            <div class="inputs five columns omega">
                <input type="text" id="anythingllm_workspace_slug" name="anythingllm_workspace_slug" value="' . $renderer->escapeHtml($workspaceSlug) . '">
                <p class="explanation">Workspace slug to use (all chats will use this workspace)</p>
            </div>
        </div>';
    }

    public function handleConfigForm(AbstractController $controller)
    {
        $settings = $this->getServiceLocator()->get('Omeka\Settings');
        $params = $controller->getRequest()->getPost();
        $settings->set('my_module_anythingllm_api_url', $params['anythingllm_api_url'] ?? 'http://localhost:3001');
        $settings->set('my_module_anythingllm_api_key', $params['anythingllm_api_key'] ?? '');
        $settings->set('my_module_anythingllm_workspace_slug', $params['anythingllm_workspace_slug'] ?? 'default');
        return true;
    }
}