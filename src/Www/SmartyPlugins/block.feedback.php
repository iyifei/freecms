<?php

/**
 * Function:smarty_block_feedback
 * 评论
 *
 * @param array $params 参数
 * @param $content
 * @param \FreeCMS\Common\Libs\FreeCmsSmarty $smarty
 * @param $repeat
 *
 * @return voidx
 */
function smarty_block_feedback($params,$content,&$smarty,&$repeat){
    //获取列表页当前栏目信息
    @$arcx = get_object_vars($smarty->tpl_vars["freecms"]);
    $arc = $arcx["value"];
    //index
    $keyIndex = getParamsValue($params,'key','k');
    $wheres = 'aid=:aid and ischeck=1';
    $bind = [
        'aid'=>$arc['id'],
    ];
    //循环id
    $params['id'] = getParamsValue($params,'id','fd');
    //每页返回记录数
    $params['pagesize']=intval(getParamsValue($params,'pagesize',20));
    $page = getInteger('p',0);
    if($page<1){
        $page  = 1;
    }
    $params["page"] = $page;
    $params['start']=($page-1)*$params['pagesize'];

    $dataIndex = md5(__FUNCTION__ . md5(serialize($params)));
    $data = $smarty->getBlockData($dataIndex);
    if(!isset($data)){
        $rows = (new \FreeCMS\Common\Model\CmsFeedbackModel())
            ->where($wheres,$bind)
            ->orderBy('id desc')
            ->limit($params['start'],$params['pagesize'])
            ->findAll();
        if(!empty($rows)){
            $smarty->setBlockData($dataIndex,$rows);
            $data = $rows;
        }
    }
    if(isset($data) && is_array($data)){
        $index = count($data);
        //读取一条记录删除一条记录
        $item = array_shift($data);
        $item[$keyIndex] = $index;
        if(empty($item['uname'])){
           $item['uname']=half_replace($item['muserid']);
        }
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