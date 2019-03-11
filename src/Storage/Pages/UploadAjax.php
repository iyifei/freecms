<?php
namespace FreeCMS\Storage\Pages;

use FreeCMS\Common\Exception\FreeCmsException;
use FreeCMS\Common\Model\CmsSysConfigModel;
use FreeCMS\Storage\BaseCloudPage;
use FreeCMS\Storage\GEnum\ErrorCode;
use FreeCMS\Storage\Libs\AdapterManager;
use FreeCMS\Storage\Libs\WaterMask;
use Overtrue\Flysystem\Qiniu\Plugins\FileUrl;

/**
 * Class [UploadAjax]
 * 上传接口
 * author minyifei
 * date 2018/11/16
 */
class UploadAjax extends BaseCloudPage
{

    /**
     * Function:execute
     * 描述
     *
     * @param array $vars
     *
     * @throws \Exception
     * @return void
     */
    function execute($vars = [])
    {
        //上传的文件句柄名称
        $uploadName = 'file';
        //授权token
        $token = requestNotEmpty('token');
        if(session('FreeCMS_Cloud_Token')==$token){
            // Support CORS
            header("Access-Control-Allow-Origin: *");
            //@TODO 需要改为后台管理的域名
            //header("Access-Control-Allow-Origin: http://admin.freecms.cn");
            header("Access-Control-Allow-Credentials: true");
            if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
                exit; // finish preflight CORS requests here
            }
            $tmpFile = $_FILES[$uploadName]['tmp_name'];
            //oss存储的key
            //$key = request('key');
            //如果没有指定key，则用文件名作为key
            $filename = $_FILES[$uploadName]['name'];
            $exts = explode('.',$filename);
            $ext  = $exts[count($exts)-1];
            $key = 'media/'.date("Ymd").'/'.substr(md5($tmpFile),-15).'.'.$ext;
            $fileSystem = AdapterManager::getFilesystem();

            //水印配置
            $wc = config('water');
            //启用水印
            if($wc['enable']){
                try{
                    $water = new WaterMask($tmpFile);
                    $water->waterType=$wc['type'];
                    $water->waterStr = $wc['word'];
                    $water->pos = $wc['position'];
                    $water->fontColor = $wc['fontColor'];
                    $water->fontSize = $wc['fontSize'];
                    $water->transparent = $wc['transparent'];
                    $water->save($tmpFile);
                }catch (\Exception $e){};
            }


            $stream = fopen($tmpFile,'r+');
            $res = $fileSystem->putStream($key,$stream);

            if(is_resource($stream)){
                fclose($stream);
            }
            if($res){
                //本机地址
                $domain = getLocalOssDomain();
                $url = sprintf("%s/%s",$domain,$key);

                //原始地址,可用于下载
                $fileSystem->addPlugin(new FileUrl());
                $origin = $fileSystem->getUrl($key);

                $data = [
                    'key'=>$key,
                    'url'=>$url,
                    'origin'=>$origin,
                ];
               $this->successJson($data);
            }else{
                FreeCmsException::throwExp(ErrorCode::ACCESS_KEY_ERROR,'access error');
            }
        }else{
            FreeCmsException::throwExp(ErrorCode::TOKEN_ERROR,'token error');
        }
    }
}