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