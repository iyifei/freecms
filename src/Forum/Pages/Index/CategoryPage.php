<?php
/**
 * Class [CategoryPage]
 * 论坛栏目
 * author minyifei
 * date 2019/3/14
 */

namespace FreeCMS\Forum\Pages\Index;


use FreeCMS\Common\Libs\IdHash;
use FreeCMS\Common\Model\CmsForumColumnModel;
use FreeCMS\Common\Model\CmsForumSubjectModel;
use FreeCMS\Forum\BaseForumPage;

class CategoryPage extends BaseForumPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $id = IdHash::decode($vars['cenid'],0);
        $model = new CmsForumColumnModel();
        $data  = $model->link('parentColumn')->findById($id);
        if(!empty($data)){
            $data['cenid']=$vars['cenid'];
            $this->assign('data',$data);

            //该栏目下的主题帖子
            $sModel = new CmsForumSubjectModel();
            $rows = $sModel->link(['createMember','lastMember'])->orderBy('lasttime desc')->findAll();
            foreach ($rows as $k=>$row){
                $row['lastTime']=mdate($row['lasttime']);
                $row['createTime']=mdate($row['createtime']);
                $row['senid']=IdHash::encode($row['id']);
                $rows[$k] = $row;
            }
            $res = [
                'rows'=>$rows,
            ];
            $this->assign('res',$res);
            $this->display();
        }
    }
}