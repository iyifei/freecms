<?php
/**
 * Class [QuitAjax]
 * 退出系统
 * author minyifei
 * date 2019/3/13
 */

namespace FreeCMS\Admin\Pages\Index;


use FreeCMS\Admin\BaseAdminPage;

class QuitAjax extends BaseAdminPage
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
        session('menus',null);
        session('NoEditAdminRole',null);
        jumpUrl(getBaseURL().'/admin/login');
    }
}