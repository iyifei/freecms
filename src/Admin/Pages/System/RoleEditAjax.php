<?php
/**
 * Class [RoleEditAjax]
 * 请描述类的功能
 * author minyifei
 * date 2018/11/22
 */

namespace FreeCMS\Admin\Pages\System;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Model\CmsRoleModel;

class RoleEditAjax extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $method = requestNotEmpty('method');
        $model = new CmsRoleModel();
        if ($method == EditType::Delete) {
            //删除
            $id = getInteger('id', 0);
            $model->deleteById($id);
        }else{
            //添加 or 更新
            $name = requestNotEmpty('name');
            $menuids = post('menuids');
            $remark = post('remark');
            $data = [
                'name'=>$name,
                'menuids'=>$menuids,
                'remark'=>$remark,
            ];
            if($method==EditType::Update){
                $id = getInteger('id',0);
                $model->updateById($id,$data);
            }else{
                $model->add($data);
            }
        }
        $this->successJson('ok');
    }
}