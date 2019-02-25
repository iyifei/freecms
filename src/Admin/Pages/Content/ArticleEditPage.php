<?php
/**
 * Class [ArticleEditPage]
 * 请描述类的功能
 * author minyifei
 * date 2018/11/20
 */

namespace FreeCMS\Admin\Pages\Content;


use FreeCMS\Common\Enum\ChannelType;

class ArticleEditPage extends ArchivesPage
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
        $this->entrance(ChannelType::Article);
        $this->display();
    }
}