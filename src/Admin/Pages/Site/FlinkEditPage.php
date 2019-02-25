<?php
/**
 * Class [FlinkEditPage]
 * 请描述类的功能
 * author minyifei
 * date 2018/11/19
 */

namespace FreeCMS\Admin\Pages\Site;


use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Model\CmsFlinkModel;
use FreeCMS\Admin\BaseAdminPage;

class FlinkEditPage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $method = requestNotEmpty('method');
        $this->assign('method',$method);
        if($method==EditType::Update){
            $id = getInteger('id');
            $model = new CmsFlinkModel();
            $row = $model->findById($id);
            $this->assign('data',$row);
        }
        $this->display();
    }
}