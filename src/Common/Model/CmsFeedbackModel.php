<?php
/**
 * Class [CmsFeedbackModel]
 * 评论
 * author minyifei
 * date 2018/11/23
 */

namespace FreeCMS\Common\Model;



use FreeCMS\Common\Database\Enum\MappingType;

class CmsFeedbackModel extends Model
{

    protected $linkMap = [
        'archives'=>[
            'type'=>MappingType::HAS_ONE,
            'class'=>CmsArchivesModel::class,
            'foreign_key'=>'id',
            'key'=>'aid',
        ],
    ];

    public function deleteByIds($ids){
        if(is_array($ids)){
            $ids = join(',',$ids);
        }
        $where = sprintf("id in(%s)",$ids);
        $this->where($where)->delete();
    }

}