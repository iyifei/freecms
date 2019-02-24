<?php

namespace FreeCMS\Common\Database\Mysql;

use FreeCMS\Common\Database\DatabaseConfig;
use FreeCMS\Common\Database\IConnect;
use FreeCMS\Common\Libs\Logger;
use FreeCMS\Common\Libs\Utils;

/**
 * Class [MysqlConnect]
 * Mysal数据库连接
 * author minyifei
 * date 2019/2/22
 */
class MysqlConnect implements IConnect
{

    /**
     * @var MysqlConnect
     */
    private static $instance;

    /**
     * @var DatabaseConfig[] 数据库配置
     */
    private $configMap;

    /**
     * 连接集合
     *
     * @var array
     */
    protected static $connectMap = [];


    /**
     * Function:getInstance
     * 描述
     *
     * @return MysqlConnect
     */
    public static function getInstance()
    {
        if (!isset(self::$instance)) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    /**
     * Function:setConfig
     * 设置数据库连接信息
     *
     * @param DatabaseConfig $dbConfig
     *
     * @return IConnect
     */
    public function setConfig($dbConfig)
    {
        $id = $dbConfig->getId();
        $this->configMap[$id] = $dbConfig;
        return $this;
    }

    /**
     * Function:getConnect
     * 获取连接
     *
     * @param string $configId
     *
     * @return MysqlPDO|mixed|\PDO
     */
    public function getConnect($configId)
    {
        if (isset(self::$connectMap[$configId])) {
            $conn = self::$connectMap[$configId];
        } else {
            $conn = $this->createConnect($configId);
        }
        return $conn;
    }

    /**
     * 创建连接
     *
     * @param String $configId 连接名称
     *
     * @return MysqlPDO
     */
    public function createConnect($configId)
    {
        $config = $this->configMap[$configId];
        $startTime = Utils::getMillisecond();
        $dsn = sprintf(
            "mysql:host=%s;dbname=%s;port=%d;charset=%s",
            $config->getHost(), $config->getDbName(),
            $config->getPort(), $config->getCharset()
        );
        $pdo = new MysqlPDO(
            $dsn, $config->getUser(), $config->getPassword()
        );
        $pdo->setDbName($config->getDbName());
        $pdo->setId($configId);
        Logger::debug(
            sprintf(
                "mysqlPdo costTime=【%s】，configId=【%s】",
                (Utils::getMillisecond() - $startTime),  $configId
            )
        );
        self::$connectMap[$configId]=$pdo;
        return $pdo;
    }

    /**
     * 所有连接开启事务
     *
     * @return mixed
     */
    public function beginAll()
    {
        foreach (self::$connectMap as $conn) {
            /**
             * @var MysqlPDO $conn ;
             */
            Logger::debug(sprintf("transaction begin MysqlConnect connID=【%s】",$conn->getId()));
            $conn->beginTransaction();
        }
    }

    /**
     * 所有连接回滚事务
     *
     * @return mixed
     */
    public function rollbackAll()
    {
        foreach (self::$connectMap as $conn) {
            /**
             * @var MysqlPDO $conn ;
             */
            Logger::debug(sprintf("transaction rollback MysqlConnect connID=【%s】",$conn->getId()));
            $conn->rollBack();
        }
    }

    /**
     * 所有连接提交事务
     *
     * @return mixed
     */
    public function commitAll()
    {
        foreach (self::$connectMap as $conn) {
            /**
             * @var MysqlPDO $conn ;
             */
            Logger::debug(sprintf("transaction commit MysqlConnect connID=【%s】",$conn->getId()));
            $conn->commit();
        }
    }

    /**
     * Singleton constructor.
     * 不允许从外部调用以防止创建多个实例
     * 要使用单例，必须通过 Singleton::getInstance() 方法获取实例
     */
    private function __construct()
    {
    }

    /**
     * 防止实例被克隆（这会创建实例的副本）
     */
    private function __clone()
    {
    }

    /**
     * 防止反序列化（这将创建它的副本）
     */
    private function __wakeup()
    {
    }
}