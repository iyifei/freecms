<?php
/**
 * Class [HomePage]
 * 请描述类的功能
 * author minyifei
 * date 2019/2/24
 */

namespace FreeCMS\Admin\Pages\Index;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Libs\Utils;

class HomePage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $token = Utils::getUUID();
        session('FreeCMS_Cloud_Token',$token);
        $this->assign('cloud_token',$token);
        $this->display();
    }
}