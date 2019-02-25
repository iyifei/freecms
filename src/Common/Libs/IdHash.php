<?php
/**
 * Class [IdHash]
 * 请描述类的功能
 * author minyifei
 * date 2018/12/6
 */

namespace FreeCMS\Common\Libs;


use Hashids\Hashids;

class IdHash
{

    private static $_hashids;


    /**
     * Function:encode
     * 加密数字
     *
     * @param int $id 待加密的数字
     *
     * @return string 返回加密字符串
     */
    public static function encode($id){
        return self::getHashIds()->encode($id);
    }


    /**
     * Function:decode
     * 解析加密字符串
     *
     * @param string $hash 加密字符串
     * @param null $default 默认值
     *
     * @return null
     */
    public static function decode($hash,$default=null){
        $ids = self::getHashIds()->decode($hash);
        if(count($ids)==1){
            return $ids[0];
        }else{
            return $default;
        }
    }


    private static function getHashIds(){
        if(!isset(self::$_hashids)){
            self::$_hashids = new Hashids('freecms',8);
        }
        return self::$_hashids;
    }

}