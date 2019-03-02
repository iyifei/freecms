<?php
/**
 * Class [ListPage]
 * 列表页/封面页
 * author minyifei
 * date 2018/11/29
 */

namespace FreeCMS\Www\Pages\Index;


use FreeCMS\Common\Model\CmsArctypeModel;
use FreeCMS\Www\BaseWwwPage;

class ListPage extends BaseWwwPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $channel = $vars['channel'];
        if(isset($vars['typedir'])){
            $model = new CmsArctypeModel();
            $where = 'typedir=:typedir';
            $bind = ['typedir'=>$vars['typedir']];
            $row = $model->where($where,$bind)
                         ->findFirst();
            if($row){
                //相对目录
                $typedir = $row["typedir"];
                //栏目地址
                $typeurl = sprintf('%s/%s/%s',getBaseURL(),$channel,$typedir);

                //跳转连接,直接跳转
                if($row['type']=='link'){
                    $typeurl = $typedir;
                    jumpUrl($typeurl);
                }elseif($row['type']=='face'){
                    $tpl = $row['tempface'];
                }else{
                    //文章列表页
                    $tpl = $row['templist'];
                    $page = getInteger('p',1);
                    if($page<1){
                        $page = 1;
                    }
                    $row['page']=$page;
                }
                if($channel!='list'){
                    $row['channel']=$channel;
                    $tpl = sprintf("%s_list_default.tpl",$channel);
                }
                $row['typeurl']=$typeurl;
                //缩略图
                if(!empty($row['litpic'])){
                    $ossDomain = getLocalOssDomain();
                    $thumbnail = getDefaultThumbnailConfig();
                    $row['thumbnail']=sprintf("%s/%s?thumbnail=w-%d/h-%d",$ossDomain,$row['litpic'],$thumbnail['width'],$thumbnail['height']);
                    $row['imgurl']=sprintf("%s/%s",$ossDomain,$row['litpic']);
                }
                if(!empty($row['extinfo'])){
                    $row['ext']=json_decode($row['extinfo'],true);
                }
                $title = $row['typename'];
                if(!empty($row['seotitle'])){
                    $title = $row['seotitle'];
                }
                $this->assign('title',$title);
                $row['title']=$title;
                $this->assign('freecms',$row);

                $this->display($tpl);
                exit;
            }
        }
        http_response_code(404);
        exit;
    }
}