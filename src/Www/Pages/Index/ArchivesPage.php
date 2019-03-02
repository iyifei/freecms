<?php
/**
 * Class [ArchivesPage]
 * 文章内容页
 * author minyifei
 * date 2018/11/28
 */

namespace FreeCMS\Www\Pages\Index;


use FreeCMS\Common\Enum\ChannelType;
use FreeCMS\Common\Libs\IdHash;
use FreeCMS\Common\Model\CmsAddOnArticleModel;
use FreeCMS\Common\Model\CmsAddOnImagesModel;
use FreeCMS\Common\Model\CmsArchivesModel;
use FreeCMS\Www\BaseWwwPage;

class ArchivesPage extends BaseWwwPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $hash = $vars['hash'];
        $id = IdHash::decode($hash,0);
        if($id>0){
            $model = new CmsArchivesModel();
            $row = $model->link('arctype')->findById($id);
            if($row){
                $arctype = $row['arctype'];
                //文章编号
                $aid = $row["id"];
                $enId = IdHash::encode($aid);
                $row['enId']=$enId;
                //相对目录
                $typedir = $arctype["typedir"];
                //文章访问规则
                $arcnamerule = $arctype["arcnamerule"];
                //跳转地址
                $jump = $row["jump"];
                //栏目地址
                $typeurl = sprintf('%s/list/%s', getBaseURL(), $typedir);
                //文章访问路径
                $arcurl = sprintf("%s/archives/%s.html",getBaseURL(),$enId);
                if (!empty($jump)) {
                    $arcurl = $jump;
                }
                $row['typename'] = $arctype['typename'];
                $row['arcurl'] = $arcurl;
                $row['typeurl'] = $typeurl;
                if (!empty($row['flag'])) {
                    $row['flags'] = explode(',', $row['flag']);
                } else {
                    $row['flags'] = [];
                }
                //缩略图
                if (!empty($row['litpic'])) {
                    $pic = $this->getImage($row['litpic']);
                    $row = array_merge($row,$pic);
                }
                if (!empty($row['extinfo'])) {
                    $extInfo = json_decode($row['extinfo'], true);
                    $row['ext'] = $extInfo;
                }
                switch ($row['channel']){
                    case ChannelType::Article:
                        $con = (new CmsAddOnArticleModel())->findById($id);
                        $row['body']=$con['body'];
                        break;
                    case ChannelType::Image:
                        $con = (new CmsAddOnImagesModel())->findById($id);
                        $row['body']=$con['body'];
                        $images = json_decode($con['images'],true);
                        foreach ($images as $key=> $image){
                            $pic = $this->getImage($image['url']);
                            $image = array_merge($image,$pic);
                            $images[$key]=$image;
                        }
                        $row['images']=$images;
                        break;
                }
                $bind=['typeid'=>$row['typeid'],'id'=>$id];
                //上一篇
                $preRow = $model->where('typeid=:typeid and id<:id',$bind)
                      ->orderBy('id desc')
                      ->limit(1)
                      ->findFirst();
                if($preRow){
                    $prourl = sprintf("%s/archives/%s.html",getBaseURL(),IdHash::encode($preRow['id']));
                    if(!empty($preRow['jump'])){
                        $prourl = $preRow['jump'];
                    }
                    $row['pre']=[
                        'title'=>$preRow['title'],
                        'arcurl'=>$prourl,
                    ];
                }
                //下一篇
                $nextRow = $model->where('typeid=:typeid and id>:id',$bind)
                    ->orderBy("id asc")
                    ->limit(1)
                    ->findFirst();
                if($nextRow){
                    $nexturl = sprintf("%s/archives/%s.html",getBaseURL(),IdHash::encode($nextRow['id']));
                    if(!empty($nextRow['jump'])){
                        $nexturl = $nextRow['jump'];
                    }
                    $row['next']=[
                        'title'=>$nextRow['title'],
                        'arcurl'=>$nexturl,
                    ];
                }
                $tpl = $arctype['temparchive'];
                //相对目录
                $typedir = $arctype["typedir"];
                //栏目地址
                $typeurl = sprintf('%s/%s/%s',getBaseURL(),$row['channel'],$typedir);
                $row['arctype']['typeurl']=$typeurl;
                if(!empty($row['arctype']['extinfo'])){
                    $row['arctype']['ext']=json_decode($row['arctype']['extinfo'],true);
                }
                $row['arctype']['logo']=getLocalOssDomain().'/'.$row['arctype']['litpic'];
                $row['fullurl']=getCurrentDomain().$row['arcurl'];
                $this->assign('freecms',$row);
                $this->display($tpl);
                exit;
            }
        }
        http_response_code(404);
        exit;
    }

    private function getImage($url){
        $ossDomain = getLocalOssDomain();
        $item=[];
        $thumbnail = getDefaultThumbnailConfig();
        $item['thumbnail'] = sprintf(
            "%s/%s?thumbnail=w-%d/h-%d", $ossDomain, $url,
            $thumbnail['width'], $thumbnail['height']
        );
        $item['imgurl'] = sprintf("%s/%s", $ossDomain, $url);
        return $item;
    }
}