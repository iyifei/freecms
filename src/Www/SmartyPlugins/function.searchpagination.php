<?php
/**
 * 搜索页-分页信息
 * author minyifei
 * date 2018/11/28
 */

function smarty_function_searchpagination($params, &$smarty) {
    //获取列表页当前栏目信息
    @$type = get_object_vars($smarty->tpl_vars["freecms"]);
    $freecms = $type["value"];

    $wheres = [];
    $bind = [];
    //循环id
    $params['id'] = getParamsValue($params,'id','arc');
    //每页返回记录数
    $params['pagesize']=intval(getParamsValue($params,'pagesize',20));
    $params["page"] = intval($freecms["page"]);
    $params['keyword']=$freecms['keyword'];
    //栏目id
    $params['typeid']=intval($freecms['typeid'],0);
    if($params['typeid']>0){
        $wheres[]='typeid=:typeid';
        $bind['typeid']=$params['typeid'];
    }

    $params["page"] = intval($freecms["page"]);
    $page = $params["page"];
    if ($page <= 1) {
        $page = 1;
    }
    //每页显示数量
    $pagesize = intval(getParamsValue($params,'pagesize',20));

    if(!empty($params['keyword'])){
        $wheres[]="title like :keyword";
        $bind['keyword']="%{$params['keyword']}%";

        $arcModel = new \FreeCMS\Common\Model\CmsArchivesModel();

        $total = $arcModel->where(join(' AND ',$wheres),$bind)->count();
        $pager = new \FreeCMS\Common\Libs\Pagination($pagesize,$total,$page);
        return $pager->show();
    }else{
        return '';
    }
}