<?php
/**
 * Class [AudioEditPage]
 * 音频
 * author minyifei
 * date 2018/11/22
 */

namespace FreeCMS\Admin\Pages\Content;



use FreeCMS\Common\Enum\ChannelType;

class AudioEditPage extends ArchivesPage
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
        $this->entrance(ChannelType::Audio);
        $this->display();
    }
}