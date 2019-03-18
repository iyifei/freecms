<?php
/**
 * Class [ProfilePage]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/18
 */

namespace FreeCMS\Member\Pages\Index;


use FreeCMS\Common\Model\CmsMemberModel;
use FreeCMS\Member\BaseMemberPage;

class ProfilePage extends BaseMemberPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $mid = $this->getCurrentMemberId();
        $member = (new CmsMemberModel())->findById($mid);
        $this->assign('data',$member);
        $this->display();
    }
}