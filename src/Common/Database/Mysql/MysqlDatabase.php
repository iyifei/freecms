<?php
/**
 * Class [MysqlDatabase]
 * Mysql数据库操作类
 * author minyifei
 * date 2019/2/22
 */

namespace FreeCMS\Common\Database\Mysql;


use FreeCMS\Common\Database\Enum\DatabaseActionType;
use FreeCMS\Common\Database\DatabaseConfig;
use FreeCMS\Common\Database\IDatabase;
use FreeCMS\Common\Database\Enum\MappingType;
use FreeCMS\Common\Libs\Logger;
use FreeCMS\Common\Libs\Utils;

class MysqlDatabase implements IDatabase
{

    /**
     * @var MysqlConnect 连接
     */
    protected $connect;

    /**
     * @var MysqlPDO
     */
    protected $pdo;

    /**
     * @var DatabaseConfig 数据库连接配置
     */
    protected $config;

    /**
     * @var array
     */
    protected $linkMap = [];

    /**
     * 查询条件
     *
     * @var array
     */
    protected $optionArr = [];

    /**
     * 当前操作表名称
     *
     * @var string
     */
    protected $table = '';

    /**
     * 添加数据的绑定参数前缀
     *
     * @var string
     */
    protected static $addPrefix = 'MyfPdo_ADD_';

    /**
     * 更新数据的绑定参数前缀
     *
     * @var string
     */
    protected static $updatePrefix = 'MyfPdo_UPDATE_';


    public function __construct(DatabaseConfig $dbConfig)
    {
        $this->connect = MysqlConnect::getInstance()->setConfig($dbConfig);
        $this->config = $dbConfig;
        $this->pdo = $this->connect->getConnect($this->config->getId());
    }

    /**
     * 设置表名称
     *
     * @param String $name 表名称
     *
     * @return mixed
     */
    public function table($name)
    {
        $this->table = $name;
        $this->optionArr['table'] = $this->table;
    }

    /**
     * 获取连接名称
     *
     * @return mixed
     */
    public function getDatabaseName()
    {
        return $this->config->getDbName();
    }

    /**
     * 查询一条记录
     *
     * @return mixed
     */
    public function findFirst()
    {
        return $this->findAll(false);
    }

    /**
     * 返回查询记录
     *
     * @param bool $allRow true-返回所有记录，false-返回一条记录
     *
     * @return mixed
     */
    public function findAll($allRow = true)
    {
        //字段
        if (!isset($this->optionArr['field'])) {
            $this->optionArr['field'] = '*';
        }
        //sql语句
        $sql = sprintf(
            "SELECT %s FROM `%s`", $this->optionArr['field'], $this->table
        );
        //查询条件
        if (isset($this->optionArr['where'])) {
            $sql .= sprintf(" WHERE %s", $this->optionArr['where']);
        }
        //order by
        if (isset($this->optionArr['order'])) {
            $sql .= sprintf(" ORDER BY %s", $this->optionArr['order']);
        }
        //limit
        if (isset($this->optionArr['limit'])) {
            $sql .= sprintf(" LIMIT %s", $this->optionArr['limit']);
        }
        //参数绑定
        if (!isset($this->optionArr['bindArr'])) {
            $this->optionArr['bindArr'] = [];
        }
        if ($allRow) {
            $action = DatabaseActionType::SELECT_ALL;
        } else {
            $action = DatabaseActionType::SELECT;
        }
        return $this->execute($sql, $action, $this->optionArr['bindArr']);
    }

    /**
     * sql查询，返回查询结果
     *
     * @param String $sql     sql语句
     * @param array  $bindArr 绑定参数
     *
     * @return mixed
     */
    public function findAllBySql($sql, $bindArr = [])
    {
        return $this->execute($sql, DatabaseActionType::SELECT_ALL, $bindArr);
    }

