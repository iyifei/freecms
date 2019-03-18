<?php
/**
 * Class [LoginAjax]
 * 登录
 * author minyifei
 * date 2019/3/3
 */

namespace FreeCMS\Member\Pages\Index;


use FreeCMS\Common\Exception\ErrorCode;
use FreeCMS\Common\Exception\FreeCmsException;
use FreeCMS\Common\Model\CmsMemberModel;
use FreeCMS\Member\BaseMemberPage;

class LoginAjax extends BaseMemberPage
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
        $vcode = requestNotEmpty('vcode');
        if(session('captcha')!=$vcode){
            FreeCmsException::throwParamExp('验证码错误');
        }
        $model  = new CmsMemberModel();
        $member = $model->where('userid=:userId',['userId'=>$userId])->findFirst();
        if($member && $member['pwd']==encodePassword($pwd)){
            session('captcha',null);
            $member = $model->formatMember($member);
            session('current_member',$member);
            $this->successJson('ok');
        }else{
            FreeCmsException::throwExp(ErrorCode::AUTH_LOGIN_ERROR,'用户名或密码错误');
        }
    }
}