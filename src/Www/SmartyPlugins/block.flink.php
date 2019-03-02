<?php

/**
 * Function:smarty_block_flink
 * 友情链接
 *
 * @param array $params 参数
 * @param $content
 * @param \FreeCMS\Common\Libs\FreeCmsSmarty $smarty
 * @param $repeat
 *
 * @return voidx
 */
function smarty_block_flink($params,$content,&$smarty,&$repeat){
    $wheres = [];
    $bind = [];
    //循环id
    $params['id'] = getParamsValue($params,'id','link');

    //index
    $keyIndex = getParamsValue($params,'key','k');

    //分组
    $subgroup = getParamsValue($params,'subgroup');
    if(isset($subgroup)){
        $wheres[]= 'subgroup=:subgroup';
        $bind['subgroup']=$subgroup;
    }
    //父类id
    $limit = getParamsValue($params,'limit');

    //缩略图宽度
    $imgWidth = intval(getParamsValue($params,'logowidth',120));
    //缩略图高度
    $imgHeight = intval(getParamsValue($params,'logoheight',90));
    //排序
    $orderby = 'sortrank asc';
    $dataIndex = md5(__FUNCTION__ . md5(serialize($params)));
    $data = $smarty->getBlockData($dataIndex);
    if(!isset($data)){
        $model = new \FreeCMS\Common\Model\CmsFlinkModel();
        if(!empty($wheres)){
            $where = join(' AND ',$wheres);
            $model = $model->where($where,$bind);
        }
        $model = $model->orderBy($orderby);
        if(isset($limit)){
            if(is_numeric($limit)){
                $model = $model->limit(intval($limit));
            }else{
                $limits = explode(',',$limit);
                if(count($limits)==2){
                    $model = $model->limit(intval($limits[0]),intval($limits[1]));
                }
            }
        }
        $rows = $model->findAll();
        if(!empty($rows)){
            $smarty->setBlockData($dataIndex,$rows);
            $data = $rows;
        }
    }
    if(isset($data) && is_array($data)){
        $index = count($data);
        //读取一条记录删除一条记录
        $item = array_shift($data);
        $item[$keyIndex]=$index;
        //缩略图
        if(!empty($item['logo'])){
            $ossDomain = getLocalOssDomain();
            $item['thumbnail']=sprintf("%s/%s?thumbnail=w-%d/h-%d",$ossDomain,$item['logo'],$imgWidth,$imgHeight);
            $item['logourl']=sprintf("%s/%s",$ossDomain,$item['logo']);
        }
        $smarty->assign($params['id'],$item);
        if(count($data)==0){
            $smarty->setBlockData($dataIndex,false);
        }else{
            $smarty->setBlockData($dataIndex,$data);
        }
        $repeat = true;
    }else{
        $repeat = false;
        $smarty->setBlockData($dataIndex,null);
    }
    echo $content;
}