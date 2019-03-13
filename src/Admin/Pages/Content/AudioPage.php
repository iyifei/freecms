<?php
/**
 * Class [AudioPage]
 * 音频文章管理
 * author minyifei
 * date 2018/11/20
 */

namespace FreeCMS\Admin\Pages\Content;




use FreeCMS\Common\Enum\ChannelType;

class AudioPage extends ArchivesPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $res = $this->archives(ChannelType::Audio);
        $this->assign('res',$res);
        $this->display();
    }
}