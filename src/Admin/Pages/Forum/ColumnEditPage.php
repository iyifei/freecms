<?php
/**
 * Class [MenuEditPage]
 * 菜单编辑页面
 */

namespace FreeCMS\Admin\Pages\Forum;


use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Libs\Tree;
use FreeCMS\Common\Model\CmsForumColumnModel;
use FreeCMS\Admin\BaseAdminPage;

class ColumnEditPage extends BaseAdminPage
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
        $method = request('method');
        $this->assign('method',$method);
        //上级id
        $pid = getInteger('pid', 0);

        $model = new CmsForumColumnModel();
        $where='1=1';
        if($method==EditType::Update){
            $id = getInteger('id',0);
            $row = $model->findById($id);
            $pid = $row['pid'];
            $this->assign('data',$row);
            $where = sprintf("id!=%d and pid!=%d",$id,$id);
        }
        //排查
        $rows = $model->where($where)->orderBy('sortrank asc,id asc')->findAll();
        $tree = new Tree();
        $tree->init($rows);
        $treeData = $tree->get_tree_list();
        $this->assign('menus',$treeData);

        $this->assign('pid', $pid);
        $this->display();
    }
}