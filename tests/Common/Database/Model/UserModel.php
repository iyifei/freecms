<?php
/**
 * Class [UserModel]
 * 用户表
 * author minyifei
 * date 2019/2/22
 */

namespace Test\Common\Database\Model;


use FreeCMS\Common\Database\Enum\MappingType;

class UserModel extends Model
{

    protected $linkMap = [
        'userInfo'=>[
            'type'=>MappingType::HAS_ONE,
            'class'=>UserInfoModel::class,
            'foreign_key'=>'user_id',
            'key'=>'id',
        ],
        'userInfoArr'=>[
            'type'=>MappingType::HAS_MANY,
            'class'=>UserInfoModel::class,
            'foreign_key'=>'user_id',
            'key'=>'id',
        ]
    ];


}