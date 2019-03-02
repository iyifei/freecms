<?php
/**
 * Class [IndexPage]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/1
 */

namespace FreeCMS\Www\Pages\Index;


use FreeCMS\Www\BaseWwwPage;

class IndexPage extends BaseWwwPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $filename = 'index.tpl';
        $this->display($filename);
    }
}