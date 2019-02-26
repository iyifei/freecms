<?php
/**
 * Class [AdminEditAjax]
 * 请描述类的功能
 * author minyifei
 * date 2018/11/22
 */

namespace FreeCMS\Admin\Pages\System;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Exception\FreeCmsException;
use FreeCMS\Common\Model\CmsAdminModel;

class AdminEditAjax extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $method = requestNotEmpty('method');
        $model = new CmsAdminModel();
        if($method==EditType::Delete){
            //删除
            $id = getInteger('id',0);
            if($id==1){
                FreeCmsException::throwParamExp('初始管理员禁止删除');
            }
            $model->deleteById($id);
        }else{
            //添加 or 更新
            $userid = post('userid');
            $pwd = post('pwd');
            $rname = post('rname');
            $email = post('email');
            $roleid = getInteger('roleid',0);
            if($roleid<1){
                FreeCmsException::throwParamExp('请选择正确的角色');
            }
            $data = [
                'userid'=>$userid,
                'rname'=>$rname,
                'email'=>$email,
                'roleid'=>$roleid,
            ];
            if(!empty($pwd)){
                $data['pwd']=encodePassword($pwd,$userid);
            }
            if($method==EditType::Update){
                $id = getInteger('id',0);
                $model->updateById($id,$data);
            }else{
                $old = $model->find('userid',$userid);
                if($old){
                    FreeCmsException::throwParamExp('登录名重复了！！！');
                }
                $model->add($data);
            }
        }
        $this->successJson('ok');
    }
}