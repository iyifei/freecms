<?php
/**
 * Class [VideoEditPage]
 * 请描述类的功能
 * author minyifei
 * date 2018/11/21
 */

namespace FreeCMS\Admin\Pages\Content;



use FreeCMS\Common\Enum\ChannelType;

class VideoEditPage extends ArchivesPage
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
        $this->entrance(ChannelType::Video);
        $this->display();
    }
}