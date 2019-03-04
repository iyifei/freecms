<?php
/**
 * Class [FeedbackPage]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/4
 */

namespace FreeCMS\Admin\Pages\Site;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Libs\Pagination;
use FreeCMS\Common\Model\CmsFeedbackModel;

class FeedbackPage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $wheres = [];
        $bind = [];
        $urlParam='';
        $aid = getInteger('aid',0);
        if($aid>0){
            $wheres[]='aid = :aid';
            $bind['aid']=$aid;
            $urlParam.='&aid='.$aid;
        }
        $title = get('title');
        if(!empty($title)){
            $wheres[]='atitle like :title';
            $bind['title']="%{$title}%";
            $urlParam.='&title='.$title;
        }
        $model = new CmsFeedbackModel();
        if(!empty($wheres)){
            $model = $model->where(join(' AND ',$wheres),$bind);
        }
        $p = getInteger('p',1);
        if($p<1){
            $p = 1;
        }
        $limit = 20;
        $start = ($p-1)*$limit;
        $amodel = clone $model;
        $total = $model->count();
        $rows = $amodel->orderBy('id desc')->limit($start,$limit)->findAll();
        $urlParam.='&p=%d';
        //分页
        $pager = new Pagination($limit,$total,$p,getBaseURL()."/admin#!site/feedback?".$urlParam);
        $res = [
            'search'=> [
                'aid'=>$aid,
                'title'=>$title,
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