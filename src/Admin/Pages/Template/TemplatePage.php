<?php
/**
 * Class [TemplatePage]
 * 模板管理
 * author minyifei
 * date 2018/11/20
 */

namespace FreeCMS\Admin\Pages\Template;



use FreeCMS\Admin\BaseAdminPage;

class TemplatePage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $path = $this -> getThemePath();
        $files = $this->getTempFiles($path);
        $this -> assign("files", $files);
        $this->display();
    }

    private function getTempFiles($path) {
        $files = array();
        $current_dir = opendir($path);
        $templates = $this -> defaultTemplates();
        //遍历主题下的文件
        while (($file = readdir($current_dir)) !== false) {
            if ($file == '.' || $file == '..') {
                continue;
            } else {
                //文件名
                $name = trim($file);
                //更新时间
                $updateTime = date("Y-m-d H:i:s", filemtime($path .'/'. $file));
                if (strpos($name, ".tpl") > 0) {
                    $f = array("filename" => $name, "updatetime" => $updateTime, "info" => "未知模板");
                    foreach ($templates as $key => $value) {
                        if ($name == $value["filename"]) {
                            $f["info"] = $value["info"];
                            $f["default"] = true;
                            break;
                        }
                    }
                    $files[] = $f;
                }
            }
        }
        return $files;
    }

}