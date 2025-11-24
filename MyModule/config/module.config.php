<?php

return [
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
            'MyModule\Controller\Chat' => 'MyModule\Controller\ChatController',
        ],
    ],
    'router' => [
        'routes' => [
            'admin' => [
                'child_routes' => [
                    'mymodule-chat' => [
                        'type' => \Laminas\Router\Http\Literal::class,
                        'options' => [
                            'route' => '/chat',
                            'defaults' => [
                                '__NAMESPACE__' => 'MyModule\Controller',
                                'controller' => 'Chat',
                                'action' => 'index',
                            ],
                        ],
                        'may_terminate' => true,
                        'child_routes' => [
                            'query' => [
                                'type' => \Laminas\Router\Http\Literal::class,
                                'options' => [
                                    'route' => '/query',
                                    'defaults' => [
                                        'action' => 'query',
                                    ],
                                ],
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
                'label' => 'LLM Chat',
                'route' => 'admin/mymodule-chat',
                'resource' => 'MyModule\Controller\Chat',
                'privilege' => 'index',
            ],
        ],
    ],
];