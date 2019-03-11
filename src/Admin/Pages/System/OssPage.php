<?php
/**
 * Class [OssPage]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/9
 */

namespace FreeCMS\Admin\Pages\System;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Model\CmsSysConfigModel;

class OssPage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $model = new CmsSysConfigModel();
        $configs = $model->findAll();
        $sysConfig = [];
        foreach ($configs as $config){
            if($config['subgroup']=='system'){
                $sysConfig[$config['varname']]=$config;
            }
        }
        $this->assign('config',$sysConfig);
        $this->display();
    }
}