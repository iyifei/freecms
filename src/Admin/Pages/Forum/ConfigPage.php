<?php
/**
 * Class [ConfigPage]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/16
 */

namespace FreeCMS\Admin\Pages\Forum;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Model\CmsSysConfigModel;

class ConfigPage extends BaseAdminPage
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