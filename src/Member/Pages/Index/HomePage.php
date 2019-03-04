<?php
/**
 * Class [HomePage]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/3
 */

namespace FreeCMS\Member\Pages\Index;


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
        $this->display();
    }
}