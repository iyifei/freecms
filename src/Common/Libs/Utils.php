<?php
/**
 * Class [Utils]
 * 工具类
 * author minyifei
 * date 2019/2/22
 */

namespace FreeCMS\Common\Libs;

class Utils
{

    /**
     * 获取当前时间戳-精确到毫秒
     * @return float
     */
    public static function getMillisecond()
    {
        list($s1, $s2) = explode(' ', microtime());
        return (float)sprintf('%.0f', (floatval($s1) + floatval($s2)) * 1000);
    }

    /**
     * 获取唯一id
     * @return string
     */
    public static function getUUID(){
        $randStr = uniqid(mt_rand(), true) . self::getMillisecond();
        $uuid = md5($randStr);
        return $uuid;
    }

    /**
     * 驼峰命名转下划线命名，如 UserName => user_name
     * @param string $s
     * @return string
     */
    public static function toUnderLineName($s) {
        $s = lcfirst($s);
        $chars = str_split($s);
        $res = "";
        foreach ($chars as $c) {
            if (self::isCapitalLetter($c)) {
                $c = "_" . strtolower($c);
            }
            $res .= $c;
        }
        return $res;
    }

    /**
     * 判断字符串是否为大写字母
     * @param string $c
     * @return boolean
     */
    public static function isCapitalLetter($c) {
        if (preg_match('/^[A-Z]+$/', $c)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * Function:getLogId
     * 读取logId
     *
     * @return bool|string
     */
    public static function getLogId(){
        $randStr = uniqid(mt_rand(), true);
        $uuid = md5($randStr);
        return substr($uuid,-10);
    }

    /**
     * Function:echoJson
     * 输出json到浏览器
     *
     * @param array|object $data
     *
     * @return void
     */
    public static function echoJson($data){
        $appExecEndTime = getMillisecond();
        $appExecStartTime = session('appExecStartTime');
        $execTime = $appExecEndTime-$appExecStartTime;
        Logger::debug('Response.php response castTime=['.$execTime.'ms]',$data);
        // 返回JSON数据格式到客户端 包含状态信息
        header('Content-Type:application/json; charset=utf-8');
        exit(json_encode($data));
    }


    /**
     * 读取内容的子类
     * @param $data
     * @param int $pid
     * @param string $pname
     * @return array
     */
    public static function childTree($data, $pid = 0, $pname = "pid")
    {
        $tree = array();
        foreach ($data as $value) {
            if ($value[$pname] == $pid) {
                $value["childs"] = self::childTree($data, $value["id"],$pname);
                $tree[] = $value;
            }
        }
        return $tree;
    }


    /**
     * 把树变为一级数组
     * @param $tree
     * @return array
     */
    public static function childRows($tree){
        $rows = [];
        foreach ($tree as $item){
            $rows[]=$item;
            if(!empty($item['childs'])){
                $rows = array_merge($rows,self::childRows($item['childs']));
            }
        }
        return $rows;

    }


    public static  function removeHtmlStyle($str)
    {
        $output = preg_replace('/(<[^>]+) style=".*?"/i', '$1', $str);
        return $output;
    }

    public static function removeHtmlAllAttr($html){
        return preg_replace("/<([a-z][a-z0-9]*)[^>]*?(\/?)>/i",'<$1$2>', $html);
    }

    public static function removeComment($content){
        $content = str_replace('&#13;','',$content);
        return preg_replace("/<!--[^\!\[]*?(?<!\/\/)-->/","",$content);
    }

    /**
     * Function:compressionHtml
     * 压缩html
     *
     * @param $html
     *
     * @return Compression
     */
    public static function compressionHtml($html){
        return (new Compression($html))->getHtml();
    }
}