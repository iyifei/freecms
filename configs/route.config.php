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
            //测试
            ['method' => 'GET', 'route' => '/test','handler' => \FreeCMS\Www\Pages\Index\TestPage::class],
            //广告位
            ['method' => 'GET', 'route' => '/adjs','handler' => \FreeCMS\Www\Pages\Index\AdAjax::class],
            //程序安装页面
            ['method' => 'GET', 'route' => '/install','handler' => \FreeCMS\Admin\Pages\Install\StepPage::class],
            //验证码
            ['method' => 'GET', 'route' => '/captcha','handler' => \FreeCMS\Www\Pages\Index\CaptchaPage::class],
            //首页
            ['method' => 'GET', 'route' => '/','handler' => \FreeCMS\Www\Pages\Index\IndexPage::class],
            //搜索
            ['method' => 'GET', 'route' => '/search', 'handler' => \FreeCMS\Www\Pages\Index\SearchPage::class],
            //单页详情
            ['method' => 'GET', 'route' => '/pages/{name}.html', 'handler' => \FreeCMS\Www\Pages\Index\SinglePage::class],
            //文档详情页
            ['method' => 'GET', 'route' => '/archives/{hash}.html', 'handler' => \FreeCMS\Www\Pages\Index\ArchivesPage::class],
            //文档属性获取
            ['method' => ['GET','POST'], 'route' => '/archives/{type}/{hash}', 'handler' => \FreeCMS\Www\Pages\Index\ArchiveAjax::class],
            //发布评论
            ['method' => 'POST', 'route' => '/archives/feedback/{arcid}','handler' => \FreeCMS\Www\Pages\Index\FeedbackAjax::class],
            //列表页
            ['method' => 'GET', 'route' => '/{channel:list|image|video|article}/{typedir}', 'handler' => \FreeCMS\Www\Pages\Index\ListPage::class],
        ],
        //**********************管理后台*********************//
        'admin'=>[
            //登录
            ['method' => 'GET', 'route' => '/login','handler' => \FreeCMS\Admin\Pages\Index\LoginPage::class],
            ['method' => 'POST', 'route' => '/login','handler' => \FreeCMS\Admin\Pages\Index\LoginAjax::class],
            //退出系统
            ['method' => 'GET', 'route' => '/quit','handler' => \FreeCMS\Admin\Pages\Index\QuitAjax::class],
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
            //评论管理
            ['method' => 'GET', 'route' => '/site/feedback', 'handler' => \FreeCMS\Admin\Pages\Site\FeedbackPage::class],
            ['method' => 'POST', 'route' => '/site/feedback/save', 'handler' => \FreeCMS\Admin\Pages\Site\FeedbackEditAjax::class],

            //菜单管理
            ['method' => 'GET', 'route' => '/system/menu', 'handler' => \FreeCMS\Admin\Pages\System\MenuPage::class],
            ['method' => 'GET', 'route' => '/system/menu/edit', 'handler' => \FreeCMS\Admin\Pages\System\MenuEditPage::class],
            ['method' => 'POST', 'route' => '/system/menu/save', 'handler' => \FreeCMS\Admin\Pages\System\MenuEditAjax::class],
            //配置
            ['method' => 'GET', 'route' => '/system/config', 'handler' => \FreeCMS\Admin\Pages\System\ConfigPage::class],
            ['method' => 'GET', 'route' => '/system/oss', 'handler' => \FreeCMS\Admin\Pages\System\OssPage::class],
            ['method' => 'GET', 'route' => '/system/config/edit', 'handler' => \FreeCMS\Admin\Pages\System\ConfigEditPage::class],
            ['method' => 'POST', 'route' => '/system/config/save', 'handler' => \FreeCMS\Admin\Pages\System\ConfigEditAjax::class],
            ['method' => 'POST', 'route' => '/system/oss/save', 'handler' => \FreeCMS\Admin\Pages\System\ConfigEditAjax::class],

            //单页管理
            ['method' => 'GET', 'route' => '/site/page', 'handler' => \FreeCMS\Admin\Pages\Site\SinglePage::class],
            ['method' => 'GET', 'route' => '/site/page/edit', 'handler' => \FreeCMS\Admin\Pages\Site\SingleEditPage::class],
            ['method' => 'POST', 'route' => '/site/page/save', 'handler' => \FreeCMS\Admin\Pages\Site\SingleEditAjax::class],
            //广告位管理
            ['method' => 'GET', 'route' => '/site/ad', 'handler' => \FreeCMS\Admin\Pages\Site\AdPage::class],
            ['method' => 'GET', 'route' => '/site/ad/view', 'handler' => \FreeCMS\Admin\Pages\Site\AdViewPage::class],
            ['method' => 'GET', 'route' => '/site/ad/edit', 'handler' => \FreeCMS\Admin\Pages\Site\AdEditPage::class],
            ['method' => 'POST', 'route' => '/site/ad/save', 'handler' => \FreeCMS\Admin\Pages\Site\AdEditAjax::class],

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
            ['method' => 'GET', 'route' => '/content/audio', 'handler' => \FreeCMS\Admin\Pages\Content\AudioPage::class],
            ['method' => 'GET', 'route' => '/content/audio/edit', 'handler' => \FreeCMS\Admin\Pages\Content\AudioEditPage::class],
            ['method' => 'GET', 'route' => '/content/video', 'handler' => \FreeCMS\Admin\Pages\Content\VideoPage::class],
            ['method' => 'GET', 'route' => '/content/video/edit', 'handler' => \FreeCMS\Admin\Pages\Content\VideoEditPage::class],
            ['method' => 'GET', 'route' => '/content/office', 'handler' => \FreeCMS\Admin\Pages\Content\OfficePage::class],
            ['method' => 'GET', 'route' => '/content/office/edit', 'handler' => \FreeCMS\Admin\Pages\Content\OfficeEditPage::class],

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

            //会员管理
            ['method' => 'GET', 'route' => '/member/member', 'handler' =>  \FreeCMS\Admin\Pages\Member\MemberPage::class],
            ['method' => 'GET', 'route' => '/member/member/edit', 'handler' =>  \FreeCMS\Admin\Pages\Member\MemberEditPage::class],
            ['method' => 'POST', 'route' => '/member/member/save', 'handler' =>  \FreeCMS\Admin\Pages\Member\MemberEditAjax::class],

            //论坛栏目
            ['method' => 'GET', 'route' => '/forum/column', 'handler' =>  \FreeCMS\Admin\Pages\Forum\ColumnPage::class],
            ['method' => 'GET', 'route' => '/forum/column/edit', 'handler' =>  \FreeCMS\Admin\Pages\Forum\ColumnEditPage::class],
            ['method' => 'POST', 'route' => '/forum/column/save', 'handler' =>  \FreeCMS\Admin\Pages\Forum\ColumnEditAjax::class],
            ['method' => 'GET', 'route' => '/forum/config', 'handler' =>  \FreeCMS\Admin\Pages\Forum\ConfigPage::class],
            ['method' => 'POST', 'route' => '/forum/config/save', 'handler' =>  \FreeCMS\Admin\Pages\System\ConfigEditAjax::class],
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
                //ueditor上传文件
                ['method' => ['GET','POST'], 'route' => '/ueditor/upload', 'handler' => \FreeCMS\Storage\Pages\UEditorAjax::class],
        ],
        //**********************会员中心*********************//
        'member'=>[
            //登录
            ['method' => 'GET', 'route' => '/login','handler' => \FreeCMS\Member\Pages\Index\LoginPage::class],
            ['method' => 'POST', 'route' => '/login','handler' => \FreeCMS\Member\Pages\Index\LoginAjax::class],
            //注册
            ['method' => 'GET', 'route' => '/register','handler' => \FreeCMS\Member\Pages\Index\RegisterPage::class],
            ['method' => 'POST', 'route' => '/register','handler' => \FreeCMS\Member\Pages\Index\RegisterAjax::class],
            //框架主页
            ['method' => 'GET', 'route' => '/','handler' => \FreeCMS\Member\Pages\Index\MainPage::class],
            ['method' => 'GET', 'route' => '/profile','handler' => \FreeCMS\Member\Pages\Index\ProfilePage::class],
            ['method' => 'POST', 'route' => '/profile/save','handler' => \FreeCMS\Member\Pages\Index\ProfileEditAjax::class],
            //主页
            ['method' => 'GET', 'route' => '/home','handler' => \FreeCMS\Member\Pages\Index\HomePage::class],
            //退出
            ['method' => 'GET', 'route' => '/quit','handler' => \FreeCMS\Member\Pages\Index\QuitAjax::class],
        ],
        //**********************论坛*********************//
        'forum'=>[
            ['method' => 'GET', 'route' => '/', 'handler' =>  FreeCMS\Forum\Pages\Index\IndexPage::class],
            ['method' => 'GET', 'route' => '/category/{cenid}.html', 'handler' =>  FreeCMS\Forum\Pages\Index\CategoryPage::class],
            ['method' => 'GET', 'route' => '/category/{cenid}/{p:\d+}.html', 'handler' =>  FreeCMS\Forum\Pages\Index\CategoryPage::class],
            ['method' => 'GET', 'route' => '/posts/{senid}.html', 'handler' =>  FreeCMS\Forum\Pages\Index\PostsPage::class],
            ['method' => 'GET', 'route' => '/posts/{senid}/{p:\d+}.html', 'handler' =>  FreeCMS\Forum\Pages\Index\PostsPage::class],
            ['method' => 'POST', 'route' => '/posts/{senid}', 'handler' =>  FreeCMS\Forum\Pages\Index\PostsAjax::class],
            ['method' => 'GET', 'route' => '/posts/new/{cenid}.html', 'handler' =>  FreeCMS\Forum\Pages\Index\PostsNewPage::class],
            ['method' => 'POST', 'route' => '/posts/new/{cenid}', 'handler' =>  FreeCMS\Forum\Pages\Index\PostsAjax::class],
            ['method' => 'GET', 'route' => '/search', 'handler' =>  FreeCMS\Forum\Pages\Index\SearchPage::class],
            ['method' => 'GET', 'route' => '/user/subject/{menid}.html', 'handler' =>  FreeCMS\Forum\Pages\Index\UserSubjectPage::class],
            ['method' => 'GET', 'route' => '/user/subject/{menid}/{p:\d+}.html', 'handler' =>  FreeCMS\Forum\Pages\Index\UserSubjectPage::class],
            ['method' => 'GET', 'route' => '/user/posts/{menid}.html', 'handler' =>  FreeCMS\Forum\Pages\Index\UserPostsPage::class],
            ['method' => 'GET', 'route' => '/user/posts/{menid}/{p:\d+}.html', 'handler' =>  FreeCMS\Forum\Pages\Index\UserPostsPage::class],
            ['method' => 'POST', 'route' => '/delete', 'handler' =>  FreeCMS\Forum\Pages\Index\DeleteAjax::class],
        ],
    ],
    'notFound'=>[
        //未找到返回的页面
        'cloud'=>\FreeCMS\Storage\Pages\IndexAjax::class,
    ]
];