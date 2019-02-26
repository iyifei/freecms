<?php
/**
 * Class [RolePage]
 * 角色管理
 * author minyifei
 * date 2018/11/22
 */

namespace FreeCMS\Admin\Pages\System;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Model\CmsRoleModel;

class RolePage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $model = new CmsRoleModel();
        $rows = $model->orderBy('id desc')->findAll();
        $this->assign('datas',$rows);
        $this->display();
    }
}