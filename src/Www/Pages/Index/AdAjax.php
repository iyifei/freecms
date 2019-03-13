<?php
/**
 * Class [AdAjax]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/13
 */

namespace FreeCMS\Www\Pages\Index;


use FreeCMS\Common\Model\CmsAdModel;
use FreeCMS\Www\BaseWwwPage;

class AdAjax extends BaseWwwPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $id = getInteger('id');
        $model = new CmsAdModel();
        $ad = $model->findById($id);
        $adbody =$ad['expirebody'];
        if($ad['timetype']==1){
            //有时间范围
            $now = time();
            if(strtotime($ad['starttime'])>=$now && $now<=strtotime($ad['endtime'])){
                $adbody = $ad['body'];
            }
        }else{
            //无限期
            $adbody = $ad['body'];
        }
        $adbody = str_replace('"', '\"',$adbody);
        $adbody = str_replace("\r", "\\r",$adbody);
        $adbody = str_replace("\n", "\\n",$adbody);
        $adbody = "document.write(\"{$adbody}\");\r\n";
        echo $adbody;
        exit;
    }
}