<?php
/**
 * Class [FlinkPage]
 * 请描述类的功能
 * author minyifei
 * date 2018/11/19
 */

namespace FreeCMS\Admin\Pages\Site;


use FreeCMS\Common\Model\CmsFlinkModel;
use FreeCMS\Admin\BaseAdminPage;

class FlinkPage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $subgroup = get('subgroup');
        $where = '1=1';
        $bind = [];
        if(!empty($subgroup)){
            $where.=' and subgroup=:subgroup';
            $bind['subgroup']=$subgroup;
        }
        $model = new CmsFlinkModel();
        $rows = $model->where($where,$bind)->orderBy('sortrank asc,id desc')->findAll();
        $this->assign('datas',$rows);
        $this->display();
    }
}