<?php
/**
 * Class [SearchPage]
 * 搜索
 * author minyifei
 * date 2018/12/2
 */

namespace FreeCMS\Www\Pages\Index;


use FreeCMS\Common\Model\CmsArctypeModel;
use FreeCMS\Www\BaseWwwPage;

class SearchPage extends BaseWwwPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $keyword = $vars['keyword'];
        if(empty($keyword)){
            $keyword = get('keyword');
        }
        if(!empty($keyword)){
            $keyword =strip_tags($vars['keyword']);
            $typeid = 0;
            $typedir = strip_tags($vars['typedir']);
            if(!empty($typedir)){
                $typeModel = new CmsArctypeModel();
                $type = $typeModel->field('id')->where('typedir=:typedir',['typedir'=>$typedir])->findFirst();
                if($type){
                    $typeid = $type['id'];
                }
            }
            $page = getInteger('p',0);
            if($page<1){
                $page = 1;
            }
            $data = [
                'keyword'=>$keyword,
                'page'=>$page,
                'typeid'=>$typeid,
            ];
            $this->assign('freecms',$data);
            $this->assign('keyword',$keyword);
            $this->display('search_default.tpl');
        }
    }
}