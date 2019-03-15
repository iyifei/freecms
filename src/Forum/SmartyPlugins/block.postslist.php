<?php

/**
 * Function:smarty_block_arclist
 * 论坛回帖列表
 *
 * @param array $params 参数
 * @param $content
 * @param \FreeCMS\Common\Libs\FreeCmsSmarty $smarty
 * @param $repeat
 *
 * @return void
 */
function smarty_block_postslist($params,$content,&$smarty,&$repeat){
    //获取列表页当前栏目信息
    @$type = get_object_vars($smarty->tpl_vars["freecms"]);
    $arctype = $type["value"];
    $params['page']=$arctype['page'];
    //循环id
    $params['id'] = getParamsValue($params, 'id', 'arc');

    //index
    $keyIndex = getParamsValue($params, 'key', 'k');
    //排序字段
    $orderBy = getParamsValue($params, 'orderby', 'id');
    if (!in_array($orderBy, ['id', 'lasttime', 'replies'])) {
        $orderBy = 'id';
    }
    //排序方式
    $orderWay = getParamsValue($params, 'orderway', 'asc');
    if (!in_array($orderWay, ['asc', 'desc'])) {
        $orderWay = 'desc';
    }
    //所属栏目id
    $colunmId = $arctype['id'];
    $params['pagesize']=intval(getParamsValue($params,'pagesize',20));

    $dataIndex = md5(__FUNCTION__ . md5(serialize($params)));
    $data = $smarty->getBlockData($dataIndex);
    if(!isset($data)){
        $bind = [];
        $where='sid=:sid';
        $bind['sid']=$colunmId;
        //读取第几页
        $page = $params["page"];
        if ($page <= 1) {
            $page = 1;
        }
        $start = ($page - 1) * $params['pagesize'];
        $model = new \FreeCMS\Common\Model\CmsForumPostsModel();
        $rows =$model->link('member')
                     ->where($where,$bind)
                     ->orderBy(sprintf("%s %s", $orderBy, $orderWay))
                     ->limit($start,$params['pagesize'])->findAll();
        if(!empty($rows)) {
            $rows = $model->formatRows($rows,$start);
            $smarty->setBlockData($dataIndex, $rows);
            $data = $rows;
        }
    }
    if(isset($data) && is_array($data)){
        $index = count($data);
        //读取一条记录删除一条记录
        $item = array_shift($data);
        $item[$keyIndex] = $index;
        $smarty->assign($params['id'],$item);
        if(count($data)==0){
            $smarty->setBlockData($dataIndex,false);
        }else{
            $smarty->setBlockData($dataIndex,$data);
        }
        $repeat = true;
    }else{
        $smarty->setBlockData($dataIndex,null);
        $repeat = false;
    }
    echo $content;
}