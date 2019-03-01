<?php
/**
 * Class [UploadFile]
 * 上传单个文件
 * author minyifei
 * date 2019/2/28
 */

namespace FreeCMS\Storage\Pages;


use FreeCMS\Common\Libs\Utils;
use FreeCMS\Storage\BaseCloudPage;

class UploadFilesPage extends BaseCloudPage
{

    const CLOUD_TOKEN_KEY = 'FreeCMS_Cloud_Token';

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $token = session(self::CLOUD_TOKEN_KEY);
        if(empty($token)){
            $token = Utils::getUUID();
            session(self::CLOUD_TOKEN_KEY,$token);
        }
        $type = requestNotEmpty('type');
        $imageExt = [
            'title'=> "Image files", 'extensions'=> "jpg,gif,png,jpeg,bmp",
        ];
        $videoExt = [
            'title'=> "Video files", 'extensions'=> "mp4" //flv,mpg,mpeg,avi,wmv,mov,asf,rm,rmvb,mkv,m4v,
        ];
        $audioExt = [
            'title'=> 'Audio files','extensions'=>'mp3',
        ];
        $zipExt = [
            'title'=> 'Zip files','extensions'=>'zip',
        ];
        $size = 300;
        $exts = [];
        switch ($type){
            case 'all':
                $exts[]=$imageExt;
                $exts[]=$videoExt;
                $exts[]=$audioExt;
                $exts[]=$zipExt;
                break;
            case "image":
                $exts[]=$imageExt;
                $size = 1;
                break;
            case 'audio':
                $exts[]=$audioExt;
                break;
            case 'video':
                $exts[]=$videoExt;
                break;
            case 'zip':
                $exts[]=$zipExt;
                break;
        }
        $this->assign('type',$type);
        $this->assign('size',$size);
        $this->assign('extJson',json_encode($exts));
        $this->assign('exts',$exts);
        $this->assign('uploadUrl',getLocalOssDomain().'/upload?token='.$token);
        $this->display();
    }
}