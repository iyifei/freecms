<?php
/**
 * Class [VideoPage]
 * 视频内容管理
 * author minyifei
 * date 2018/11/20
 */

namespace FreeCMS\Admin\Pages\Content;



use FreeCMS\Common\Enum\ChannelType;

class VideoPage extends ArchivesPage
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
        $res = $this->archives(ChannelType::Video);
        $this->assign('res',$res);
        $this->display();
    }
}