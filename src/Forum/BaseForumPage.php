<?php
/**
 * Class [BaseForumPage]
 * 论坛基础类
 * author minyifei
 * date 2019/3/14
 */

namespace FreeCMS\Forum;


use FreeCMS\Common\Libs\Page;
use FreeCMS\Common\Libs\Utils;

abstract class BaseForumPage extends Page
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
//        $token = session(self::CLOUD_TOKEN_KEY);
//        if(empty($token)){
//            $token = Utils::getUUID();
//            session(self::CLOUD_TOKEN_KEY,$token);
//        }
//        $this->assign('uploadFileUrl',getLocalOssDomain().'/upload?token='.$token);
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

    public function getCurrentMember(){
        return session("current_member");
    }

    public function getCurrentMemberId(){
        $mem = $this->getCurrentMember();
        return $mem['id'];
    }
}