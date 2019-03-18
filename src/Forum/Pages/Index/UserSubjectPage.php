<?php
/**
 * Class [UserSubjectPage]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/18
 */

namespace FreeCMS\Forum\Pages\Index;


use FreeCMS\Common\Libs\IdHash;
use FreeCMS\Common\Model\CmsMemberModel;
use FreeCMS\Forum\BaseForumPage;

class UserSubjectPage extends BaseForumPage
{

    protected $declareNeedLogin = false;

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $mid = IdHash::decode($vars['menid'],0);
        $m=new CmsMemberModel();
        $member = $m->findById($mid);
        $member = $m->formatMember($member);
        $member['pagetype']='usersubject';
        $member['page']=$vars['p'];
        $this->assign('freecms',$member);
        $this->display();
    }

}