<?php
/**
 * Class [CmsMemberModel]
 * 请描述类的功能
 * author minyifei
 * date 2018/11/22
 */

namespace FreeCMS\Common\Model;


use FreeCMS\Common\Libs\IdHash;

class CmsMemberModel extends Model
{


    public function formatMember($member){
        if(empty($member['avatar'])){
            $avatar  ='images/default_avatar.png';
        }else{
            $avatar = $member['avatar'];
        }
        $member['menid']=IdHash::encode($member['id']);
        $member['avatarUrl']=getLocalOssDomain().'/'.$avatar;
        $member['profileurl']=getBaseURL().'/member/profile/'.$member['menid'].'.html';
        $member['avatarThumbUrl']=$member['avatarUrl'].'?thumbnail=h-90/w-90';
        return $member;
    }

}