<?php
/**
 * Class [MemberEditPage]
 * 会员编辑页面
 * author minyifei
 * date 2019/3/4
 */

namespace FreeCMS\Admin\Pages\Member;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Model\CmsMemberModel;

class MemberEditPage extends BaseAdminPage
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
            $model = new CmsMemberModel();
            $row = $model->findById($id);
            $this->assign('data',$row);
        }
        $this->display();
    }
}