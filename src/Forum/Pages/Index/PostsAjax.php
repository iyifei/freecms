<?php
/**
 * Class [PostsAjax]
 * 保存数据
 * author minyifei
 * date 2019/3/14
 */

namespace FreeCMS\Forum\Pages\Index;


use FreeCMS\Common\Exception\FreeCmsException;
use FreeCMS\Common\Libs\IdHash;
use FreeCMS\Common\Model\CmsForumColumnModel;
use FreeCMS\Common\Model\CmsForumPostsModel;
use FreeCMS\Common\Model\CmsForumSubjectModel;
use FreeCMS\Forum\BaseForumPage;

class PostsAjax extends BaseForumPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $vcode = requestNotEmpty('code');
        if(session('captcha')!=$vcode){
            FreeCmsException::throwParamExp('验证码错误');
        }
        session('captcha',null);
        $cid = IdHash::decode($vars['cenid']);
        $mid = $this->getCurrentMemberId();
        $type = requestNotEmpty('type');
        $body = xssClean(post('body'));
        $now = getCurrentTime();
        $sModel = new CmsForumSubjectModel();
        $pModel = new CmsForumPostsModel();
        //栏目待更新资料
        $cdata = [];
        //新建主题
        if($type=='new'){
            $title  = requestNotEmpty('title');
            $subject  = [
                'cid'=>$cid,
                'title'=>$title,
                'createMemberId'=>$mid,
                'lastMemberId'=>$mid,
                'createtime'=>$now,
                'lasttime'=>$now,
                'replies'=>1,
                'ip'=>getClientIP(),
            ];
            $sid = $sModel->add($subject);
            $cdata['lastSubjectTitle']=$title;
            $cdata['lastSubjectId']=$sid;
            $cdata['lastSubjectTime']=$now;
            $cdata['subjectCount']=$sModel->where('cid='.$cid)->count();
            $ptype = 1;
        }else{
            //回帖
            $ptype = 2;
            $sid = IdHash::decode(requestNotEmpty('senid'),0);
            $srow = $sModel->findById($sid);
            if(empty($srow)){
                FreeCmsException::throwParamExp('主题错误');
            }else{
                $replies = $pModel->where('sid='.$sid)->count();
                $su = [
                    'replies'=>$replies+1
                ];
                $sModel->updateById($su,$sid);
            }
        }
        //帖子
        $data = [
            'cid'=>$cid,
            'sid'=>$sid,
            'mid'=>$mid,
            'type'=>$ptype,
            'body'=>$body,
            'createtime'=>$now,
            'ip'=>getClientIP(),
        ];
        $pModel->add($data);

        //更新栏目资料
        $cdata['totalPosts']=$pModel->where('cid='.$cid)->count();
        (new CmsForumColumnModel())->updateById($cid,$cdata);

        $res =  [
            'senid'=>IdHash::encode($sid)
        ];
        $this->successJson($res);
    }

}