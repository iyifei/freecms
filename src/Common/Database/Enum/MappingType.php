<?php
/**
 * Class [MappingType]
 * 表之间的映射关系
 * author minyifei
 * date 2019/2/22
 */

namespace FreeCMS\Common\Database\Enum;


class MappingType
{

    const   HAS_ONE     =   1;
    const   BELONGS_TO  =   2;
    const   HAS_MANY    =   3;
    const   MANY_TO_MANY=   4;


}