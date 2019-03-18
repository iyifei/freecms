<?php
/**
 * Class [HomePage]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/3
 */

namespace FreeCMS\Member\Pages\Index;


use FreeCMS\Common\Libs\IdHash;
use FreeCMS\Common\Model\CmsArchivesModel;
use FreeCMS\Common\Model\CmsForumSubjectModel;
use FreeCMS\Member\BaseMemberPage;

class HomePage extends BaseMemberPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        //最新帖子
        $sModel = new CmsForumSubjectModel();
        $subjects = $sModel->orderBy('id desc')->limit(8)->findAll();
        foreach ($subjects as $key=> $subject){
            $subject['createTime']=mdate($subject['createtime']);
            $subject['linkurl']=getBaseURL().'/forum/posts/'.IdHash::encode($subject['id']).'.html';
            $subjects[$key]=$subject;
        }
        //最新文章
        $aModel = new CmsArchivesModel();
        $archives = $aModel->orderBy('id desc')->limit(8)->findAll();
        foreach ($archives as $key=>$archive){
            $archive['linkurl']=getBaseURL().'/archives/'.IdHash::encode($archive['id']).'.html';
            $archives[$key]=$archive;
        }

        $this->assign('subjects',$subjects);
        $this->assign('archives',$archives);
        $this->display();
    }
}