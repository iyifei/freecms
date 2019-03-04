<?php
/**
 * Class [FeedbackEditAjax]
 * 评论编辑
 * author minyifei
 * date 2019/3/4
 */

namespace FreeCMS\Admin\Pages\Site;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Model\CmsFeedbackModel;

class FeedbackEditAjax extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $method = requestNotEmpty('method');
        $model = new CmsFeedbackModel();
        $idArr = [];
        if($method==EditType::BatchDelete){
            //批量删除
            $ids = requestNotEmpty('ids');
            $model->deleteByIds($ids);
            $ids = explode(',',$ids);
            foreach ($ids as $id){
                $idArr[]=intval($id);
            }
        }elseif ($method == EditType::Delete) {
            //删除
            $id = getInteger('id', 0);
            $model->deleteById($id);
            $idArr[]=$id;
        }
        if(count($idArr)>0){
            $sql = sprintf('update cms_archives set feedbackcount=feedbackcount-1 where id in(%s)',join(',',$idArr));
            $model->updateBySql($sql);
        }
        $this->successJson('ok');
    }
}