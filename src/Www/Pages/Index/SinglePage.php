<?php
/**
 * Class [SinglePage]
 * 单页详情
 * author minyifei
 * date 2018/11/28
 */

namespace FreeCMS\Www\Pages\Index;


use FreeCMS\Common\Model\CmsPageModel;
use FreeCMS\Www\BaseWwwPage;

class SinglePage extends BaseWwwPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $name = $vars['name'];
        if(!empty($name)){
            $model = new CmsPageModel();
            $row = $model->where('filename=:filename',['filename'=>$name])->findFirst();
            $row['pageurl']=sprintf("/pages/%s.html",$row['filename']);
            $row['fullurl']=getCurrentDomain().$row['pageurl'];
            //缩略图
            if (!empty($row['litpic'])) {
                $ossDomain = getLocalOssDomain();
                $thumbnail = getDefaultThumbnailConfig();
                $row['thumbnail']=sprintf("%s/%s?thumbnail=w-%d/h-%d",$ossDomain,$row['litpic'],$thumbnail['width'],$thumbnail['height']);
                $row['imgurl'] = sprintf("%s/%s", $ossDomain, $row['litpic']);
            }
            $title = $row['title'];
            $this->assign('title',$title);
            $this->assign('freecms',$row);
            $this->display($row['template']);
        }else{
            http_response_code(404);
            exit;
        }
    }
}