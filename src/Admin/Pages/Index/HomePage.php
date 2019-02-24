<?php
/**
 * Class [HomePage]
 * 请描述类的功能
 * author minyifei
 * date 2019/2/24
 */

namespace FreeCMS\Admin\Pages\Index;


use FreeCMS\Admin\BaseAdminPage;

class HomePage extends BaseAdminPage
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