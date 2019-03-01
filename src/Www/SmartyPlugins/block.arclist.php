<?php


/**
 * 参考：https://blog.csdn.net/the_victory/article/details/51044444
 * Class [${NAME}]
 * 文章读取标签
 * author minyifei
 * date 2019/3/1
 */


/**
 * Function:smarty_block_arclist
 * 描述
 *
 * @param array $params 参数
 * @param $content
 * @param \FreeCMS\Common\Libs\FreeCmsSmarty $smarty
 * @param $repeat
 *
 * @return void
 */
function smarty_block_arclist($params,$content,&$smarty,&$repeat){
    //循环id
    $params['id'] = getParamsValue($params, 'id', 'arc');

    //index
    $keyIndex = getParamsValue($params, 'key', 'k');

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

    //模型
    $channel = getParamsValue($params, 'channel', 'article');
    if (!in_array($channel, ['article', 'image', 'video', 'audio','zph'])) {
        $channel = 'article';
    }

    //标题长度
    $titleLength = intval(getParamsValue($params, 'titlelen', 0));
    //描述长度
    $infoLength = intval(getParamsValue($params, 'infolen', 0));
    //缩略图宽度
    $imgWidth = intval(getParamsValue($params, 'imgwidth', 120));
    //缩略图高度
    $imgHeight = intval(getParamsValue($params, 'imgheight', 90));

    //查询条件
    $where = 'channel=:channel';
    $bind = ['channel' => $channel];

    //栏目
    $typeid = getParamsValue($params, 'typeid');
    if (isset($typeid) && !empty($typeid)) {
        $typeids = explode(',', $typeid);
        $typeIdArr = [];
        foreach ($typeids as $tid) {
            if (intval($tid) > 0) {
                $typeIdArr[] = intval($tid);
            }
        }
        if (!empty($typeIdArr)) {
            //查询所有下级栏目
            $getall = getParamsValue($params, 'getall', 0);
            if ($getall == 1) {
                $typeModel = new \FreeCMS\Common\Model\CmsArctypeModel();
                $typeIdArr = $typeModel->findChildIds($typeids);
            }
            $where .= ' AND typeid in(:typeids)';
            $bind['typeids'] = join(',', $typeIdArr);
        }
    }

    //文章属性
    $flag = getParamsValue($params, 'flag');
    if (isset($flag)) {
        $where .= ' AND FIND_IN_SET(:flag,flag)';
        $bind['flag'] = $flag;
    }

    //读取多少条数据,默认读取十条数据，用法:limit="10,20"或者limit="10"
    $limit = getParamsValue($params, 'limit');
    if (empty($limit)) {
        $limit = 10;
    }


    $dataIndex = md5(__FUNCTION__ . md5(serialize($params)));
    $data = $smarty->getBlockData($dataIndex);
    if(!isset($data)){
        //读取文章记录
        $arcModel = new \FreeCMS\Common\Model\CmsArchivesModel();
        if (isset($limit)) {
            if (is_numeric($limit)) {
                $arcModel = $arcModel->limit(intval($limit));
            } else {
                $limits = explode(',', $limit);
                if (count($limits) == 2) {
                    $arcModel = $arcModel->limit(
                        intval($limits[0]), intval($limits[1])
                    );
                }
            }
        }
        $rows = $arcModel->link('arctype')
                         ->where($where, $bind)
                         ->orderBy(sprintf("%s %s", $orderBy, $orderWay))
                         ->findAll();
        $smarty->setBlockData($dataIndex,$rows);
        $data = $rows;
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
            $typeurl = sprintf("%s/%s/%s",getBaseURL(),$channel,$typedir);
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
            $item['extinfo'] = $extInfo;
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
    }
    echo $content;
}