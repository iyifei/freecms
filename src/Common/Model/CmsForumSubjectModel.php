<?php
/**
 * Class [CmsForumSubjectModel]
 * 论坛主题
 * author minyifei
 * date 2019/3/14
 */

namespace FreeCMS\Common\Model;


use FreeCMS\Common\Database\Enum\MappingType;

class CmsForumSubjectModel extends Model
{

    protected $linkMap = [
        'createMember'=>[
            'type'=>MappingType::HAS_ONE,
            'class'=>CmsMemberModel::class,
            'foreign_key'=>'id',
            'key'=>'createMemberId',
        ],
        'lastMember'=>[
            'type'=>MappingType::HAS_ONE,
            'class'=>CmsMemberModel::class,
            'foreign_key'=>'id',
            'key'=>'lastMemberId',
        ],
    ];

}