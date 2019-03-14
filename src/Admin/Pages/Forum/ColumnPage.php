<?php

namespace FreeCMS\Admin\Pages\Forum;

use FreeCMS\Common\Libs\Tree;
use FreeCMS\Common\Model\CmsForumColumnModel;
use FreeCMS\Common\Model\CmsMenuModel;
use FreeCMS\Admin\BaseAdminPage;

/**
 * Class [MenuPage]
 * 后台菜单管理
 */
class ColumnPage extends BaseAdminPage
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
        $model = new CmsForumColumnModel();
        $rows = $model->findAllMenu();
        $tree = new Tree();
        $tree->init($rows);
        $treeData = $tree->get_tree_list();
        $this->assign('datas',$treeData);
        $this->display();
    }
}