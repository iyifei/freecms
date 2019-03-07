<?php
/**
 * Class [TestPage]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/7
 */

namespace FreeCMS\Www\Pages\Index;


use FreeCMS\Storage\Libs\WaterMask;
use FreeCMS\Www\BaseWwwPage;

class TestPage extends BaseWwwPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $color="#ffffff";
        $rgb = hex2rgb($color);
        $img  = '/Users/minyifei/nova/测试媒体资源/bd0e74188409b9d99ec54d992f59d96d.jpg';
        $file  = '/Users/minyifei/nova/测试媒体资源/bd0e74188409b9d99ec54d992f59d96d_abc.jpg';
        (new WaterMask($img))->save($file);
        echo $file;
    }
}