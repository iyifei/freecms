<?php
/**
 * Class [RegisterAjax]
 * 会员注册
 * author minyifei
 * date 2019/3/3
 */

namespace FreeCMS\Member\Pages\Index;


use FreeCMS\Common\Exception\FreeCmsException;
use FreeCMS\Common\Model\CmsMemberModel;
use FreeCMS\Member\BaseMemberPage;

class RegisterAjax extends BaseMemberPage
{

    protected $declareNeedLogin = false;

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $userId = requestNotEmpty('userid');
        $pwd = requestNotEmpty('pwd');
        $email = requestNotEmpty('email');
        $vcode = requestNotEmpty('vcode');
        if(session('captcha')!=$vcode){
            FreeCmsException::throwParamExp('验证码错误');
        }
        if(strlen($userId)<6 || strlen($userId)>20){
            FreeCmsException::throwParamExp('登录名长度为6~20位');
        }
        $mem = new CmsMemberModel();
        $count = $mem->where('userid=:userId',['userId'=>$userId])->count();
        if($count>0){
            FreeCmsException::throwParamExp('登录名已经存在');
        }
        $count = $mem->where('email=:email',['email'=>$email])->count();
        if($count>0){
            FreeCmsException::throwParamExp('注册邮箱已经存在');
        }
        $ip = getClientIP();
        $now = getCurrentTime();
        $data  = [
            'userid'=>$userId,
            'pwd'=>encodePassword($pwd),
            'email'=>$email,
            'jointime'=>$now,
            'joinip'=>$ip,
            'loginip'=>$ip,
            'logintime'=>$now,
        ];
        $uid = $mem->add($data);
        $member = $mem->findById($uid);
        session('current_member',$member);
        session('captcha',null);
        $this->successJson('ok');
    }
}