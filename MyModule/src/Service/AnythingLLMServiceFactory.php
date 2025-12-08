<?php
namespace MyModule\Service;

use Interop\Container\ContainerInterface;
use Laminas\ServiceManager\Factory\FactoryInterface;

class AnythingLLMServiceFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $services, $requestedName, array $options = null)
    {
        $settings = $services->get('Omeka\Settings');
        
        $apiUrl = $settings->get('my_module_anythingllm_api_url', 'http://localhost:3001');
        $apiKey = $settings->get('my_module_anythingllm_api_key', '');
        $workspaceSlug = $settings->get('my_module_anythingllm_workspace_slug', 'workspace-web');
        
        return new AnythingLLMService($apiUrl, $apiKey, $workspaceSlug);
    }
}