    /**
     * sql查询一条语句，
     *
     * @param String $sql     sql语句
     * @param array  $bindArr 绑定参数
     *
     * @return mixed
     */
    public function findFirstBySql($sql, $bindArr = [])
    {
        return $this->execute($sql, DatabaseActionType::SELECT, $bindArr);
    }

    /**
     * 查询记录条数
     *
     * @return mixed
     */
    public function count()
    {
        $sql = sprintf("SELECT COUNT(*) FROM `%s` ", $this->table);
        if (isset($this->optionArr['where'])) {
            $sql .= sprintf(" WHERE %s", $this->optionArr['where']);
        }
        if (!isset($this->optionArr['bindArr'])) {
            $this->optionArr['bindArr'] = [];
        }
        $row = $this->execute(
            $sql, DatabaseActionType::SELECT, $this->optionArr['bindArr']
        );
        return intval(current($row));
    }

    /**
     * sql查询记录条数
     *
     * @param String $sql     sql语句
     * @param array  $bindArr 绑定参数
     *
     * @return mixed
     */
    public function countBySql($sql, $bindArr = [])
    {
        $row = $this->execute($sql, DatabaseActionType::SELECT, $bindArr);
        return intval(current($row));
    }

    /**
     * 添加数据
     *
     * @param array $data 表字段对应的key-value数组
     *
     * @return mixed 返回新主键
     */
    public function add($data)
    {
        if (!is_array($data)) {
            MysqlException::throeExp(
                MysqlException::MYSQL_PARAM_DATA_ERROR, 'mysql add param error'
            );
        }
        $sql = sprintf("INSERT INTO `%s` ", $this->table);
        $fields = $values = $bindArr = [];
        foreach ($data as $field => $value) {
            $bindKey = ":" . self::$addPrefix . $field;
            $fields[] = "`{$field}`";
            $values[] = $bindKey;
            $bindArr[$bindKey] = $value;
        }
        $field = join(',', $fields);
        $value = join(',', $values);
        unset($fields, $values);
        $sql .= sprintf("(%s) VALUES (%s)", $field, $value);
        return $this->execute($sql, DatabaseActionType::INSERT, $bindArr);
    }

    /**
     * 更新数据
     *
     * @param array  $data    表字段对应的key-value数组
     * @param String $where   更新条件
     * @param array  $bindArr 更新条件的绑定值
     *
     * @return int 返回影响行数
     */
    public function update($data, $where, $bindArr = [])
    {
        if (!is_array($data)) {
            MysqlException::throeExp(
                MysqlException::MYSQL_PARAM_DATA_ERROR,
                'mysql update param error'
            );
        }
        $values = array();
        $sql = sprintf("UPDATE `%s` SET ", $this->table);
        foreach ($data as $key => $val) {
            $bindKey = ":" . self::$updatePrefix . $key;
            $values[] = sprintf("`%s`.`%s`=%s", $this->table, $key, $bindKey);
            $bindArr[$bindKey] = $val;
        }
        $value = join(',', $values);
        unset($values);
        $sql .= $value;
        if (isset($where)) {
            $sql .= sprintf(' WHERE %s ', $where);
        }
        return $this->execute($sql, DatabaseActionType::UPDATE, $bindArr);
    }

    /**
     * 删除记录
     *
     * @return int 返回影响行数
     */
    public function delete()
    {
        $sql = sprintf("DELETE FROM `%s`", $this->table);
        if (isset($this->optionArr['where'])) {
            $sql .= sprintf(" WHERE %s", $this->optionArr['where']);
        }
        if (!isset($this->optionArr['bindArr'])) {
            $this->optionArr['bindArr'] = [];
        }
        return $this->execute(
            $sql, DatabaseActionType::DELETE, $this->optionArr['bindArr']
        );
    }

    /**
     * 条件绑定值
     *
     * @param array $bindArr 绑定参数
     *
     * @return $this
     */
    public function bind($bindArr)
    {
        if (is_array($bindArr)) {
            $this->optionArr['bindArr'] = $bindArr;
        }
        return $this;
    }

