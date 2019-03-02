<?php
/**
 * Class [ArchiveAjax]
 * 文章属性
 * author minyifei
 * date 2019/3/2
 */

namespace FreeCMS\Www\Pages\Index;


use FreeCMS\Common\Libs\IdHash;
use FreeCMS\Common\Model\CmsArchivesModel;
use FreeCMS\Www\BaseWwwPage;

class ArchiveAjax extends BaseWwwPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $hash = $vars['hash'];
        $type = $vars['type'];
        $id = IdHash::decode($hash,0);
        if($type=='click'){
            $click = 0;
            $model = new CmsArchivesModel();
            $arc = $model->findById($id);
            if($arc){
                $click = $arc['click']+1;
                $data = ['click'=>$click];
                $model->updateById($id,$data);
            }
            echo "document.write($click)";
            exit;
        }
    }
}