<?php
/**
 * Class [AdViewPage]
 * 预览效果
 * author minyifei
 * date 2019/3/13
 */

namespace FreeCMS\Admin\Pages\Site;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Model\CmsAdModel;

class AdViewPage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $id = getInteger('id');
        $model = new CmsAdModel();
        $ad = $model->findById($id);
        $this->assign('data',$ad);
        $this->display();
    }
}