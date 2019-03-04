<?php
/**
 * Class [BaseWwwPage]
 * 基类
 * author minyifei
 * date 2019/3/1
 */

namespace FreeCMS\Www;


use FreeCMS\Common\Libs\Page;

abstract class BaseWwwPage extends Page
{

    public function __construct()
    {
        //文件目录
        define('APP_PATH',__DIR__);
    }


    public function beforeExecute()
    {
        parent::beforeExecute();

        $this->smarty->addPluginsDir(APP_PATH.'/SmartyPlugins');
        $theme = config('base.theme');
        $this->smarty->assign('cms_theme_path',getBaseURL().'/themes/'.$theme);
        //模板路径
        $tplDir = SYS_PATH.'/themes/'.$theme.'/';
        $this->smarty->setTemplateDir($tplDir);
        $this->assign('freecms_year',date("Y"));

        //会员
        $member = session('current_member');
        $this->assign('CurrentMember',$member);
    }

}