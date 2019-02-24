<?php
/**
 * Class [ArcTypeEditPage]
 * 栏目编辑页面
 */

namespace FreeCMS\Admin\Pages\Site;


use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Libs\File;
use FreeCMS\Common\Libs\Tree;
use FreeCMS\Common\Model\CmsArctypeModel;
use FreeCMS\Admin\BaseAdminPage;

class ArcTypeEditPage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $method = request('method');
        $this->assign('method',$method);

        //上级id
        $pid = getInteger('pid', 0);

        $model = new CmsArctypeModel();
        $where='id<0';
        if($method==EditType::Update){
            $id = getInteger('id',0);
            $row = $model->findById($id);
            $pid = $row['pid'];
            $this->assign('data',$row);
            $where = sprintf("id!=%d and pid!=%d and channel='%s'",$id,$id,$row['channel']);
        }else{
            if($pid>0){
                $row = $model->findById($pid);
                $where = sprintf("channel='%s'",$row['channel']);
            }
        }
        $this->assign('channel',$row['channel']);
        //排查
        $rows = $model->where($where)->orderBy('sortrank asc,id asc')->findAll();
        $tree = new Tree();
        $tree->init($rows);
        $treeData = $tree->get_tree_list();
        $this->assign('arctypes',$treeData);
        $this->assign('pid', $pid);

        $this->getTemplates();

        $this->display();
    }

    /**
     * 读取模板
     */
    private function getTemplates() {
        $path = $this -> getThemePath();
        $pcList = File::dirList($path);
        $templates = $this -> getTempByList($pcList);
        $this -> assign("templates", $templates);
        $this->assign('templatesJson',json_encode($templates));
    }

    private function getTempByList($list) {
        $templates = array();
        foreach ($list as $value) {
            $arr = explode("_", $value);
            if (count($arr) > 2) {
                $templates[$arr[0]][$arr[1]][]=$value;
            }
        }
        return $templates;
    }
}