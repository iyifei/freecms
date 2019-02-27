<?php
/**
 * Class [ThemeOperateAjax]
 * 操作模板主题
 * author minyifei
 * date 2019/2/27
 */

namespace FreeCMS\Admin\Pages\Template;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Exception\ErrorCode;
use FreeCMS\Common\Exception\FreeCmsException;
use FreeCMS\Common\Libs\File;

class ThemeOperateAjax extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        //操作类型
        $type = requestNotEmpty('type');
        //主题
        $theme = requestNotEmpty('theme');
        //当前模板
        $currentTheme = $this->getCurrentTheme();

        //判断主题是否存在
        $themePath =  dirname($this->getThemePath()).'/'.$theme;
        $themeConfigFile = $themePath.'/default.php';
        if(!is_file($themeConfigFile)){
            FreeCmsException::throwExp(ErrorCode::PARAM_ERROR,'操作的主题不存在');
        }

        //使用新模板
        if($type=='use'){
            if($theme==$currentTheme){
                FreeCmsException::throwExp(ErrorCode::PARAM_ERROR,'当前主题在使用中');
            }else{
                $baseConfigFile = SYS_PATH.'/configs/base.config.php';
                $baseConfig = config('base');
                $baseConfig['theme']=$theme;
                File::writeArray($baseConfigFile,$baseConfig);
            }
        }elseif($type=='uninstall') {
            //卸载
            if ($theme == $currentTheme) {
                FreeCmsException::throwExp(
                    ErrorCode::PARAM_ERROR, '当前主题在使用中,无法卸载'
                );
            } else {
                File::deleteTree($themePath);
            }
        }
        $this->successJson('ok');
    }
}