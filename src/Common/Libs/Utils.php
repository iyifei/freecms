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
}