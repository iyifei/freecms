<?php
namespace FreeCMS\Common\Model;
use FreeCMS\Common\Database\DatabaseConfig;
use FreeCMS\Common\Database\Mysql\MysqlModel;

/**
 * Class [Model]
 * 基础数据库model类
 * author minyifei
 * date 2019/2/24
 */

class Model extends MysqlModel
{

    static private $_config;

    /**
     * Function:getDbConfig
     * 获取配置文件
     *
     * @return DatabaseConfig
     */
    public function getDbConfig()
    {
        if(!isset(self::$_config)){
            $mysqlConfig = config("mysql");
            $config = $mysqlConfig['database'][$mysqlConfig['default']];
            $dbConfig =  new DatabaseConfig();
            $dbConfig->setDbName($config['dbname']);
            $dbConfig->setHost($config['host']);
            $dbConfig->setPort($config['port']);
            $dbConfig->setUser($config['user']);
            $dbConfig->setPassword($config['password']);
            $dbConfig->setCharset($config['charset']);
            self::$_config = $dbConfig;
        }
        return self::$_config;
    }
}