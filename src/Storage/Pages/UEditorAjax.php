<?php
/**
 * Class [UEditorAjax]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/11
 */

namespace FreeCMS\Storage\Pages;


use FreeCMS\Common\Libs\File;
use FreeCMS\Storage\BaseCloudPage;
use FreeCMS\Storage\Service\UEditorUpload;

class UEditorAjax extends BaseCloudPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $CONFIG = json_decode(
            preg_replace(
                "/\/\*[\s\S]+?\*\//", "",
                File::read(SYS_PATH . '/statics/oss/ueditor.config.json')
            ), true
        );
        $action = get('action');
        switch ($action) {
            case 'config':
                $result = json_encode($CONFIG);
                break;
            /* 上传图片 */
            case 'uploadimage':
                /* 上传涂鸦 */
            case 'uploadscrawl':
                /* 上传视频 */
            case 'uploadvideo':
                /* 上传文件 */
            case 'uploadfile':
                $configData = $this->getConfigData($action, $CONFIG);
                $res = (new UEditorUpload($configData))->getFileInfo();
                $result = json_encode($res);
                break;
            default:
                $result = json_encode(
                    array(
                        'state' => '请求地址出错'
                    )
                );
                break;
        }

        header("Content-Type: text/html; charset=utf-8");
        /* 输出结果 */
        if (isset($_GET["callback"])) {
            if (preg_match("/^[\w_]+$/", $_GET["callback"])) {
                echo htmlspecialchars($_GET["callback"]) . '(' . $result . ')';
            } else {
                echo json_encode(
                    array(
                        'state' => 'callback参数不合法'
                    )
                );
            }
        } else {
            echo $result;
        }
    }

    private function getConfigData($action, $CONFIG)
    {
        $base64 = "upload";
        switch (htmlspecialchars($action)) {
            case 'uploadimage':
                $config = array(
                    "pathFormat" => $CONFIG['imagePathFormat'],
                    "maxSize" => $CONFIG['imageMaxSize'],
                    "allowFiles" => $CONFIG['imageAllowFiles']
                );
                $fieldName = $CONFIG['imageFieldName'];
                break;
            case 'uploadscrawl':
                $config = array(
                    "pathFormat" => $CONFIG['scrawlPathFormat'],
                    "maxSize" => $CONFIG['scrawlMaxSize'],
                    "allowFiles" => $CONFIG['scrawlAllowFiles'],
                    "oriName" => "scrawl.png"
                );
                $fieldName = $CONFIG['scrawlFieldName'];
                $base64 = "base64";
                break;
            case 'uploadvideo':
                $config = array(
                    "pathFormat" => $CONFIG['videoPathFormat'],
                    "maxSize" => $CONFIG['videoMaxSize'],
                    "allowFiles" => $CONFIG['videoAllowFiles']
                );
                $fieldName = $CONFIG['videoFieldName'];
                break;
            case 'uploadfile':
            default:
                $config = array(
                    "pathFormat" => $CONFIG['filePathFormat'],
                    "maxSize" => $CONFIG['fileMaxSize'],
                    "allowFiles" => $CONFIG['fileAllowFiles']
                );
                $fieldName = $CONFIG['fileFieldName'];
                break;
        }
        return [
            'action' => $action,
            'config' => $config,
            'fileField' => $fieldName,
            'type'=>$base64,
        ];
    }
}