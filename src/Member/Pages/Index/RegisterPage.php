<?php
/**
 * Class [RegisterPage]
 * 注册页面
 * author minyifei
 * date 2019/3/3
 */

namespace FreeCMS\Member\Pages\Index;


use FreeCMS\Member\BaseMemberPage;

class RegisterPage extends BaseMemberPage
{

    protected $declareNeedLogin = false;

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $go = get('go',getBaseURL().'/member');
        $this->assign('go',$go);
        $this->display();
    }
}