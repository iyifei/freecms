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
            //验证码
            ['method' => 'GET', 'route' => '/captcha','handler' => \FreeCMS\Www\Pages\Index\CaptchaPage::class],
        ],
        //**********************管理后台*********************//
        'admin'=>[
            //登录
            ['method' => 'GET', 'route' => '/login','handler' => \FreeCMS\Admin\Pages\Index\LoginPage::class],
            //框架主页
            ['method' => 'GET', 'route' => '/','handler' => \FreeCMS\Admin\Pages\Index\MainPage::class],
            //主页
            ['method' => 'GET', 'route' => '/home','handler' => \FreeCMS\Admin\Pages\Index\HomePage::class],
            //图标
            ['method' => 'GET', 'route' => '/system/icon','handler' => \FreeCMS\Admin\Pages\Index\IconPage::class],

            //栏目管理
            ['method' => 'GET', 'route' => '/site/arctype', 'handler' => \FreeCMS\Admin\Pages\Site\ArcTypePage::class],
            ['method' => 'GET', 'route' => '/site/arctype/edit', 'handler' => \FreeCMS\Admin\Pages\Site\ArcTypeEditPage::class],
            ['method' => 'POST', 'route' => '/site/arctype/save', 'handler' => \FreeCMS\Admin\Pages\Site\ArcTypeEditAjax::class],

            //菜单管理
            ['method' => 'GET', 'route' => '/system/menu', 'handler' => \FreeCMS\Admin\Pages\System\MenuPage::class],
            ['method' => 'GET', 'route' => '/system/menu/edit', 'handler' => \FreeCMS\Admin\Pages\System\MenuEditPage::class],
            ['method' => 'POST', 'route' => '/system/menu/save', 'handler' => \FreeCMS\Admin\Pages\System\MenuEditAjax::class],

            //单页管理
            ['method' => 'GET', 'route' => '/site/page', 'handler' => \FreeCMS\Admin\Pages\Site\SinglePage::class],
            ['method' => 'GET', 'route' => '/site/page/edit', 'handler' => \FreeCMS\Admin\Pages\Site\SingleEditPage::class],
            ['method' => 'POST', 'route' => '/site/page/save', 'handler' => \FreeCMS\Admin\Pages\Site\SingleEditAjax::class],

            //友情链接
            ['method' => 'GET', 'route' => '/site/flink', 'handler' => \FreeCMS\Admin\Pages\Site\FlinkPage::class],
            ['method' => 'GET', 'route' => '/site/flink/edit', 'handler' => \FreeCMS\Admin\Pages\Site\FlinkEditPage::class],
            ['method' => 'POST', 'route' => '/site/flink/save', 'handler' => \FreeCMS\Admin\Pages\Site\FlinkEditAjax::class],

            //文章管理
            ['method' => 'POST', 'route' => '/content/{channel}/save', 'handler' => \FreeCMS\Admin\Pages\Content\ArchivesEditAjax::class],
            ['method' => 'GET', 'route' => '/content/article', 'handler' => \FreeCMS\Admin\Pages\Content\ArticlePage::class],
            ['method' => 'GET', 'route' => '/content/article/edit', 'handler' => \FreeCMS\Admin\Pages\Content\ArticleEditPage::class],
            ['method' => 'GET', 'route' => '/content/video', 'handler' => \FreeCMS\Admin\Pages\Content\VideoPage::class],
            ['method' => 'GET', 'route' => '/content/video/edit', 'handler' => \FreeCMS\Admin\Pages\Content\VideoEditPage::class],
            ['method' => 'GET', 'route' => '/content/audio', 'handler' => \FreeCMS\Admin\Pages\Content\AudioPage::class],
            ['method' => 'GET', 'route' => '/content/audio/edit', 'handler' => \FreeCMS\Admin\Pages\Content\AudioEditPage::class],
            ['method' => 'GET', 'route' => '/content/image', 'handler' => \FreeCMS\Admin\Pages\Content\ImagePage::class],
            ['method' => 'GET', 'route' => '/content/image/edit', 'handler' => \FreeCMS\Admin\Pages\Content\ImageEditPage::class],
        ]
    ]
];