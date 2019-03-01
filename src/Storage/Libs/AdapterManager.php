<?php
namespace FreeCMS\Storage\Libs;

use Illuminate\Container\Container;
use League\Flysystem\AdapterInterface;
use League\Flysystem\Filesystem;
use FreeCMS\Storage\Adapter\AliyunAdapter;
use FreeCMS\Storage\Adapter\LocalAdapter;
use FreeCMS\Storage\Adapter\QiniuAdapter;
use FreeCMS\Storage\GEnum\OssBusinessType;
use FreeCMS\Common\GEnum\OssType;

/**
 * 适配器管理
 * User: myf
 * Date: 2018/3/29
 * Time: 17:22
 */
class AdapterManager
{

    /**
     * Function:getFilesystem
     * 获取Filesystem实例
     *
     * @param array|null $adapterConfig 配置
     * @throws \Exception
     * @return Filesystem
     */
    public static function getFilesystem($adapterConfig=null){
        //初始化容器
        $container = Container::getInstance();

        if(!isset($adapterConfig)){
            $adapterConfig = config('oss.adapter');
        }
        //读取自定义的扩展
        $container->bind(AdapterInterface::class,$adapterConfig['class']);
        $container->when($adapterConfig['class'])->needs('$param')->give($adapterConfig['param']);

        //实例化Filesystem
        /**
         * @var Filesystem $fileSystem
         */
        $fileSystem = $container->make(Filesystem::class);
        return $fileSystem;
    }

}