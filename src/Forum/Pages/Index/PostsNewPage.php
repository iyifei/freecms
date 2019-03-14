<?php
/**
 * Class [PostsNewPage]
 * 新帖
 * author minyifei
 * date 2019/3/14
 */

namespace FreeCMS\Forum\Pages\Index;


use FreeCMS\Forum\BaseForumPage;

class PostsNewPage extends BaseForumPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $cenid = $vars['cenid'];
        $this->assign('cenid',$cenid);
        $this->display();
    }
}