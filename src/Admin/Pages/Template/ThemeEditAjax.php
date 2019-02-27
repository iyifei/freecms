<?php
/**
 * Class [ThemeEditAjax]
 * 编辑主题
 * author minyifei
 * date 2019/2/27
 */

namespace FreeCMS\Admin\Pages\Template;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Libs\File;

class ThemeEditAjax extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $theme = requestNotEmpty('theme');
        $config = array();
        $config["author"] = post("author");
        $config["name"] = post("name");
        $config["web"] = post("web");
        $config["version"] = post("version");
        $config["color"] = post("color");
        $config["description"] = post("description");
        $config["updatetime"] = getCurrentTime();
        $method = post("method");
        $themePath = dirname($this->getThemePath()).'/'.$theme;
        $picFile = $themePath.'/default.jpg';
        $configFile  = $themePath.'/default.php';
        $litpicFile = SYS_PATH.post('litpic');
        File::writeArray($configFile,$config);
        rename($litpicFile,$picFile);
        if($method=='add'){
            $templates = $this->defaultTemplates();
            foreach ($templates as $value) {
                $tempfile = $themePath . "/" . $value["filename"];
                File::write($tempfile, $value["info"]);
            }
        }
        $this->successJson('ok');
    }
}