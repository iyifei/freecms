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
use FreeCMS\Common\Model\CmsForumPostsModel;
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
        $sid = IdHash::decode($vars['senid'],0);
        $sModel = new CmsForumSubjectModel();
        $subject = $sModel->findById($sid);
        if(empty($subject)){
            FreeCmsException::throwParamExp('帖子主题未找到');
        }
        $pModel = new CmsForumPostsModel();


        $this->display();
    }
}