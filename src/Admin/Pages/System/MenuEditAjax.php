<?php
/**
 * Class [MenuEditAjax]
 * 菜单处理
 */

namespace FreeCMS\Admin\Pages\System;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Model\CmsMenuModel;

class MenuEditAjax extends BaseAdminPage
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
        $model = new CmsMenuModel();
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
            //访问地址
            $url = post('url');
            //排序
            $sortrank = getInteger('sortrank',50);
            //是否隐藏
            $ishide = getInteger('ishide');
            //图标
            $icon = post('icon');

            //级别
            $level = 1;
            $topid = 0;
            if($pid>0){
                $prow = $model->field('level,topid,id')->findById($pid);
                $pl = intval($prow['level']);
                $level = $pl + 1;
                $topid = $level>2?intval($prow['topid']):intval($prow['id']);
            }
            $data = [
                'topid'=>$topid,
                'name'=>$name,
                'level'=>$level,
                'pid'=>$pid,
                'url'=>$url,
                'sortrank'=>$sortrank,
                'ishide'=>$ishide,
                'icon'=>$icon,
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