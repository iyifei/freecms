<?php
/**
 * Class [CmsAdminModel]
 * 请描述类的功能
 * author minyifei
 * date 2018/11/22
 */

namespace FreeCMS\Common\Model;



use FreeCMS\Common\Database\Enum\MappingType;

class CmsAdminModel extends Model
{

    protected $linkMap = [
        'role'=>[
            'type'=>MappingType::HAS_ONE,
            'class'=>CmsRoleModel::class,
            'foreign_key'=>'id',
            'key'=>'roleid',
        ],
    ];

}