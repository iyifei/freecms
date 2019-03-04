<?php
/**
 * Class [MemberPage]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/4
 */

namespace FreeCMS\Admin\Pages\Member;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Libs\Pagination;
use FreeCMS\Common\Model\CmsMemberModel;

class MemberPage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $size = 20;
        $page = getInteger('p',1);
        if($page<1){
            $page = 1;
        }
        $start = ($page-1)*$size;
        $where = '1=1';
        $bind=[];
        $model = new CmsMemberModel();
        $total = $model->where($where,$bind)->count();
        $rows = $model->where($where,$bind)->orderBy('id desc')->limit($start,$size)->findAll();
        $pager = new Pagination($size,$total,$page,getBaseURL()."/admin#!member/member?p=%d");
        $res = [
            'rows'=>$rows,
            'paging'=>$pager->show(),
        ];
        $this->assign('res',$res);
        $this->display();
    }
}