<?php
/**
 * Class [IconPage]
 * 图标集
 * author minyifei
 * date 2019/2/26
 */

namespace FreeCMS\Admin\Pages\Index;


use FreeCMS\Admin\BaseAdminPage;

class IconPage extends BaseAdminPage
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