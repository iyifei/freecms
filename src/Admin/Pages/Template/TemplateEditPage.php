<?php
/**
 * Class [TemplateEditPage]
 * 模板编辑页面
 * author minyifei
 * date 2018/11/20
 */

namespace FreeCMS\Admin\Pages\Template;


use FreeCMS\Common\Enum\EditType;
use FreeCMS\Admin\BaseAdminPage;

class TemplateEditPage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $method = requestNotEmpty('method');
        $this->assign('method',$method);

        //可用模板
        $templates = [
            ['val'=>'','name'=>'其他模板'],
            ['val'=>'article_face_','name'=>'文章封面模板'],
            ['val'=>'article_list_','name'=>'文章列表模板'],
            ['val'=>'article_archive_','name'=>'文章内容页模板'],
            ['val'=>'image_face_','name'=>'图片封面模板'],
            ['val'=>'image_list_','name'=>'图片列表模板'],
            ['val'=>'image_archive_','name'=>'图片内容页模板'],
            ['val'=>'single_','name'=>'单页页面模板'],
        ];
        $this->assign('templates',$templates);


        if($method==EditType::Update){
            $filename = request('id');
            $path = $this->getThemePath();
            $file = sprintf('%s/%s',$path,$filename);
            $content = file_get_contents($file);
            $this->assign('content',$content);
            //提取文件名
            if(!empty($filename)){
                foreach ($templates as $template){
                    if(!empty($template['val']) && strpos($filename,$template['val'])===0){
                        $templateVal = $template['val'];
                        $this->assign('templateVal',$templateVal);
                        $name = str_replace(['.tpl',$template['val']],'',$filename);
                        break;
                    }
                }
            }
            if(empty($name)){
                $name = str_replace('.tpl','',$filename);
            }
        }else{
            $name = 'newfile';
            $filename = $name.'.tpl';
        }
        $this->assign('name',$name);
        $this->assign('filename',$filename);
        $this->display();
    }
}