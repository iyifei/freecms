<?php
/**
 * Class [ImageEditPage]
 * 请描述类的功能
 * author minyifei
 * date 2018/11/21
 */

namespace FreeCMS\Admin\Pages\Content;



use FreeCMS\Common\Enum\ChannelType;

class ImageEditPage extends ArchivesPage
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
        $this->entrance(ChannelType::Image);
        $this->display();
    }
}