<?php
/**
 * Class [StorageClient]
 * 存储
 * author minyifei
 * date 2019/3/13
 */

namespace FreeCMS\Common\Libs;


class StorageClient
{

    /**
     * Function:info
     * 读取文件的信息
     *
     * @param $key
     *
     * @return mixed
     */
    public static function info($key){
        $infoUrl = sprintf("%s/%s?info",getLocalOssDomain(),$key);
        $res = Http::get($infoUrl);
        $infoJson = json_decode($res,true);
        return $infoJson;
    }


}