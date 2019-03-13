<?php
/**
 * Class [AdPage]
 * 广告管理
 * author minyifei
 * date 2019/3/12
 */

namespace FreeCMS\Admin\Pages\Site;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Model\CmsAdModel;

class AdPage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $model = new CmsAdModel();
        $rows = $model->field('id,uuid,name,timetype,starttime,endtime')->orderBy('id desc')->findAll();
        $this->assign('rows',$rows);
        $this->display();
    }
}