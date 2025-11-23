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
        return "<label for='my_setting'>My Setting:</label>
                <input type='text' id='my_setting' name='my_setting' value=''/>";
    }

    public function handleConfigForm(AbstractController $controller)
    {
        return true;
    }
}
