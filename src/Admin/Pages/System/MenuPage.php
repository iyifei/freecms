<?php

namespace FreeCMS\Admin\Pages\System;

use FreeCMS\Common\Libs\Tree;
use FreeCMS\Common\Model\CmsMenuModel;
use FreeCMS\Admin\BaseAdminPage;

/**
 * Class [MenuPage]
 * 后台菜单管理
 */
class MenuPage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     *
     * @return mixed
     */
    function execute($vars = [])
    {
        $model = new CmsMenuModel();
        $rows = $model->findAllMenu();
        $tree = new Tree();
        $tree->init($rows);
        $treeData = $tree->get_tree_list();
        $this->assign('datas',$treeData);
        $this->display();
    }
}