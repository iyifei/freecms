<?php
/**
 * Class [ThemePage]
 * 主题列表
 * author minyifei
 * date 2019/2/27
 */

namespace FreeCMS\Admin\Pages\Template;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Libs\File;

class ThemePage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {

        $current = $this->getCurrentTheme();
        $themePath  = dirname($this->getThemePath());
        $themes = File::dirList($themePath);
        $list  = [];
        foreach ($themes as $theme){
            $configFile = sprintf('%s/%s/default.php',$themePath,$theme);
            if(is_file($configFile)){
                $item = include_once $configFile;
                $item['screenshot']= sprintf("%s/themes/%s/default.jpg",getBaseURL(),$theme);
                $item['themePath']='themes/'.$theme;
                $item['theme']=$theme;
                if(strpos(strtolower($item['version']),'v')==false){
                    $item['version']='v'.$item['version'];
                }
                $list[]=$item;
            }
        }
        $this->assign('currTheme',$current);
        $this->assign('currTime',time());
        $this->assign('datas',$list);
        $this->display();
    }
}