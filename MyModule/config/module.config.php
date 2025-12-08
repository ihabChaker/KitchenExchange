<?php

return [
    'entity_manager' => [
        'mapping_classes_paths' => [
            dirname(__DIR__) . '/src/Entity',
        ],
        'proxy_paths' => [
            dirname(__DIR__) . '/data/doctrine-proxies',
        ],
    ],
    'service_manager' => [
        'factories' => [
            'MyModule\AnythingLLMService' => 'MyModule\Service\AnythingLLMServiceFactory',
            'MyModule\OmekaDataExporter' => 'MyModule\Service\OmekaDataExporterFactory',
        ],
    ],
    'view_manager' => [
        'template_path_stack' => [
            'mymodule' => OMEKA_PATH . '/modules/MyModule/view',
        ],
        'strategies' => [
            'ViewJsonStrategy',
        ],
    ],
    'controllers' => [
        'invokables' => [
            'MyModule\Controller\Sync' => 'MyModule\Controller\SyncController',
        ],
    ],
    'router' => [
        'routes' => [
            'admin' => [
                'child_routes' => [
                    'mymodule-sync' => [
                        'type' => \Laminas\Router\Http\Literal::class,
                        'options' => [
                            'route' => '/mymodule/sync',
                            'defaults' => [
                                '__NAMESPACE__' => 'MyModule\Controller',
                                'controller' => 'Sync',
                                'action' => 'sync',
                            ],
                        ],
                    ],
                ],
            ],
        ],
    ],
    'navigation' => [
        'AdminModule' => [
            [
                'label' => 'Sync to RAG',
                'route' => 'admin/mymodule-sync',
                'resource' => 'MyModule\Controller\Sync',
                'privilege' => 'sync',
            ],
        ],
    ],
];