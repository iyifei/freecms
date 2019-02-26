<?php
/**
 * Class [ArchivesEditAjax]
 * 请描述类的功能
 * author minyifei
 * date 2018/11/20
 */

namespace FreeCMS\Admin\Pages\Content;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Enum\ChannelType;
use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Exception\FreeCmsException;
use FreeCMS\Common\Model\CmsAddOnArticleModel;
use FreeCMS\Common\Model\CmsAddOnImagesModel;
use FreeCMS\Common\Model\CmsAddOnMediaModel;
use FreeCMS\Common\Model\CmsArchivesModel;
use FreeCMS\Common\Model\CmsArctypeModel;

class ArchivesEditAjax extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        //模型
        $channel = $vars['channel'];
        //操作类型
        $method = requestNotEmpty('method');
        //文章基本信息
        $model = new CmsArchivesModel();
        //文章内容
        $arcModel = new CmsAddOnArticleModel();
        //图片内容
        $imgModel = new CmsAddOnImagesModel();
        //视频/音频
        $mediaModel = new CmsAddOnMediaModel();
        if($method==EditType::BatchDelete){
            //批量删除
            $ids = requestNotEmpty('ids');
            $model->deleteByIds($ids);
            switch ($channel){
                case ChannelType::Article:
                    $arcModel->deleteByIds($ids);
                    break;
                case ChannelType::Image:
                    $imgModel->deleteByIds($ids);
                    break;
                case ChannelType::Audio:
                case ChannelType::Video:
                    $mediaModel->deleteByIds($ids);
                    break;
            }

        }elseif($method==EditType::Delete){
            //删除一条记录
            $id = getInteger('id',0);
            $model->deleteById($id);
            switch ($channel){
                case ChannelType::Article:
                    $arcModel->deleteById($id);
                    break;
                case ChannelType::Image:
                    $imgModel->deleteById($id);
                    break;
                case ChannelType::Audio:
                case ChannelType::Video:
                    $mediaModel->deleteById($id);
                    break;
            }
        }else{
            //栏目
            $typeid = getInteger('typeid',0);
            $typeModel = new CmsArctypeModel();
            $type = $typeModel->findById($typeid);
            if($type['type']!='list'){
                FreeCmsException::throwParamExp('所属栏目选择错误');
            }
            $flags = $_POST["flags"];
            if (empty($flags)) {
                $flags = array();
            }
            $click = getInteger('click',0);
            $title = post('title');
            $writer = post('writer');
            $source = post('source');
            $jump = post('jump');
            $litpic = post('litpic');
            if ($litpic) {
                if (!in_array("p", $flags)) {
                    $flags[] = "p";
                }
            }
            if (is_array($flags)) {
                $flag = implode(",", $flags);
            }
            $keywords = post('keywords');
            $description = post('description');
            $body = post('editorValue');
            $pubtime = post('pubtime',getCurrentTime());

            $arcData = [
                'typeid'=>$typeid,
                'channel'=>$channel,
                'click'=>$click,
                'title'=>$title,
                'writer'=>$writer,
                'source'=>$source,
                'jump'=>$jump,
                'litpic'=>$litpic,
                'keywords'=>$keywords,
                'description'=>$description,
                'flag'=>$flag,
                'pubtime'=>$pubtime,
            ];

            $bodyData = [
                'body'=>$body,
            ];
            //图片地址集合
            $images = post('images');
            if(!empty($images)){
                $bodyData['images']=$images;
                if(empty($litpic)){
                    $imageJson = json_decode($images,true);
                    $litpic = $imageJson[0]['url'];
                    $arcData['litpic']=$litpic;
                }
            }
            //媒体类型
            $mediatype = post('mediatype');
            if(!empty($mediatype)){
                $bodyData['mediatype']=$mediatype;
                //媒体地址
                $url = post('url');
                $bodyData['url']=$url;
                //$info = ICloudClient::info($url);
                $arcData['extinfo']=json_encode($info);

                if($mediatype=='video'){
                    $arcData['litpic']=$url;
                }
            }

            if($method==EditType::Update){
                $id = getInteger('id');
                $model->updateById($id,$arcData);

                switch ($channel){
                    case ChannelType::Article:
                        $arcModel->updateById($id,$bodyData);
                        break;
                    case ChannelType::Image:
                        $imgModel->updateById($id,$bodyData);
                        break;
                    case ChannelType::Audio:
                    case ChannelType::Video:
                        $mediaModel->updateById($id,$bodyData);
                        break;
                }

            }else{
                $arcId = $model->add($arcData);
                $bodyData['aid']=$arcId;
                switch ($channel){
                    case ChannelType::Article:
                        $arcModel->add($bodyData);
                        break;
                    case ChannelType::Image:
                        $imgModel->add($bodyData);
                        break;
                    case ChannelType::Audio:
                    case ChannelType::Video:
                        $mediaModel->add($bodyData);
                        break;
                }
            }
        }

        $this->successJson('ok');
    }
}