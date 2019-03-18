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
        $this->assign('forum',config('forum'));
        $member = $this->getCurrentMember();
        $this->assign('CurrentMember',$member);
    }


    //执行前处理
    public function beforeExecute() {

        parent::beforeExecute();

        $this->smarty->addPluginsDir(APP_PATH.'/SmartyPlugins');

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
            $go = $_SERVER['REQUEST_URI'];
            jumpUrl(getBaseURL().'/member/login?go='.$go);
        }

    }

    public function getCurrentMember(){
        return session("current_member");
    }

    public function getCurrentMemberId(){
        $mem = $this->getCurrentMember();
        if(!empty($mem)){
            $mid = $mem['id'];
        }else{
            $mid = 0;
        }
        return $mid;
    }

    public function getAdminRoleId(){
        $admin = session('admin');
        if(!empty($admin)){
            $roleId = $admin['roleid'];
        }else{
            $roleId = 0;
        }
        return $roleId;
    }

    /**
     * Function:getPosition
     * 获取位置信息
     *
     * @param $list
     *
     * @return string
     */
    protected function getPosition($list){
        $ul = '<ul class="breadcrumb">';
        $ul.=sprintf('<li><a href="%s">%s</a>',getBaseURL().'/forum','论坛首页');
        foreach ($list as $item){
            $ul.= sprintf('<li><a href="%s">%s</a>',$item['url'],$item['name']);
        }
        $ul.='<li class="active">&nbsp;</li>';
        $ul.='</ul>';
        return $ul;
    }
}