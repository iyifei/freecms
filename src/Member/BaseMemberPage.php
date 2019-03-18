<?php
/**
 * Class [BaseMemberPage]
 * 会员基础页面
 * author minyifei
 * date 2019/3/3
 */

namespace FreeCMS\Member;


use FreeCMS\Common\Libs\Page;
use FreeCMS\Common\Libs\Utils;
use FreeCMS\Common\Model\CmsMenuModel;

abstract class BaseMemberPage extends Page
{

    const CLOUD_TOKEN_KEY = 'FreeCMS_Cloud_Token';

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

        $token = session(self::CLOUD_TOKEN_KEY);
        if(empty($token)){
            $token = Utils::getUUID();
            session(self::CLOUD_TOKEN_KEY,$token);
        }
        $this->assign('uploadFileUrl',getLocalOssDomain().'/upload?token='.$token);
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
        $member = session('current_member');
        if(empty($member)){
            jumpUrl(getBaseURL().'/member/login');
        }

        $this->assign('CurrentMember',$member);
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

}