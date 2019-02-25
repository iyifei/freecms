<?php
/**
 * Class [SinglePage]
 * 单页管理
 * author minyifei
 * date 2018/11/19
 */

namespace FreeCMS\Admin\Pages\Site;


use FreeCMS\Common\Model\CmsPageModel;
use FreeCMS\Admin\BaseAdminPage;

class SinglePage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $model = new CmsPageModel();
        $rows = $model->field('id,sortrank,subgroup,title,filename,uptime,template ')
                      ->orderBy('sortrank asc,id desc')
                      ->findAll();
        $this->assign('datas',$rows);
        $this->display();
    }
}