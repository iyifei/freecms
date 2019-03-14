<?php
/**
 * Class [IndexPage]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/14
 */

namespace FreeCMS\Forum\Pages\Index;


use FreeCMS\Common\Model\CmsForumColumnModel;
use FreeCMS\Common\Model\CmsForumSubjectModel;
use FreeCMS\Forum\BaseForumPage;

class IndexPage extends BaseForumPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $model = new CmsForumColumnModel();
        $columns = $model->findAllMenu();
        $columnTree = easyuitree($columns);
        $this->assign('columns',$columnTree);
        //总主题数
        $totalSubject = (new CmsForumSubjectModel())->count();
        $this->assign('totalSubject',$totalSubject);
        $this->display();
    }
}