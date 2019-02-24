<?php
/**
 * Class [DatabaseActionType]
 * 数据库操作类型
 * author minyifei
 * date 2019/2/22
 */

namespace FreeCMS\Common\Database\Enum;


class DatabaseActionType
{

    //查询单条记录
    const SELECT = 'select';
    //查询所有记录
    const SELECT_ALL = 'selectALL';
    //更新
    const UPDATE = 'update';
    //删除
    const DELETE = 'delete';
    //插入
    const INSERT = 'insert';
    //统计
    const COUNT = 'count';

}