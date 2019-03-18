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

    protected $declareNeedLogin = false;

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
            $data['pagetype']='subject';
            $data['title']=$data['name'];
            $data['page']=$vars['p'];
            $pos = [
                ['name'=>$data['parentColumn']['name'],'url'=>'javascript:;'],
            ];
            $data['position']=$this->getPosition($pos);
            $data['newsubjecturl']=sprintf('%s/forum/posts/new/%s.html',getBaseURL(),$vars['cenid']);
            $this->assign('freecms',$data);
            $this->display();
        }
    }
}