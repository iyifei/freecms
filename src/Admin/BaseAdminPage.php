<?php
namespace FreeCMS\Admin;

use FreeCMS\Common\Libs\Page;
use FreeCMS\Common\Libs\Tree;
use FreeCMS\Common\Model\CmsMenuModel;

/**
 * Class [BaseAdminPage]
 * 管理后台基础页面抽象类库
 * author minyifei
 * date 2019/2/22
 */
abstract class BaseAdminPage extends Page
{

    public function __construct()
    {
        //文件目录
        define('APP_PATH',__DIR__);
    }

    /**
     * @var bool 是否需要登录状态
     */
    protected $declareNeedLogin = true;

    /**
     * 可继承重写登陆与签名状态
     */
    protected function declarations(){
        $route = $this->getRoute();
        $this->assign('route',$route);
    }

    //执行前处理
    public function beforeExecute() {

        parent::beforeExecute();

        //执行重置状态
        $this->declarations();

        //校验登录状态
        if($this->declareNeedLogin){
            $this->declareLogin();
        }
    }

    //登录处理
    protected function declareLogin(){
        //登录校验
        $admin = session('admin');
        if(empty($admin)){
            //jumpUrl(getBaseURL().'/');
        }

        //获取系统菜单信息
        $m = new CmsMenuModel();
        $menus  = $m->findAllMenu();
        $menuTree = easyuitree($menus);
        $this->assign('menuTree',$menuTree);
        $this->assign('menuJson',json_encode($menus));
    }

    //获取路由
    protected function getRoute(){
        $s = request('_s');
        $s = trim($s,'/');
        list($firstRoute,$secondRoute,$threeRoute) = explode('/',$s);
        $urls = array_unique([$firstRoute,$secondRoute]) ;

        $route = [
            'first'=>$firstRoute,
            'second'=>$secondRoute,
            'three'=>$threeRoute,
            'url'=>join('/',$urls),
        ];
        return $route;
    }

    /**
     * Function:getThemePath
     * 获取前端模板位置
     *
     * @return string
     */
    protected function getThemePath(){
        return SYS_PATH.'/themes/'.config('base.theme');
    }

    /**
     * Function:getCurrentTheme
     * 获取当前模板名称
     *
     * @return string
     */
    protected function getCurrentTheme(){
        return config('base.theme');
    }


    /**
     * 基础模板
     */
    protected function defaultTemplates() {
        $templates = array();
        $templates[] = array("filename" => "index.tpl", "info" => "首页模板");
        $templates[] = array("filename" => "top.tpl", "info" => "顶部通用模板");
        $templates[] = array("filename" => "bottom.tpl", "info" => "底部通用模板");

        $templates[] = array("filename" => "article_face_default.tpl", "info" => "文章封面页模板");
        $templates[] = array("filename" => "article_list_default.tpl", "info" => "文章列表页模板");
        $templates[] = array("filename" => "article_archive_default.tpl", "info" => "文章内容页模板");

        $templates[] = array("filename" => "image_list_default.tpl", "info" => "图片列表页模板");
        $templates[] = array("filename" => "image_archive_default.tpl", "info" => "图片内容页模板");
        $templates[] = array("filename" => "image_face_default.tpl", "info" => "图片封面页模板");

        $templates[] = array("filename" => "single_default.tpl", "info" => "单页模板");
        $templates[] = array("filename" => "search_default.tpl", "info" => "搜索模板");
        return $templates;
    }


}