    /**
     * 读取表的主键
     *
     * @return mixed
     */
    public function findPk()
    {
        $sql = sprintf(
            "select column_name from INFORMATION_SCHEMA.KEY_COLUMN_USAGE where constraint_name='PRIMARY' AND table_name='%s' and table_schema='%s'",
            $this->table, $this->config->getDbName()
        );
        $row = $this->findFirstBySql($sql);
        return $row['column_name'];
    }

    /**
     * 获取表的所有字段,返回key为字段名称，value为字段的类型
     *
     * @return mixed
     */
    public function findColumns()
    {
        $sql = sprintf(
            "select column_name,data_type from INFORMATION_SCHEMA.Columns where table_name='%s' and table_schema='%s'",
            $this->table, $this->config->getDbName()
        );
        $rows = $this->findAllBySql($sql);
        return $rows;
    }

    /**
     * 查询条件，仅能配合 findAll,findFirst,delete,count 使用
     *
     * @param       $conditions
     * @param array $bindArr
     *
     * @return $this
     */
    public function where($conditions, $bindArr = [])
    {
        $this->optionArr['where'] = $conditions;
        if (!empty($bindArr)) {
            $this->optionArr['bindArr'] = $bindArr;
        }
        return $this;
    }

    /**
     * 查询那些字段，仅能配合 findAll,findFirst 使用
     *
     * @param array|string $fields 字段集合或字段
     *
     * @return $this
     */
    public function field($fields)
    {

        if (is_string($fields)) {
            $this->optionArr['field'] = $fields;
        } elseif (is_array($fields)) {
            $this->optionArr['field'] = join(',', $fields);
        }
        return $this;
    }

    /**
     * 限制返回记录条数及开始记录数，仅能配合 findAll,findFirst 使用
     *
     * @param int  $start 开始记录
     * @param null $size  返回记录数
     *
     * @return $this
     */
    public function limit($start, $size = null)
    {
        if (isset($size)) {
            $this->optionArr['limit'] = sprintf("%d,%d", $start, $size);
        } else {
            $this->optionArr['limit'] = intval($start);
        }
        return $this;
    }

    /**
     * 排序，如：id desc,仅能配合findAll,findFirst使用
     *
     * @param $orderBy
     *
     * @return $this
     */
    public function orderBy($orderBy)
    {
        $this->optionArr['order'] = $orderBy;
        return $this;
    }

    /**
     * 表连接
     *
     * @param $linkId
     *
     * @return $this
     */
    public function link($linkId)
    {
        if(is_array($linkId)){
            foreach ($linkId as $value){
                if (isset($this->linkMap[$value])) {
                    $this->optionArr['link'][$value] = $this->linkMap[$value];
                }
            }
        }elseif (isset($this->linkMap[$linkId])) {
            $this->optionArr['link'][$linkId] = $this->linkMap[$linkId];
        }
        return $this;
    }

    /**
     * 设置linkMap
     *
     * @param $linkMap
     *
     * @return $this
     */
    public function setLinkMap($linkMap)
    {
        $this->linkMap = $linkMap;
        return $this;
    }

    /**
     * 开启事务
     *
     * @return mixed
     */
    public function begin()
    {
        Logger::debug(sprintf("Pdo transaction begin connID=【%s】",$this->config->getId()));
        $this->pdo->beginTransaction();
    }

    /**
     * 提交事务
     *
     * @return mixed
     */
    public function commit()
    {
        Logger::debug(sprintf("Pdo transaction commit connID=【%s】",$this->config->getId()));
        $this->pdo->commit();
    }

    /**
     * 事务回滚
     *
     * @return mixed
     */
    public function rollback()
    {
        Logger::debug(sprintf("Pdo transaction rollback connID=【%s】",$this->config->getId()));
        $this->pdo->rollBack();
    }

