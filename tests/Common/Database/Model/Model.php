<?php
/**
 * Class [Model]
 * 测试model
 * author minyifei
 * date 2019/2/22
 */

namespace Test\Common\Database\Model;


use FreeCMS\Common\Database\DatabaseConfig;
use FreeCMS\Common\Database\Mysql\MysqlModel;

class Model extends MysqlModel
{
    /**
     * Function:getDbConfig
     * 获取配置文件
     *
     * @return DatabaseConfig
     */
    public function getDbConfig()
    {
        $config = [
            'host' => 'localhost',
            'port' => '3306',
            'user' => 'root',
            'password' => 'minyifei.cn',
            'dbname' => 'test',
            'charset' => 'utf8',
        ];
        $dbConfig =  new DatabaseConfig();
        $dbConfig->setDbName($config['dbname']);
        $dbConfig->setHost($config['host']);
        $dbConfig->setPort($config['port']);
        $dbConfig->setUser($config['user']);
        $dbConfig->setPassword($config['password']);
        $dbConfig->setCharset($config['charset']);
        return $dbConfig;
    }
}