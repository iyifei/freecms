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
        $model = new CmsArchivesModel();
        $arc = $model->findById($id);
        $sd = 0;
        if($arc){
            if($type=='click'){
                $sd = $click = $arc['click']+1;
                $data = ['click'=>$click];
            }elseif($type == 'good'){
                $sd = $goodpost = $arc['goodpost']+1;
                $data = ['goodpost'=>$goodpost];
            }elseif($type=='bad'){
                $sd = $badpost = $arc['badpost']+1;
                $data = ['badpost'=>$badpost];
            }
            $model->updateById($id,$data);
        }
        if($type=='click'){
            echo "document.write($sd)";
            exit;
        }else{
            $this->successJson($sd);
        }
    }
}