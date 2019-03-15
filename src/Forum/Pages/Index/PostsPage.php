<?php
/**
 * Class [PostsPage]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/14
 */

namespace FreeCMS\Forum\Pages\Index;


use FreeCMS\Common\Exception\FreeCmsException;
use FreeCMS\Common\Libs\IdHash;
use FreeCMS\Common\Model\CmsForumSubjectModel;
use FreeCMS\Forum\BaseForumPage;

class PostsPage extends BaseForumPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $senid = $vars['senid'];
        $sid = IdHash::decode($senid,0);
        $sModel = new CmsForumSubjectModel();
        $subject = $sModel->link('column')->findById($sid);
        if(empty($subject)){
            FreeCmsException::throwParamExp('帖子主题未找到');
        }
        $subject['senid']=IdHash::encode($subject['id']);
        $pos = [
            ['name'=>$subject['column']['name'],'url'=>getBaseURL().'/forum/category/'.IdHash::encode($subject['column']['id']).'.html'],
        ];
        $subject['position']=$this->getPosition($pos);
        $subject['page']=$vars['p'];
        $subject['pagetype']='posts';
        $this->assign('freecms',$subject);
        $this->display();
    }
}