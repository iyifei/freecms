<?php
/**
 * Class [ThemeEditPage]
 * 主题编辑
 * author minyifei
 * date 2019/2/27
 */

namespace FreeCMS\Admin\Pages\Template;


use FreeCMS\Admin\BaseAdminPage;

class ThemeEditPage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $theme = request('theme');
        $method = requestNotEmpty('method');
        $themePath  = dirname($this->getThemePath());
        $configFile = sprintf('%s/%s/default.php',$themePath,$theme);
        $config =  [];
        if(is_file($configFile)){
            $config = include $configFile;
            $config['litpic']= sprintf("%s/themes/%s/default.jpg",getBaseURL(),$theme);
        }
        $this->assign('data',$config);
        $this->assign('method',$method);
        $this->assign('theme',$theme);
        $this->display();
    }
}