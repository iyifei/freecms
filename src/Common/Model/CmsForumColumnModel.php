<?php
/**
 * Class [CmsForumColumnModel]
 * 论坛栏目
 * author minyifei
 * date 2019/3/14
 */

namespace FreeCMS\Common\Model;


use FreeCMS\Common\Database\Enum\MappingType;
use FreeCMS\Common\Libs\IdHash;

class CmsForumColumnModel extends Model
{

    protected $linkMap = [
        'parentColumn'=>[
            'type'=>MappingType::HAS_ONE,
            'class'=>CmsForumColumnModel::class,
            'foreign_key'=>'id',
            'key'=>'pid',
        ],
    ];

    //排序
    private $_orderBy = 'sortrank asc,id asc';

    /**
     * Function:findAllMenu
     * 获取所有的菜单
     *
     * @return array|mixed|null
     */
    public function findAllMenu(){
        $rows = $this->orderBy($this->_orderBy)->findAll();
        foreach ($rows as $key=>$row){
            $rows[$key]['enId'] = IdHash::encode($row['id']);
        }
        return $rows;
    }

}