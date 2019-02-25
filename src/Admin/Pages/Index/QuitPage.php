<?php
/**
 * Class [QuitPage]
 * 退出
 * author minyifei
 * date 2018/11/23
 */

namespace Admin\Pages\Index;


use Admin\Pages\BasePage;

class QuitPage extends BasePage
{

    protected $declareNeedLogin = false;

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        session('admin',null);
        session('urls',null);
        jumpUrl(getBaseURL().'/');
    }
}