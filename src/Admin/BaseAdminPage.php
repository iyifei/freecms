<?php
namespace FreeCMS\Admin;

use FreeCMS\Common\Libs\Page;

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
        return SYS_PATH.'/themes/'.config('theme.default');
    }


}