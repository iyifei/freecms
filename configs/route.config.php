<?php
/**
 * 路由配置
 * author minyifei
 * date 2019/2/22
 */

return [
    'routes' => [
        //***********************默认路由*********************//
        'default'=>[
            //程序安装页面
            ['method' => 'GET', 'route' => '/install','handler' => \FreeCMS\Admin\Pages\Install\StepPage::class],
        ],
        //**********************管理后台*********************//
        'admin'=>[
            //登录
            ['method' => 'GET', 'route' => '/login','handler' => \FreeCMS\Admin\Pages\Index\LoginPage::class],
            //框架主页
            ['method' => 'GET', 'route' => '/','handler' => \FreeCMS\Admin\Pages\Index\MainPage::class],
            //主页
            ['method' => 'GET', 'route' => '/home','handler' => \FreeCMS\Admin\Pages\Index\HomePage::class],
            //内容管理
            ['method' => 'GET', 'route' => '/content','handler' => \FreeCMS\Admin\Pages\Content\ContentMain::class],
        ]
    ]
];