<?php
/**
 * Class [ColumnEditAjax]
 * 论坛栏目管理
 */

namespace FreeCMS\Admin\Pages\Forum;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Model\CmsForumColumnModel;
use FreeCMS\Common\Model\CmsMenuModel;

class ColumnEditAjax extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     *
     * @return mixed
     */
    function execute($vars = [])
    {
        $model = new CmsForumColumnModel();
        $method = request('method');
        if($method==EditType::Delete){
            //删除
            $id = getInteger('id');
            $model->deleteById($id);
        }elseif($method==EditType::Edit){
            //更新个别字段
            $key = post('key');
            $val = post('val');
            $data = [
                $key=>$val,
            ];
        }elseif($method==EditType::Batch){
            //批量更新
            $listStr = post('list');
            $list = json_decode($listStr,true);
            if(!empty($list)){
                foreach ($list as $item){
                    $id = intval($item['id']);
                    $ud = [
                        $item['key']=>$item['val']
                    ];
                    $model->updateById($id,$ud);
                }
            }
        }else{
            //上级id
            $pid = getInteger('pid',0);
            //菜单名称
            $name = requestNotEmpty('name');
            //排序
            $sortrank = getInteger('sortrank',50);
            //图标
            $icon = post('icon');
            //描述
            $description = post('description');

            $data = [
                'name'=>$name,
                'pid'=>$pid,
                'sortrank'=>$sortrank,
                'icon'=>$icon,
                'description'=>$description,
            ];
        }
        switch ($method){
            case EditType::Add:
                $model->add($data);
                break;
            case EditType::Update:
            case EditType::Edit:
                $id = getInteger('id',0);
                $model->updateById($id,$data);
                break;
        }
        $this->successJson('ok');
    }

}