<?php
/**
 * Class [TemplateEditAjax]
 * 模板编辑
 * author minyifei
 * date 2018/11/20
 */

namespace FreeCMS\Admin\Pages\Template;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Enum\EditType;

class TemplateEditAjax extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $method = requestNotEmpty('method');
        $filename = requestNotEmpty('id');
        $path =$this->getThemePath();
        $file = sprintf('%s/%s',$path,$filename);
        if($method==EditType::Delete){
            unlink($file);
        }else{
            $content = post('content');
            file_put_contents($file,$content);
            //如果旧文件名不等于新文件名，删除旧文件
            $oldFilename = request('oldfilename');
            if($method==EditType::Update && $filename!=$oldFilename){
                $oldFile = sprintf('%s/%s',$path,$oldFilename);
                unlink($oldFile);
            }
        }
        $this->successJson('ok');
    }
}