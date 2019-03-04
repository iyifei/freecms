<?php
/**
 * 评论-分页信息
 * author minyifei
 * date 2018/11/28
 */

function smarty_function_feedbackpagination($params, &$smarty) {
    //获取列表页当前栏目信息
    @$arcx = get_object_vars($smarty->tpl_vars["freecms"]);
    $arc = $arcx["value"];
    $wheres = 'aid=:aid and ischeck=1';
    $bind = [
        'aid'=>$arc['id'],
    ];
    //每页返回记录数
    $params['pagesize']=intval(getParamsValue($params,'pagesize',20));
    $page = getInteger('p',0);
    if($page<1){
        $page  = 1;
    }
    $params["page"] = $page;
    $params['start']=($page-1)*$params['pagesize'];
    //每页显示数量
    $pagesize = intval(getParamsValue($params,'pagesize',20));

    $arcModel = new \FreeCMS\Common\Model\CmsFeedbackModel();
    $total = $arcModel->where($wheres,$bind)->count();
    $pager = new \FreeCMS\Common\Libs\Pagination($pagesize,$total,$page);
    return $pager->show();
}