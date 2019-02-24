<?php
/**
 * Class [CmsArchivesModel]
 * 文章内容
 * author minyifei
 * date 2018/11/18
 */

namespace FreeCMS\Common\Model;



use FreeCMS\Common\Database\Enum\MappingType;

class CmsArchivesModel extends Model
{

    protected $linkMap = [
        'arctype'=>[
            'type'=>MappingType::HAS_ONE,
            'class'=>CmsArctypeModel::class,
            'foreign_key'=>'id',
            'key'=>'typeid',
        ],
    ];

    /**
     * Function:deleteByIds
     * 批量删除
     *
     * @param $ids
     *
     * @return void
     */
    public function deleteByIds($ids){
        if(is_array($ids)){
            $ids = join(',',$ids);
        }
        $where = sprintf("id in(%s)",$ids);
        $this->where($where)->delete();
    }

}