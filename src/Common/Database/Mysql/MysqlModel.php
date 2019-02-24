<?php
/**
 * Class [MysqlModel]
 * Mysql基类Model抽象类
 * author minyifei
 * date 2019/2/22
 */

namespace FreeCMS\Common\Database\Mysql;

use FreeCMS\Common\Database\DatabaseConfig;
use FreeCMS\Common\Libs\Utils;

abstract class MysqlModel extends MysqlDatabase
{


    public function __construct()
    {
        $dbConfig = $this->getDbConfig();
        parent::__construct($dbConfig);
        $tableName = $this->getTableName();
        $this->table($tableName);
    }

    /**
     * Function:getDbConfig
     * 获取配置文件
     *
     * @return DatabaseConfig
     */
    abstract public function getDbConfig();


    /**
     * 获取表名称
     * @return mixed
     */
    public function getTableName()
    {
        $className = get_class($this);
        $names = explode("\\", $className);
        $class = array_pop($names);
        $tableName = Utils::toUnderLineName($class);
        //去掉未部的_model,把user_model改为user
        $tableNames = explode("_",$tableName);
        $len = count($tableNames);
        if($tableNames[$len-1]=='model'){
            unset($tableNames[$len-1]);
        }
        $tableName = join("_",$tableNames);
        return $tableName;
    }

    /**
     * 查询所有记录
     * @param null $args
     * @param bool $value
     * @return array|mixed|null
     */
    public function selectAll($args = null, $value = false)
    {
        return $this->setOptions($args,$value)->findAll();
    }

    /**
     * 查询一条记录
     * @param null $args
     * @param bool $value
     * @return array|mixed|null
     */
    public function find($args = null, $value = false)
    {
        return $this->setOptions($args,$value)->findFirst();
    }

    /**
     * 根据主键查询
     * @param int $id
     * @return array|mixed|null
     * @throws MysqlException
     */
    public function findById($id)
    {
        return $this->find('id',$id);
    }

    /**
     * @param int $id
     * @return mixed
     */
    public function deleteById($id)
    {
        $where = sprintf('id=%d',$id);
        return $this->where($where)->delete();
    }

    /**
     * Function:updateById
     * 根据主键更新内容
     *
     * @param int $id 主键
     * @param array $data 数据
     *
     * @return MysqlModel|int
     */
    public function updateById($id,$data){
        $where = sprintf('id=%d',$id);
        return $this->update($data,$where);
    }

    /**
     * 设置参数
     * @param $args
     * @param bool $value
     * @return $this
     */
    protected function setOptions($args,$value=false){
        if(gettype($value)!='boolean' && !empty($value)){
            $bindKey = sprintf(":%s",$args);
            if(is_array($value)){
                $in  = str_repeat('?,', count($value) - 1) . '?';
                $where = sprintf("%s in(%s)",$args,$in);
                $bind = $value;
            }else{
                $where = sprintf("%s=%s",$args,$bindKey);
                $bind = [$bindKey=>$value];
            }
            $this->where($where)->bind($bind);
        }elseif(is_string($args)){
            $this->where($args);
        }
        return $this;
    }

}