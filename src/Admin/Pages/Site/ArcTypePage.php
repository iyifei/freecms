<?php
/**
 * Class [ArcTypePage]
 * 栏目管理
 */

namespace FreeCMS\Admin\Pages\Site;


use FreeCMS\Common\Libs\Tree;
use FreeCMS\Common\Model\CmsArctypeModel;
use FreeCMS\Admin\BaseAdminPage;

class ArcTypePage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $model = new CmsArctypeModel();
        $rows = $model->findAllArcType();
        $tree = new Tree();
        $tree->init($rows);
        $treeData = $tree->get_tree_list();
        $this->assign('datas',$treeData);
        $this->display();
    }
}