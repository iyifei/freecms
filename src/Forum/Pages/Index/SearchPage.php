<?php
/**
 * Class [SearchPage]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/17
 */

namespace FreeCMS\Forum\Pages\Index;


use FreeCMS\Forum\BaseForumPage;

class SearchPage extends BaseForumPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $keyword = requestNotEmpty('keyword');
        $data = [
            'keyword'=>$keyword,
            'page'=>getInteger('p',1),
            'pagetype'=>'search',
            'title'=>$keyword,
        ];
        $this->assign('freecms',$data);
        $this->display();
    }
}