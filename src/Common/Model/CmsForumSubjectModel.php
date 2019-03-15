<?php
/**
 * Class [CmsForumSubjectModel]
 * 论坛主题
 * author minyifei
 * date 2019/3/14
 */

namespace FreeCMS\Common\Model;


use FreeCMS\Common\Database\Enum\MappingType;
use FreeCMS\Common\Libs\IdHash;

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
        'column'=>[
            'type'=>MappingType::HAS_ONE,
            'class'=>CmsForumColumnModel::class,
            'foreign_key'=>'id',
            'key'=>'cid',
        ],
    ];


    /**
     * Function:formatRows
     * 格式化数据
     *
     * @param $rows
     *
     * @return mixed
     */
    public function formatRows($rows){
        $mem = new CmsMemberModel();
        foreach ($rows as $k=>$row){
            $row['lastTime']=mdate($row['lasttime']);
            $row['createTime']=mdate($row['createtime']);
            $row['senid']=IdHash::encode($row['id']);
            if(isset($row['createMember'])){
                $row['createMember']=$mem->formatMember($row['createMember']);
            }
            if(isset($row['lastMember'])){
                $row['lastMember']=$mem->formatMember($row['lastMember']);
            }
            if(isset($row['column'])){
                $row['column']=$this->formatColumn($row['column']);
            }
            $row['linkurl']=getBaseURL().'/forum/posts/'.$row['senid'].'.html';
            $rows[$k] = $row;
        }
        return $rows;
    }



    private function formatColumn($column){
        $icon = $column['icon'];
        $iconUrl = getLocalOssDomain().'/'.$icon;
        $iconThumbUrl = $iconUrl.'?thumbnail=h-90/w-90';
        $column['iconUrl']=$iconUrl;
        $column['iconThumbUrl']=$iconThumbUrl;
        $column['cenid']=IdHash::encode($column['id']);
        $column['linkurl']=getBaseURL().'/forum/category/'.$column['cenid'].'.html';
        return $column;
    }

}