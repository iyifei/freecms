<?php
/**
 * Class [MysqlConnectTest]
 * 数据库连接单元测试
 * author minyifei
 * date 2019/2/22
 */
namespace Test\Common\Database\Mysql;

use FreeCMS\Common\Database\DatabaseConfig;
use FreeCMS\Common\Database\Mysql\MysqlConnect;
use FreeCMS\Common\Database\Mysql\MysqlException;
use PHPUnit\Framework\TestCase;
use Test\Common\Database\Model\UserModel;

class MysqlConnectTest extends TestCase
{

    public function testGetConnect(){
        $connect = $this->getConnect();
        $pdo = $connect->getConnect($this->getConfig()->getId());
        $this->assertInstanceOf(\PDO::class,$pdo);
    }

    /**
     * Function:getConnect
     * 获取mysql连接
     *
     * @return \FreeCMS\Common\Database\IConnect
     */
    private function getConnect(){
        $config = $this->getConfig();
        return MysqlConnect::getInstance()->setConfig($config);
    }

    /**
     * Function:getConfig
     * 获取配置文件
     *
     * @return DatabaseConfig
     */
    private function getConfig(){
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

    //测试提交
    public function testCommit(){
        $userModel = new UserModel();
        $this->getConnect()->beginAll();
        try{
            $name = 'test'.rand(1,10000);
            $data = [
                'name'=>$name,
                'create_time'=>date('Y-m-d H:i:s'),
            ];
            $id = $userModel->add($data);

            $row = $userModel->findById($id);
            $this->assertEquals($row['name'],$name);

            $rowCount = $userModel->deleteById($id);
            $this->assertEquals($rowCount,1);

            $this->getConnect()->commitAll();
        }catch (\Exception $e){
            $this->getConnect()->rollbackAll();
        }
    }

    //测试回滚
    public function testRollback(){
        $userModel = new UserModel();
        $this->getConnect()->beginAll();
        try{
            $addData = [
                'name'=>'test'.rand(100,10000),
                'create_time'=>date("Y-m-d H:i:s"),
            ];
            $id = $userModel->add($addData);
            //抛出异常
            MysqlException::throeExp(1,'test mysqlConnect rollback');
            $this->getConnect()->commitAll();
        }catch (MysqlException $e){
            $this->getConnect()->rollbackAll();
        }

        $row = $userModel->findById($id);
        $this->assertEmpty($row);
    }

}