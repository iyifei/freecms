<?php
/**
 * Class [ProfileEditAjax]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/18
 */

namespace FreeCMS\Member\Pages\Index;


use FreeCMS\Common\Model\CmsMemberModel;
use FreeCMS\Member\BaseMemberPage;

class ProfileEditAjax extends BaseMemberPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $mid = $this->getCurrentMemberId();
        $uname = requestNotEmpty('uname');
        $email = requestNotEmpty('email');
        $avatar = post('avatar');
        $pwd = post('pwd');
        $data = [
            'uname'=>$uname,
            'email'=>$email,
            'avatar'=>$avatar,
        ];
        if(!empty($pwd)){
            $data['pwd']=encodePassword($pwd);
        }
        (new CmsMemberModel())->updateById($mid,$data);
        $this->successJson('ok');
    }
}