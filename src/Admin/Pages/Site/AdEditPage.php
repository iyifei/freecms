<?php
/**
 * Class [AdEditPage]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/13
 */

namespace FreeCMS\Admin\Pages\Site;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Libs\Utils;
use FreeCMS\Common\Model\CmsAdModel;

class AdEditPage extends BaseAdminPage
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
            $model = new CmsAdModel();
            $row = $model->findById($id);
            $this->assign('data',$row);
        }else{
            $data =[
                'uuid'=>Utils::getLogId(),
            ];
            $this->assign('data',$data);
        }
        $this->display();
    }
}