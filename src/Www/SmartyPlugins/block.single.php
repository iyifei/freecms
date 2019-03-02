<?php

/**
 * Function:smarty_block_single
 * 单页
 *
 * @param array $params 参数
 * @param $content
 * @param \FreeCMS\Common\Libs\FreeCmsSmarty $smarty
 * @param $repeat
 *
 * @return void
 */
function smarty_block_single($params,$content,&$smarty,&$repeat){
    $wheres = [];
    $bind = [];
    //循环id
    $params['id'] = getParamsValue($params,'id','page');

    //index
    $keyIndex = getParamsValue($params,'key','k');

    //分组
    $subgroup = getParamsValue($params,'subgroup');
    if(isset($subgroup)){
        $wheres[]= 'subgroup=:subgroup';
        $bind['subgroup']=$subgroup;
    }

    //是否返回内容
    $hasBody = getParamsValue($params,'body',0);

    //缩略图宽度
    $imgWidth = intval(getParamsValue($params,'logowidth',120));
    //缩略图高度
    $imgHeight = intval(getParamsValue($params,'logoheight',90));
    //排序
    $orderby = 'sortrank asc';
    $dataIndex = md5(__FUNCTION__ . md5(serialize($params)));
    $data = $smarty->getBlockData($dataIndex);
    if(!isset($data)){
        $model = new \FreeCMS\Common\Model\CmsPageModel();
        $fields = "id,sortrank,subgroup,title,filename,keywords,litpic,description,uptime";
        if($hasBody==1){
            $fields.=',body';
        }
        if(!empty($wheres)){
            $where = join(' AND ',$wheres);
            $model = $model->where($where,$bind);
        }
        $rows = $model->field($fields)->orderBy($orderby)->findAll();
        if($rows) {
            $smarty->setBlockData($dataIndex, $rows);
            $data = $rows;
        }
    }
    if(isset($data) && is_array($data)){
        $index = count($data);
        //读取一条记录删除一条记录
        $item = array_shift($data);
        $item[$keyIndex]=$index;
        //缩略图
        if(!empty($item['litpic'])){
            $ossDomain = getLocalOssDomain();
            $item['thumbnail']=sprintf("%s/%s?thumbnail=w-%d/h-%d",$ossDomain,$item['litpic'],$imgWidth,$imgHeight);
            $item['imgurl']=sprintf("%s/%s",$ossDomain,$item['litpic']);
        }
        $item['pageurl']=getBaseURL().'/pages/'.$item['filename'].'.html';
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