<?php
/**
 * Class [CmsForumPostsModel]
 * 论坛帖子
 * author minyifei
 * date 2019/3/14
 */

namespace FreeCMS\Common\Model;


use FreeCMS\Common\Database\Enum\MappingType;

class CmsForumPostsModel extends Model
{

    protected $linkMap = [
        'member'=>[
            'type'=>MappingType::HAS_ONE,
            'class'=>CmsMemberModel::class,
            'foreign_key'=>'id',
            'key'=>'mid',
        ],
    ];

    public function formatRows($rows,$start){
        $mem = new CmsMemberModel();
        foreach ($rows as $key=>$row){
            $row['index']=$key+$start;
            $row['createTime']=mdate($row['createtime']);
            if(isset($row['member'])){
                $row['member']=$mem->formatMember($row['member']);
            }
            $rows[$key]=$row;
        }
        return $rows;
    }
}