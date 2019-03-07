<?php
namespace FreeCMS\Storage\Pages;

use FreeCMS\Common\Model\CmsSysConfigModel;
use FreeCMS\Storage\BaseCloudPage;
use FreeCMS\Storage\GEnum\ExtensionType;
use FreeCMS\Storage\Libs\AdapterManager;
use FreeCMS\Storage\Plugin\FileInfo;
use FreeCMS\Storage\Plugin\FileThumbnail;
use Overtrue\Flysystem\Qiniu\Plugins\FileUrl;

/**
 * Class [IndexAjax]
 * 获取缩略图
 * thumbnail w-100/h-80
 * author minyifei
 * date 2018/11/16
 */
class IndexAjax extends BaseCloudPage
{

    /**
     *
     * Function:execute
     * 执行入口
     *
     * @param array $vars
     *
     * @throws \Exception
     * @return void
     */
    function execute($vars = [])
    {
        $key = $vars;
        if(!empty($key) && $key!='/'){
            if(defined('PREFIX_URI')){
                $key = str_replace_once(PREFIX_URI,'',$key);
            }
            //存储key
            $key = ltrim($key, '/');

            //缩略图
            $thumbnail = get('thumbnail',null);
            //缩略图参数
            $thumbParam = [];
            if(!empty($thumbnail)){
                $thumbParams = explode('/',$thumbnail);
                foreach ($thumbParams as $tt){
                    list($k,$v) = explode('-',$tt);
                    if(intval($v)>0 && in_array($k,['w','h'])){
                        $thumbParam[$k]=intval($v);
                    }
                }
            }

            //是否添加水印,水印配置参考系统
            $water = get('water');
            $waterParam = [];
            if($water=='1'){
                $configModel = new CmsSysConfigModel();
                $configMap = $configModel->getCacheConfigs();
                $waterParam['type']=$configMap['sys_cfg_water_type']['value'];
                list($ww,$wh)=explode(',',$configMap['sys_cfg_water_size']['value']);
                $waterParam['minWidth']=$ww;
                $waterParam['minHeight']=$wh;
                $waterParam['word']=$configMap['sys_cfg_water_word']['value'];
                list($wf,$wc)=explode(',',$configMap['sys_cfg_water_font']['value']);
                $waterParam['fontsize']=$wf;
                $waterParam['color']=$wc;
                $waterParam['position']=$configMap['sys_cfg_water_pos']['value'];
            }

            //获取Filesystem实例
            $fileSystem = AdapterManager::getFilesystem();

            $has = $fileSystem->has($key);
            if($has){
                //资源后缀
                $pathInfo = pathinfo($key);
                $ext = $pathInfo['extension'];

                //读取文件属性信息
                if(isset($_GET['info'])){
                    $fileSystem->addPlugin(new FileInfo());
                    $info = $fileSystem->getInfo($key);
                    header('Content-Type:application/json; charset=utf-8');
                    exit(json_encode($info));
                }else{
                    //读取缩略图,需要是图片、视频格式
                    if(!empty($thumbParam) && ExtensionType::isSupportThumbnail($ext)){
                        $fileSystem->addPlugin(new FileThumbnail());
                        $url = $fileSystem->getThumbnail($key,$thumbParam);
                    }else{
                        //返回原始文件
                        $fileSystem->addPlugin(new FileUrl());
                        $url = $fileSystem->getUrl($key);
                    }
                    header("Location:".$url);
                    exit;
                }
            }
        }
        Header("HTTP/1.1 404 Not Found");
        exit;
    }
}