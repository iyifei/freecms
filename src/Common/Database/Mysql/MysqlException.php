<?php
/**
 * Class [MysqlException]
 * 数据库异常
 * author minyifei
 * date 2019/2/22
 */

namespace FreeCMS\Common\Database\Mysql;


class MysqlException extends \RuntimeException
{

    /**
     * 系统级错误
     */
    const SYS_ERROR = 10001;

    /**
     * 配置文件错误
     */
    const MYSQL_CONFIG_ERROR = 10002;

    /**
     * mysql参数错误
     */
    const MYSQL_PARAM_DATA_ERROR = 10003;

    /**
     * sql解析错误
     */
    const MYSQL_SQL_ERROR = 10004;


    public function __construct($message = "", $code = 0, $previous = null)
    {
        parent::__construct($message, $code, $previous);
    }

    /**
     * 抛出异常
     * @param $code
     * @param string $msg
     * @throws MysqlException
     */
    public static function throeExp($code,$msg=''){
        throw  new MysqlException($msg,$code);
    }

}