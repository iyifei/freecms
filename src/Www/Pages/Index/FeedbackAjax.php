<?php
/**
 * Class [FeedbackAjax]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/3
 */

namespace FreeCMS\Www\Pages\Index;


use FreeCMS\Common\Exception\FreeCmsException;
use FreeCMS\Common\Libs\IdHash;
use FreeCMS\Common\Model\CmsArchivesModel;
use FreeCMS\Common\Model\CmsFeedbackModel;
use FreeCMS\Www\BaseWwwPage;

class FeedbackAjax extends BaseWwwPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $arcId = $vars['arcid'];
        $feedback = requestNotEmpty('feedback');
        $vcode = requestNotEmpty('vcode');
        if(session('captcha')!=$vcode){
            FreeCmsException::throwParamExp('验证码错误');
        }
        $aid = IdHash::decode($arcId,0);
        $member = session('current_member');
        if(empty($member)){
            FreeCmsException::throwParamExp('请先登录才能发表评论');
        }
        if(strlen($feedback)>200){
            FreeCmsException::throwParamExp('评论内容不能超过200字符');
        }
        $arcModel = new CmsArchivesModel();
        $arc = $arcModel->findById($aid);
        if($aid>0 && !empty($arc)){
            //添加记录
            $data = [
                'aid'=>$aid,
                'atitle'=>$arc['title'],
                'ip'=>getClientIP(),
                'ischeck'=>1,
                'dtime'=>getCurrentTime(),
                'mid'=>$member['id'],
                'muserid'=>$member['userid'],
                'content'=>$feedback,
            ];
            $fmodel = new CmsFeedbackModel();
            $fmodel->add($data);
            //更新文章评论数
            $count = $fmodel->where('aid=:aid',['aid'=>$aid])->count();
            $ud  = [
                'feedbackcount'=>$count
            ];
            $arcModel->updateById($aid,$ud);
            session('captcha',null);
            $this->successJson('ok');
        }else{
            FreeCmsException::throwParamExp('文章不存在');
        }
    }
}