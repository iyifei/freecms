<?php
/**
 * Class [StepPage]
 * 安装引导页面
 * author minyifei
 * date 2019/2/23
 */

namespace FreeCMS\Admin\Pages\Install;

use FreeCMS\Admin\BaseAdminPage;

class StepPage extends BaseAdminPage
{

    protected $declareNeedLogin = false;

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