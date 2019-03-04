<?php
/**
 * Class [ConfigPage]
 * 配置管理
 * author minyifei
 * date 2019/3/4
 */

namespace FreeCMS\Admin\Pages\System;


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
        $userConfigs = [];
        foreach ($configs as $config){
            if($config['subgroup']=='system'){
                $sysConfig[$config['varname']]=$config;
            }else{
                $userConfigs[]=$config;
            }
        }
        $this->assign('config',$sysConfig);
        $this->assign('userConfigs',$userConfigs);
        $this->display();
    }
}