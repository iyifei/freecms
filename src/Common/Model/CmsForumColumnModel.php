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
        'lastSubject'=>[
            'type'=>MappingType::HAS_ONE,
            'class'=>CmsForumSubjectModel::class,
            'foreign_key'=>'id',
            'key'=>'lastSubjectId',
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
        $rows = $this->link('lastSubject')->orderBy($this->_orderBy)->findAll();
        $memberIds = [];
        foreach ($rows as $key=>$row){
            $row['enId'] = IdHash::encode($row['id']);
            if(isset($row['lastSubject'])){
                $subject = $row['lastSubject'];
                $subject['lastTime']=mdate($subject['lasttime']);
                $subject['createTime']=mdate($subject['createtime']);
                $subject['senid']=IdHash::encode($subject['id']);
                $subject['linkurl']=getBaseURL().'/forum/posts/'.$subject['senid'].'.html';
                $row['lastSubject']=$subject;
                $memberIds[]=$subject['createMemberId'];
            }
            $rows[$key]=$row;
        }
        if(!empty($memberIds)){
            $memModel = new CmsMemberModel();
            $members = $memModel->findByIds($memberIds);
            if(!empty($members)){
                $memberMap = array_column($members,null,'id');
                foreach ($rows as $key=>$row){
                    if(isset($row['lastSubject'])){
                        $lastMemberId = $row['lastSubject']['createMemberId'];
                        $row['lastSubject']['createMember']=$memModel->formatMember($memberMap[$lastMemberId]);
                        $rows[$key]=$row;
                    }
                }
            }

        }
        return $rows;
    }

}