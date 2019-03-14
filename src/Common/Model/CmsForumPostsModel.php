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

}