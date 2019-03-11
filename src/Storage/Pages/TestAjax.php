<?php
/**
 * Class [TestAjax]
 * 测试oss是否可用
 * author minyifei
 * date 2018/12/6
 */

namespace FreeCMS\Storage\Pages;


use FreeCMS\Common\Exception\FreeCmsException;
use FreeCMS\Storage\BaseCloudPage;
use FreeCMS\Storage\Libs\AdapterManager;
use Overtrue\Flysystem\Qiniu\Plugins\FileUrl;

class TestAjax extends BaseCloudPage
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
        $type =requestNotEmpty('type');
        $id = requestNotEmpty('id');
        $secret = requestNotEmpty('secret');
        $bucket = requestNotEmpty('bucket');
        $domain = requestNotEmpty('domain');
        $adapter = null;
        switch ($type){
            case 'Qiniu':
                $adapter = [
                    'class'=>\FreeCMS\Storage\Adapter\QiniuAdapter::class,
                    'param' => [
                        'accessKey'=>$id,
                        'secretKey'=>$secret,
                        'bucket'=>$bucket,
                        'domain'=>$domain,
                    ],
                ];
                break;
            case 'Aliyun':
                $adapter = [
                    'class'=>\FreeCMS\Storage\Adapter\AliyunAdapter::class,
                    'param' => [
                        'access_id'     => $id,
                        'access_secret' => $secret,
                        'bucket'        => $bucket,
                        'endpoint'       => $domain,
                    ],
                ];
                break;
        }
        if(isset($adapter)){
            $fileSystem = AdapterManager::getFilesystem($adapter);
            $testFile = SYS_PATH.'/statics/oss/test.png';
            $key = 'freecms_test.png';
            $stream = fopen($testFile,'r+');
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
                FreeCmsException::throwParamExp('配置参数错误');
            }
        }else{
            FreeCmsException::throwParamExp('参数错误');
        }

    }
}