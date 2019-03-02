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
            //首页
            ['method' => 'GET', 'route' => '/','handler' => \FreeCMS\Www\Pages\Index\IndexPage::class],
            //单页详情
            ['method' => 'GET', 'route' => '/pages/{name}.html', 'handler' => \FreeCMS\Www\Pages\Index\SinglePage::class],
            //文档详情页
            ['method' => 'GET', 'route' => '/archives/{hash}.html', 'handler' => \FreeCMS\Www\Pages\Index\ArchivesPage::class],
            //文档属性获取
            ['method' => 'GET', 'route' => '/archives/{type}/{hash}', 'handler' => \FreeCMS\Www\Pages\Index\ArchiveAjax::class],
            //列表页
            ['method' => 'GET', 'route' => '/{channel:list|image|video|article}/{typedir}', 'handler' => \FreeCMS\Www\Pages\Index\ListPage::class],
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
            ['method' => 'GET', 'route' => '/content/image', 'handler' => \FreeCMS\Admin\Pages\Content\ImagePage::class],
            ['method' => 'GET', 'route' => '/content/image/edit', 'handler' => \FreeCMS\Admin\Pages\Content\ImageEditPage::class],

            //管理员管理
            ['method' => 'GET', 'route' => '/system/admin', 'handler' => \FreeCMS\Admin\Pages\System\AdminPage::class],
            ['method' => 'GET', 'route' => '/system/admin/edit', 'handler' => \FreeCMS\Admin\Pages\System\AdminEditPage::class],
            ['method' => 'POST', 'route' => '/system/admin/save', 'handler' => \FreeCMS\Admin\Pages\System\AdminEditAjax::class],

            //角色管理
            ['method' => 'GET', 'route' => '/system/role', 'handler' => \FreeCMS\Admin\Pages\System\RolePage::class],
            ['method' => 'GET', 'route' => '/system/role/edit', 'handler' => \FreeCMS\Admin\Pages\System\RoleEditPage::class],
            ['method' => 'POST', 'route' => '/system/role/save', 'handler' => \FreeCMS\Admin\Pages\System\RoleEditAjax::class],
            //登录日志
            ['method' => 'GET', 'route' => '/system/logs', 'handler' => \FreeCMS\Admin\Pages\System\LoginLogPage::class],

            //模板管理
            ['method' => 'GET', 'route' => '/template/template', 'handler' =>  \FreeCMS\Admin\Pages\Template\TemplatePage::class],
            ['method' => 'GET', 'route' => '/template/template/edit', 'handler' =>  \FreeCMS\Admin\Pages\Template\TemplateEditPage::class],
            ['method' => 'POST', 'route' => '/template/template/save', 'handler' =>  \FreeCMS\Admin\Pages\Template\TemplateEditAjax::class],
            //主题管理
            ['method' => 'GET', 'route' => '/template/theme', 'handler' =>  \FreeCMS\Admin\Pages\Template\ThemePage::class],
            ['method' => 'GET', 'route' => '/template/theme/edit', 'handler' =>  \FreeCMS\Admin\Pages\Template\ThemeEditPage::class],
            ['method' => 'POST', 'route' => '/template/theme/save', 'handler' =>  \FreeCMS\Admin\Pages\Template\ThemeEditAjax::class],
            ['method' => 'POST', 'route' => '/template/theme/operate', 'handler' =>  \FreeCMS\Admin\Pages\Template\ThemeOperateAjax::class],
            ['method' => 'GET', 'route' => '/template/theme/export', 'handler' =>  \FreeCMS\Admin\Pages\Template\ThemeExportPage::class],
        ],
        //**********************云存储*********************//
        'cloud'=>[
                //上传媒体
                ['method' => ['POST','OPTIONS'], 'route' => '/upload', 'handler' => \FreeCMS\Storage\Pages\UploadAjax::class],
                //删除资源
                ['method' => 'POST', 'route' => '/delete', 'handler' => \FreeCMS\Storage\Pages\DeleteAjax::class],
                //测试配置
                ['method' => 'POST', 'route' => '/test', 'handler' => \FreeCMS\Storage\Pages\TestAjax::class],
                //上传单个文件
                ['method' => 'GET', 'route' => '/uploadFile', 'handler' => \FreeCMS\Storage\Pages\UploadFilePage::class],
                //批量上传图片
                ['method' => 'GET', 'route' => '/uploadFiles', 'handler' => \FreeCMS\Storage\Pages\UploadFilesPage::class],
        ]
    ],
    'notFound'=>[
        //未找到返回的页面
        'cloud'=>\FreeCMS\Storage\Pages\IndexAjax::class,
    ]
];