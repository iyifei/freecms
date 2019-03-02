<?php

/**
 * Function:smarty_block_searchlist
 * 搜索文章列表
 *
 * @param array $params 参数
 * @param $content
 * @param \FreeCMS\Common\Libs\FreeCmsSmarty $smarty
 * @param $repeat
 *
 * @return voidx
 */
function smarty_block_searchlist($params,$content,&$smarty,&$repeat){
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
    if(!empty($params['keyword'])){
        $wheres[]="title like :keyword";
        $bind['keyword']="%{$params['keyword']}%";
    }
    //index
    $keyIndex = getParamsValue($params,'key','k');

    //排序字段
    $orderBy = getParamsValue($params, 'orderby', 'id');
    if (!in_array($orderBy, ['id', 'click', 'pubtime'])) {
        $orderBy = 'id';
    }
    //排序方式
    $orderWay = getParamsValue($params, 'orderway', 'desc');
    if (!in_array($orderWay, ['asc', 'desc'])) {
        $orderWay = 'desc';
    }

    //标题长度
    $titleLength = intval(getParamsValue($params, 'titlelen', 0));
    //描述长度
    $infoLength = intval(getParamsValue($params, 'infolen', 0));
    //缩略图宽度
    $imgWidth = intval(getParamsValue($params,'imgwidth',120));
    //缩略图高度
    $imgHeight = intval(getParamsValue($params,'imgheight',90));
    $dataIndex = md5(__FUNCTION__ . md5(serialize($params)));
    $data = $smarty->getBlockData($dataIndex);
    if(!isset($data)){
        //读取第几页
        $page = $params["page"];
        if ($page <= 1) {
            $page = 1;
        }
        $start = ($page - 1) * $params['pagesize'];
        $arcModel = new \FreeCMS\Common\Model\CmsArchivesModel();

        $arcModel = $arcModel->link('arctype')
                             ->orderBy(sprintf("%s %s", $orderBy, $orderWay))
                             ->limit($start,$params['pagesize']);
        if(!empty($wheres)){
            $where = join(' AND ',$wheres);
            $arcModel = $arcModel->where($where,$bind);
            $rows = $arcModel->findAll();
        }else{
            $rows=[];
        }
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

        $arctype = $item['arctype'];
        //文章编号
        $aid = $item["id"];
        //相对目录
        $typedir = $arctype["typedir"];
        //跳转地址
        $jump = $item["jump"];
        //栏目地址
        $typeurl = sprintf('%s/list/%s', getBaseURL(), $typedir);
        if($arctype['channel']=='blend'){
            //混合模式
            $typeurl = sprintf("%s/%s/%s",getBaseURL(),$item['channel'],$typedir);
        }
        //文章访问路径
        $arcurl = sprintf("%s/archives/%s.html",getBaseURL(),\FreeCMS\Common\Libs\IdHash::encode($aid));
        if (!empty($jump)) {
            $arcurl = $jump;
        }
        $item['typename'] = $arctype['typename'];
        $item['arcurl'] = $arcurl;
        $item['typeurl'] = $typeurl;
        if (!empty($item['flag'])) {
            $item['flags'] = explode(',', $item['flag']);
        } else {
            $item['flags'] = [];
        }
        //标题
        if ($titleLength > 0) {
            $item['title'] = mb_substr($item['title'], 0, $titleLength);
        }
        //描述
        if ($infoLength > 0) {
            $item['description'] = mb_substr(
                $item['description'], 0, $infoLength
            );
        }
        //缩略图
        if (!empty($item['litpic'])) {
            $ossDomain = getLocalOssDomain();
            $item['thumbnail'] = sprintf(
                "%s/%s?thumbnail=w-%d/h-%d", $ossDomain, $item['litpic'],
                $imgWidth, $imgHeight
            );
            $item['imgurl'] = sprintf("%s/%s", $ossDomain, $item['litpic']);
        }
        if (!empty($item['extinfo'])) {
            $extInfo = json_decode($item['extinfo'], true);
            $item['ext'] = $extInfo;
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