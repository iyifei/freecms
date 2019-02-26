<?php
/**
 * Class [AdminEditPage]
 * 请描述类的功能
 * author minyifei
 * date 2018/11/22
 */

namespace FreeCMS\Admin\Pages\System;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Model\CmsAdminModel;
use FreeCMS\Common\Model\CmsRoleModel;

class AdminEditPage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $method = requestNotEmpty('method');
        $this->assign('method',$method);
        //角色
        $roleModel = new CmsRoleModel();
        $roles = $roleModel->field('id,name')->findAll();
        $this->assign('roles',$roles);

        if($method==EditType::Update){
            $id = getInteger('id',0);
            $model = new CmsAdminModel();
            $row = $model->findById($id);
            $this->assign('data',$row);
        }
        $this->display();
    }
}