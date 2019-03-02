<?php

/**
 * Function:smarty_block_arclist
 * 读取频道列表
 *
 * @param array $params 参数
 * @param $content
 * @param \FreeCMS\Common\Libs\FreeCmsSmarty $smarty
 * @param $repeat
 *
 * @return voidx
 */
function smarty_block_channel($params,$content,&$smarty,&$repeat){
    $wheres = [];
    $bind = [];
    //循环id
    $params['id'] = getParamsValue($params,'id','vo');

    //index
    $keyIndex = getParamsValue($params,'key','k');

    //顶级栏目id
    $topid = intval(getParamsValue($params,'topid',-1));
    if($topid>=0){
        $wheres[]= 'topid=:topid';
        $bind['topid']=$topid;
    }
    //父类id
    $pid = intval(getParamsValue($params,'pid',0));
    if($pid>0){
        $wheres[]= 'pid=:pid';
        $bind['pid']=$pid;
    }
    //层级
    $level = intval(getParamsValue($params,'level',0));
    if($level>0){
        $wheres[]='level=:level';
        $bind['level']=$level;
    }

    $wheres[]='ishide=0';

    //缩略图宽度
    $imgWidth = intval(getParamsValue($params,'imgwidth',120));
    //缩略图高度
    $imgHeight = intval(getParamsValue($params,'imgheight',90));
    //排序
    $orderby = 'sortrank asc';
    $dataIndex = md5(__FUNCTION__ . md5(serialize($params)));
    $data = $smarty->getBlockData($dataIndex);
    if(!isset($data)){
        $arctypeModel = new \FreeCMS\Common\Model\CmsArctypeModel();
        $where = join(' AND ',$wheres);
        $rows = $arctypeModel->where($where,$bind)->orderBy($orderby)->findAll();
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
        //相对目录
        $typedir = $item["typedir"];
        //栏目地址
        $typeurl = sprintf('%s/list/%s',getBaseURL(),$typedir);
        //跳转连接
        if($item['type']=='link'){
            $typeurl = $typedir;
        }
        $item['typeurl']=$typeurl;
        //缩略图
        if(!empty($item['litpic'])){
            $ossDomain = getLocalOssDomain();
            $item['thumbnail']=sprintf("%s/%s?thumbnail=w-%d/h-%d",$ossDomain,$item['litpic'],$imgWidth,$imgHeight);
            $item['imgurl']=sprintf("%s/%s",$ossDomain,$item['litpic']);
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