    /**
     * 执行原生sql
     *
     * @param       $sql
     * @param       $action
     * @param array $bindArr
     *
     * @return mixed
     */
    public function execute($sql, $action, $bindArr = [])
    {
        $sqlStartTime = Utils::getMillisecond();
        $pdo = $this->pdo;
        $stmt = $pdo->prepare($sql);
        Logger::debug(sprintf("start execute sql=【%s】，bind=【%s】", $sql, json_encode($bindArr)));
        $exeRes = $stmt->execute($bindArr);
        $res = null;
        switch ($action) {
            case DatabaseActionType::SELECT:
                $res = $stmt->fetch(MysqlPDO::FETCH_ASSOC);
                break;
            case DatabaseActionType::SELECT_ALL:
                //返回所有结果集
                $res = $stmt->fetchAll(MysqlPDO::FETCH_ASSOC);
                break;
            case DatabaseActionType::UPDATE:
            case DatabaseActionType::DELETE:
            case DatabaseActionType::COUNT:
                $res = $stmt->rowCount();
                break;
            case DatabaseActionType::INSERT:
                //返回主键
                $res = $pdo->lastInsertId();
                break;
        }
        //连接模型
        if (isset($this->optionArr['link'])) {
            switch ($action) {
                case DatabaseActionType::SELECT:
                case DatabaseActionType::SELECT_ALL:
                    foreach ($this->optionArr['link'] as $linkId => $link) {
                        $link['flag'] = $linkId;
                        $res = $this->addLink($res, $link, $action);
                    }
                    break;
            }
        }
        //重置查询条件
        $this->optionArr = [];
        $sqlEndTime = Utils::getMillisecond();
        Logger::debug(
            sprintf(
                "end execute ct=【%sms】，ec=【%s】，conn=【%s】，sql=【%s】，bind=【%s】",
                ($sqlEndTime - $sqlStartTime), $exeRes, $this->config->getId(),
                $sql, json_encode($bindArr)
            )
        );
        if (!$exeRes) {
            $errorInfo = json_encode($stmt->errorInfo());
            Logger::error(sprintf("execute Error=【%s】", $errorInfo));
            MysqlException::throeExp(
                MysqlException::MYSQL_SQL_ERROR, $errorInfo
            );
        }
        return $res;
    }

    /**
     * 处理外联模型
     *
     * @param $rows
     * @param $link
     * @param $action
     *
     * @return array|mixed
     */
    private function addLink($rows, $link, $action)
    {
        if (!empty($rows)) {
            if ($action == DatabaseActionType::SELECT) {
                $rows = [$rows];
            }
            $key = isset($link['key']) ? $link['key'] : 'id';
            $fk = $link['foreign_key'];
            $ids = array_column($rows, $key);
            /**
             * @var Model $linkModel
             */
            $linkModel = new $link['class'];
            $linkRows = $linkModel->selectAll($fk, $ids);
            switch ($link['type']) {
                //1对1模型
                case MappingType::HAS_ONE:
                    $map = array_column($linkRows, null, $fk);
                    break;
                //1对多模型
                case MappingType::HAS_MANY:
                    $map = [];
                    foreach ($linkRows as $linkRow) {
                        $map[$linkRow[$fk]][] = $linkRow;
                    }
                    break;
            }
            foreach ($rows as $k => $row) {
                $rkey = $row[$key];
                if (isset($map[$rkey])) {
                    $row[$link['flag']] = $map[$rkey];
                    $rows[$k] = $row;
                }
            }
            if ($action == DatabaseActionType::SELECT) {
                $rows = current($rows);
            }
        }
        return $rows;
    }

    /**
     * Function:updateBySql
     * 通过sql更新
     *
     * @param    string $sql     sql语句
     * @param array     $bindArr 绑定参数
     *
     * @return int 影响行数
     */
    public function updateBySql($sql, $bindArr = [])
    {
        return $this->execute($sql, DatabaseActionType::UPDATE, $bindArr);
    }
}