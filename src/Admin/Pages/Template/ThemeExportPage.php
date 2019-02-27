<?php
/**
 * Class [ThemeExportPage]
 * 主题导出
 * author minyifei
 * date 2019/2/27
 */

namespace FreeCMS\Admin\Pages\Template;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Exception\ErrorCode;
use FreeCMS\Common\Exception\FreeCmsException;

class ThemeExportPage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        //主题
        $theme = requestNotEmpty('theme');
        //判断主题是否存在
        $themePath =  dirname($this->getThemePath()).'/'.$theme;
        $themeConfigFile = $themePath.'/default.php';
        if(!is_file($themeConfigFile)){
            FreeCmsException::throwExp(ErrorCode::PARAM_ERROR,'操作的主题不存在');
        }

        $zipFile = dirname($themePath)."/{$theme}.zip";
        $pclZip = new \PclZip($zipFile);
        $vlist  = $pclZip->create($themePath.'/',PCLZIP_OPT_REMOVE_PATH,$themePath);
        if($vlist==0){
            FreeCmsException::throwExp(ErrorCode::FAIL,'导出失败');
        }else{
            header("Location:".getBaseURL().'/themes/'.$theme.'.zip');
            exit;
        }
    }
}