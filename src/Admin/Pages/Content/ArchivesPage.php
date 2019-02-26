<?php
namespace FreeCMS\Admin\Pages\Content;

use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Enum\ChannelType;
use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Libs\IdHash;
use FreeCMS\Common\Libs\Pagination;
use FreeCMS\Common\Model\CmsAddOnArticleModel;
use FreeCMS\Common\Model\CmsAddOnImagesModel;
use FreeCMS\Common\Model\CmsAddOnMediaModel;
use FreeCMS\Common\Model\CmsArchivesModel;
use FreeCMS\Common\Model\CmsArctypeModel;

/**
 * Class [ArchivesPage]
 * 文章相关
 * author freecms.com.cn
 * date 2018/11/16
 */
abstract class ArchivesPage extends BaseAdminPage
{

    /**
     * Function:archives
     * 读取文章基本信息
     *
     * @param $channel
     *
     * @return array
     */
    protected function archives($channel){
        $model = new CmsArchivesModel();
        $where = 'channel=:channel';
        $bind = [
            'channel'=>$channel,
        ];
        $urlParam = '';
        //查询栏目
        $typeid = getInteger('typeid',0);
        if($typeid>0){
            //查询所有子栏目的内容
            $childIds = (new CmsArctypeModel())->findAllChildIds($typeid);
            $where.=' and typeid in (:typeids)';
            $bind['typeids']=join(',',$childIds);
            $urlParam.='&typeid='.$typeid;
        }
        //查询标题关键字
        $title = get('title');
        if(!empty($title)){
            $where.=' and title like :title';
            $bind['title']="%{$title}%";
            $urlParam.='&title='.$title;
        }
        $p = getInteger('p',1);
        if($p<1){
            $p = 1;
        }
        $limit = 20;
        $start = ($p-1)*$limit;
        $rows = $model->link('arctype')
                      ->orderBy('id desc')
                      ->where($where,$bind)
                      ->limit($start,$limit)
                      ->findAll();
        $minId = 0;
        $maxId = 0;
        foreach ($rows as $key=>$row){
            $flagname = array();
            $flag = $row["flag"];
            if ($flag) {
                $flags = explode(",", $flag);
                if (in_array("h", $flags)) {
                    $flagname[] = "头";
                }
                if (in_array("c", $flags)) {
                    $flagname[] = "推";
                }
                if (in_array("f", $flags)) {
                    $flagname[] = "幻";
                }
                if (in_array("a", $flags)) {
                    $flagname[] = "特";
                }
                if (in_array("p", $flags)) {
                    $flagname[] = "图";
                }
                if (in_array("j", $flags)) {
                    $flagname[] = "跳";
                }
            }
            if ($flagname && count($flagname) > 0) {
                $flagn = implode(",", $flagname);
                $row["flagname"] = $flagn;
            }
            if($minId==0 || $row['id']<$minId){
                $minId = $row['id'];
            }
            if($row['id']>$maxId){
                $maxId = $row['id'];
            }
            if(!empty($row['arctype']['extinfo'])){
                $row['arctype']['ext']=json_decode($row['arctype']['extinfo'],true);
            }
            $row['enId']=IdHash::encode($row['id']);
            $rows[$key]=$row;
        }
        $total = $model->where($where,$bind)->count();
        $urlParam.='&p=%d';
        //分页
        $pager = new Pagination($limit,$total,$p,getBaseURL()."/admin#!content/{$channel}?".$urlParam);
        $res = [
            'search'=> [
                'typeid'=>$typeid,
                'title'=>$title,
            ],
            'arctypes'=>$this->getTreeArcTypes($channel),
            'total'=>$total,
            'limit'=>$limit,
            'rows'=>$rows,
            'minId'=>$minId,
            'maxId'=>$maxId,
            'paging'=>$pager->show(),
        ];

        return $res;
    }

    protected function getTreeArcTypes($channel){
        $model = new CmsArctypeModel();
        return $model->findTreeByChannel($channel);
    }

    /**
     * Function:entrance
     * 编辑入口
     *
     * @param $channel
     *
     * @throws \Exception
     * @return void
     */
    protected function entrance($channel){
        $method = requestNotEmpty('method');
        $this->assign('method',$method);
        $this->assign('channel',$channel);

        $uploadUrl = 'uploadUrl';
        $this->assign('uploadUrl',$uploadUrl);

        $arctypes = (new CmsArctypeModel())->findTreeByChannel($channel);
        $this->assign('arctypes',$arctypes);

        if($method==EditType::Update){
            $id = getInteger('id',0);
            //读取文章基本信息
            $model = new CmsArchivesModel();
            $archive = $model->findById($id);
            switch ($channel){
                case ChannelType::Article:
                    //读取内容
                    $arcModel = new CmsAddOnArticleModel();
                    $arc = $arcModel->findById($id);
                    $archive['addOnArticle']=$arc;
                    break;
                case ChannelType::Image:
                    $imageModel = new CmsAddOnImagesModel();
                    $arc = $imageModel->findById($id);
                    $archive['addOnImage']=$arc;
                    break;
                case ChannelType::Video:
                case ChannelType::Audio:
                    $mediaModel = new CmsAddOnMediaModel();
                    $arc = $mediaModel->findById($id);
                    $archive['addOnMedia']=$arc;
                    break;
            }


            $flag = $archive["flag"];
            if ($flag) {
                $flags = explode(",", $flag);
                if (in_array("h", $flags)) {
                    $this->assign("h", "h");
                }
                if (in_array("c", $flags)) {
                    $this->assign("c", "c");
                }
                if (in_array("f", $flags)) {
                    $this->assign("f", "f");
                }
                if (in_array("a", $flags)) {
                    $this->assign("a", "a");
                }
                if (in_array("s", $flags)) {
                    $this->assign("s", "s");
                }
                if (in_array("b", $flags)) {
                    $this->assign("b", "b");
                }
                if (in_array("p", $flags)) {
                    $this->assign("p", "p");
                }
                if (in_array("j", $flags)) {
                    $this->assign("j", "j");
                }
            }
            $this->assign('data',$archive);
        }
        $this->assign('now',getCurrentTime());
    }

}