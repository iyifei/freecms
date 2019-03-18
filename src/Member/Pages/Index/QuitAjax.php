<?php
/**
 * Class [QuitAjax]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/17
 */

namespace FreeCMS\Member\Pages\Index;


use FreeCMS\Member\BaseMemberPage;

class QuitAjax extends BaseMemberPage
{

    protected $declareNeedLogin = false;

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        session('current_member',null);
        jumpUrl(getBaseURL().'/member/login');
    }
}