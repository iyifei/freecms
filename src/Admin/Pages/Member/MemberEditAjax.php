<?php
/**
 * Class [MemberEditAjax]
 * 会员编辑
 * author minyifei
 * date 2019/3/4
 */

namespace FreeCMS\Admin\Pages\Member;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Model\CmsMemberModel;

class MemberEditAjax extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $method = requestNotEmpty('method');
        $model = new CmsMemberModel();
        if($method==EditType::BatchDelete) {
            //批量删除
            $ids = requestNotEmpty('ids');
            $model->deleteByIds($ids);
        }elseif($method==EditType::Delete){
            //删除
            $id = getInteger('id');
            $model->deleteById($id);
        }elseif($method==EditType::Edit){
            //更新个别字段
            $key = post('key');
            $val = post('val');
            $data = [
                $key=>$val,
            ];
        }else{
            $userid = post('userid');
            $pwd = post('pwd');
            $email = post('email');
            $uname = post('uname');
            $sex = post('sex');
            $uptime = getCurrentTime();
            $avatar = post('avatar');
            $frozen = getInteger('frozen',0);
            $data = [
                'userid'=>$userid,
                'email'=>$email,
                'uname'=>$uname,
                'sex'=>$sex,
                'uptime'=>$uptime,
                'avatar'=>$avatar,
                'frozen'=>$frozen,
            ];
            if(!empty($pwd)){
                $data['pwd']=encodePassword($pwd,$userid);
            }
        }

        switch ($method){
            case EditType::Add:
                $joinIp = getClientIP();
                $joinTime = getCurrentTime();
                $data['joinip']=$joinIp;
                $data['jointime']=$joinTime;
                $model->add($data);
                break;
            case EditType::Update:
            case EditType::Edit:
                $id = getInteger('id',0);
                $model->updateById($id,$data);
                break;
        }

        $this->successJson('ok');
    }
}