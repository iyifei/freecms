<?php
/**
 * 列表页-分页信息
 * author minyifei
 * date 2018/11/28
 */

function smarty_function_page($params, &$smarty) {
    @$type = get_object_vars($smarty->tpl_vars["freecms"]);
    $arctype = $type["value"];
    //页码
    $params["page"] = intval($arctype["page"]);
    $page = $params["page"];
    if ($page <= 1) {
        $page = 1;
    }
    $total = 0;
    $link = null;
    //每页显示数量
    $pagesize = intval(getParamsValue($params,'pagesize',20));
    if($arctype['pagetype']=='subject'){
        //读取所属栏目分类
        $params['cid']=$arctype['id'];
        $where = 'cid=:cid';
        $bind = ['cid'=>$arctype['id']];
        $model = new \FreeCMS\Common\Model\CmsForumSubjectModel();
        $total = $model->where($where,$bind)->count();
        $cenid = $arctype['cenid'];
        $link = getBaseURL()."/forum/category/{$cenid}/%d.html";
    }elseif($arctype['pagetype']=='posts'){
        //读取所属栏目分类
        $params['sid']=$arctype['id'];
        $where = 'sid=:sid';
        $bind = ['sid'=>$arctype['id']];
        $model = new \FreeCMS\Common\Model\CmsForumPostsModel();
        $total = $model->where($where,$bind)->count();
        $senid = $arctype['senid'];
        $link = getBaseURL()."/forum/posts/{$senid}/%d.html";
    }elseif($arctype['pagetype']=='search'){
        //读取所属栏目分类
        $params['keyword']=$arctype['keyword'];
        $where = 'title like :title';
        $bind = ['title'=>"%{$params['keyword']}%"];
        $model = new \FreeCMS\Common\Model\CmsForumSubjectModel();
        $total = $model->where($where,$bind)->count();
    }
    $pager = new \FreeCMS\Common\Libs\Pagination($pagesize,$total,$page,$link);
    return $pager->showBootstrap();
}