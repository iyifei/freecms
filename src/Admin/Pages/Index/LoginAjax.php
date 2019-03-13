<?php
/**
 * Class [LoginAjax]
 * 请描述类的功能
 * author minyifei
 * date 2018/11/23
 */

namespace FreeCMS\Admin\Pages\Index;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Exception\FreeCmsException;
use FreeCMS\Common\Model\CmsAdminModel;

class LoginAjax extends BaseAdminPage
{

    protected $declareNeedLogin = false;
    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        //验证码
        $vcode = requestNotEmpty('vcode');
        $userid = requestNotEmpty('userid');
        $pwd = requestNotEmpty('pwd');
        //校验验证码
        $scode = session('captcha');
        if($scode!=$vcode){
            FreeCmsException::throwParamExp('图片验证码错误');
        }
        $model = new CmsAdminModel();
        $row = $model->link('role')->find('userid',$userid);
        if($row && $row['pwd']==encodePassword($pwd,$userid)){
            //清除验证码
            session('captcha',null);
            session('admin',$row);
            //查询角色及权限信息
            $this->successJson('ok');
        }else{
            FreeCmsException::throwParamExp('账号或密码错误');
        }
    }
}