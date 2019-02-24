<?php
/**
 * Class [DatabaseConfig]
 * 数据库配置
 * author minyifei
 * date 2019/2/22
 */

namespace FreeCMS\Common\Database;


class DatabaseConfig
{

    /**
     * @var string 连接地址
     */
    private $host;

    /**
     * @var int 端口
     */
    private $port = 3306;

    /**
     * @var string 用户
     */
    private $user;

    /**
     * @var string 密码
     */
    private $password = '';

    /**
     * @var string 操作的数据库名称
     */
    private $dbName;

    /**
     * @var string 数据库编码格式
     */
    private $charset = 'utf8';


    /**
     * @return string
     */
    public function getHost()
    {
        return $this->host;
    }

    /**
     * @param string $host
     */
    public function setHost($host)
    {
        $this->host = $host;
    }

    /**
     * @return int
     */
    public function getPort()
    {
        return $this->port;
    }

    /**
     * @param int $port
     */
    public function setPort($port)
    {
        $this->port = $port;
    }

    /**
     * @return string
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * @param string $user
     */
    public function setUser($user)
    {
        $this->user = $user;
    }

    /**
     * @return string
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password = $password;
    }

    /**
     * @return string
     */
    public function getCharset()
    {
        return $this->charset;
    }

    /**
     * @param string $charset
     */
    public function setCharset($charset)
    {
        $this->charset = $charset;
    }

    /**
     * @return string
     */
    public function getDbName()
    {
        return $this->dbName;
    }

    /**
     * @param string $dbName
     */
    public function setDbName($dbName)
    {
        $this->dbName = $dbName;
    }


    /**
     * 获取数据库配置唯一标识
     *
     * @return string
     */
    public function getId()
    {
        $id = md5(
            sprintf(
                'host=%s:%d,user=%s,db=%s',
                $this->host, $this->port,
                $this->user, $this->dbName
            )
        );
        return substr($id,-8);
    }

}