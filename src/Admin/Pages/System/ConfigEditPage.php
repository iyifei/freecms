<?php
/**
 * Class [ConfigEditPage]
 * 添加配置信息
 * author minyifei
 * date 2019/3/4
 */

namespace FreeCMS\Admin\Pages\System;


use FreeCMS\Admin\BaseAdminPage;

class ConfigEditPage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $this->assign('method','add');
        $this->display();
    }
}