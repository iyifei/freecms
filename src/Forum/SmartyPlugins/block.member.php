<?php

/**
 * Function:smarty_block_member
 * 会员列表
 *
 * @param array $params 参数
 * @param $content
 * @param \FreeCMS\Common\Libs\FreeCmsSmarty $smarty
 * @param $repeat
 *
 * @return void
 */
function smarty_block_member($params,$content,&$smarty,&$repeat){
    //循环id
    $params['id'] = getParamsValue($params, 'id', 'arc');

    //index
    $keyIndex = getParamsValue($params, 'key', 'k');

    //排序字段
    $orderBy = getParamsValue($params, 'orderby', 'id');
    if (!in_array($orderBy, ['id', 'logintime'])) {
        $orderBy = 'id';
    }
    //排序方式
    $orderWay = getParamsValue($params, 'orderway', 'desc');
    if (!in_array($orderWay, ['asc', 'desc'])) {
        $orderWay = 'desc';
    }
    //读取多少条数据,默认读取十条数据，用法:limit="10,20"或者limit="10"
    $limit = getParamsValue($params, 'limit');
    if (empty($limit)) {
        $limit = 10;
    }


    $dataIndex = md5(__FUNCTION__ . md5(serialize($params)));
    $data = $smarty->getBlockData($dataIndex);
    if(!isset($data)){
        $model = new \FreeCMS\Common\Model\CmsMemberModel();
        $rows =$model->orderBy(sprintf("%s %s", $orderBy, $orderWay))
                     ->limit($limit)
                     ->findAll();
        if(!empty($rows)) {
            foreach ($rows as $key=>$row){
                $rows[$key] = $model->formatMember($row);
            }
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