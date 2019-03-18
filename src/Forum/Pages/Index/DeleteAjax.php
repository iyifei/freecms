<?php
/**
 * Class [DeleteAjax]
 * 删除
 * author minyifei
 * date 2019/3/18
 */

namespace FreeCMS\Forum\Pages\Index;


use FreeCMS\Common\Libs\IdHash;
use FreeCMS\Common\Model\CmsForumPostsModel;
use FreeCMS\Common\Model\CmsForumSubjectModel;
use FreeCMS\Forum\BaseForumPage;

class DeleteAjax extends BaseForumPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $type = requestNotEmpty('type');
        $enid = requestNotEmpty('enid');
        $id = IdHash::decode($enid);
        $msg  = 'error';
        if($type=='posts'){
            $m = new CmsForumPostsModel();
            $posts  = $m->findById($id);
            if($posts['mid']==$this->getCurrentMemberId() || $this->getAdminRoleId()==1){
                $ud = [
                    'body'=>'===此贴内容已经删除===',
                ];
                $m->updateById($id,$ud);
                $msg = 'ok';
            }
        }elseif($type=='subject'){
            $sm = new CmsForumSubjectModel();
            $subject = $sm->findById($id);
            if($subject['createMemberId']==$this->getCurrentMemberId() || $this->getAdminRoleId()==1){
                $sm->deleteById($id);
                //删除所有回帖
                (new CmsForumPostsModel())->where('sid='.$id)->delete();
                $msg = 'ok';
            }
        }
        $this->successJson($msg);
    }
}