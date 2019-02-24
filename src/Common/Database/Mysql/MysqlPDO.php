<?php
/**
 * Class [MysqlPDO]
 * Mysql PDO类
 * author minyifei
 * date 2019/2/22
 */

namespace FreeCMS\Common\Database\Mysql;

class MysqlPDO extends \PDO
{

    /**
     * 当前pdo连接唯一id
     * @var String
     */
    protected $id;

    /**
     * 当前操作的数据库
     * @var String
     */
    protected $dbName;

    /**
     * @return String
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param String $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return String
     */
    public function getDbName()
    {
        return $this->dbName;
    }

    /**
     * @param String $dbName
     */
    public function setDbName($dbName)
    {
        $this->dbName = $dbName;
    }



}