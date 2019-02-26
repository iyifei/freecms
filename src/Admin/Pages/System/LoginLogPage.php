<?php
/**
 * Class [LoginLogPage]
 * 登录日志
 * author minyifei
 * date 2019/2/26
 */

namespace FreeCMS\Admin\Pages\System;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Libs\Pagination;
use FreeCMS\Common\Model\CmsLoginLogModel;

class LoginLogPage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $where = [];
        $bind = [];
        $startTime = get('start');
        if(!empty($startTime)){
            $where[]='create_time>=:startTime';
            $bind['startTime']=$startTime.' 00:00:00';
        }
        $endTime = get('end');
        if(!empty($endTime)){
            $where[]='create_time<=:endTime';
            $bind['endTime']=$endTime.' 24:00:00';
        }
        $username = get('username');
        if(!empty($username)){
            $where[]='username like :username';
            $bind['username']="%{$username}%";
        }
        $model = new CmsLoginLogModel();
        $p = getInteger('p',1);
        if($p<1){
            $p = 1;
        }
        $limit = 20;
        $start = ($p-1)*$limit;
        if(!empty($where)){
            $model = $model->where(join(' AND ',$where),$bind);
        }
        $smodel = clone $model;
        $total = $model->count();
        $rows = $smodel->orderBy('id desc')->limit($start,$limit)->findAll();
        //分页
        $pager = new Pagination($limit,$total,$p,getBaseURL()."/admin#!system/log?p=%d");
        $res = [
            'search'=>[
                'start'=>$startTime,
                'end'=>$endTime,
                'username'=>$username,
            ],
            'total'=>$total,
            'limit'=>$limit,
            'rows'=>$rows,
            'paging'=>$pager->show(),
        ];
        $this->assign('res',$res);
        $this->display();
    }
}