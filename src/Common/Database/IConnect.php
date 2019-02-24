<?php
/**
 * Class [IConnect]
 * 数据库连接接口
 * author minyifei
 * date 2019/2/22
 */
namespace FreeCMS\Common\Database;

interface IConnect
{

    /**
     * Function:getConnect
     * 获取mysql连接
     *
     * @param string $configId 数据库配置id
     *
     * @return \PDO
     */
    public function getConnect($configId);

    /**
     * 创建连接
     * @param String $configId 配置唯一标识
     * @return \PDO
     */
    public function createConnect($configId);


    /**
     * Function:setConfig
     * 设置配置文件
     *
     * @param DatabaseConfig $dbConfig
     *
     * @return mixed
     */
    public function setConfig($dbConfig);

    /**
     * 所有连接开启事务
     * @return mixed
     */
    public function beginAll();

    /**
     * 所有连接回滚事务
     * @return mixed
     */
    public function rollbackAll();

    /**
     * 所有连接提交事务
     * @return mixed
     */
    public function commitAll();

}