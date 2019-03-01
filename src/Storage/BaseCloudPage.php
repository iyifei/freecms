<?php
/**
 * Class [BaseCloudPage]
 * 云存储接口基类
 * author minyifei
 * date 2019/2/28
 */

namespace FreeCMS\Storage;


use FreeCMS\Common\Libs\Page;

abstract class BaseCloudPage extends Page
{

    public function __construct()
    {
        //文件目录
        define('APP_PATH',__DIR__);
    }

}