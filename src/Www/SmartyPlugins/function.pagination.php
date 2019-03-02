<?php
/**
 * 列表页-分页信息
 * author minyifei
 * date 2018/11/28
 */

function smarty_function_pagination($params, &$smarty) {
    @$type = get_object_vars($smarty->tpl_vars["freecms"]);
    $arctype = $type["value"];
    if($arctype['type']=='list'){
        //页码
        $params["page"] = intval($arctype["page"]);
        $page = $params["page"];
        if ($page <= 1) {
            $page = 1;
        }
        //每页显示数量
        $pagesize = intval(getParamsValue($params,'pagesize',20));
        //读取所属栏目分类
        $params['typeid']=$arctype['id'];
        $where = 'typeid=:typeid';
        $bind = ['typeid'=>$arctype['id']];
        $model = new \FreeCMS\Common\Model\CmsArchivesModel();
        $total = $model->where($where,$bind)->count();
        $pager = new \FreeCMS\Common\Libs\Pagination($pagesize,$total,$page);
        return $pager->show();
    }else{
        return '';
    }
}