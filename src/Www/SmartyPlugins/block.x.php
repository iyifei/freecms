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
    $dataIndex = md5(__FUNCTION__ . md5(serialize($params)));
    $data = $smarty->getBlockData($dataIndex);
    if(!isset($data)){
        $rows = (new \FreeCMS\Common\Model\CmsArchivesModel())->findAll();
        $smarty->setBlockData($dataIndex,$rows);
        $data = $rows;
    }
    if(isset($data) && is_array($data)){
        $index = count($data);
        //读取一条记录删除一条记录
        $item = array_shift($data);
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