<?php
/**
 * Class [RoleEditPage]
 * 请描述类的功能
 * author minyifei
 * date 2018/11/22
 */

namespace FreeCMS\Admin\Pages\System;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Exception\FreeCmsException;
use FreeCMS\Common\Model\CmsMenuModel;
use FreeCMS\Common\Model\CmsRoleModel;

class RoleEditPage extends BaseAdminPage
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
        $rows = (new CmsMenuModel())->findAllMenu();
        $menu = [];
        foreach ($rows as $row){
            $menu[]=[
                'id'=>$row['id'],
                'parent'=>$row['pid']==0?"#":$row['pid'],
                'text'=>$row['name'],
            ];
        }
        $this->assign('menuJson',json_encode($menu));

        if($method==EditType::Update){
            $id = getInteger('id',0);
            if($id==1){
                FreeCmsException::throwParamExp('系统管理员无法编辑');
            }
            $model = new CmsRoleModel();
            $row = $model->findById($id);
            $this->assign('data',$row);
        }
        $this->display();
    }
}