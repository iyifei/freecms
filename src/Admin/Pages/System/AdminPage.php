<?php
/**
 * Class [AdminPage]
 * 请描述类的功能
 * author minyifei
 * date 2018/11/22
 */

namespace FreeCMS\Admin\Pages\System;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Model\CmsAdminModel;
use FreeCMS\Common\Model\CmsRoleModel;

class AdminPage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $roleId = getInteger('role',0);
        $model = new CmsAdminModel();
        if($roleId>0){
            $model = $model->where('roleid=:roleId',['roleId'=>$roleId]);
            $role =  (new CmsRoleModel())->findById($roleId);
            $this->assign('role',$role);
        }
        $rows = $model->link('role')->orderBy('id desc')->findAll();
        $this->assign('datas',$rows);
        $this->display();
    }
}