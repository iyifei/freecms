<?php
/**
 * Class [SingleEditPage]
 * 请描述类的功能
 * author minyifei
 * date 2018/11/19
 */

namespace FreeCMS\Admin\Pages\Site;


use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Libs\File;
use FreeCMS\Common\Model\CmsPageModel;
use FreeCMS\Admin\BaseAdminPage;

class SingleEditPage extends BaseAdminPage
{

    /**
     * Function:execute
     * 描述
     *
     * @param array $vars
     *
     * @throws \Exception
     * @return void
     */
    function execute($vars = [])
    {
        $method = requestNotEmpty('method');
        $this->assign('method',$method);

        $uploadUrl = 'uploadUrl';
        $this->assign('uploadUrl',$uploadUrl);

        if($method==EditType::Update){
            $id = getInteger('id');
            $model = new CmsPageModel();
            $row = $model->findById($id);
            $this->assign('data',$row);
            $selTemplate = $row['template'];
        }else{
            $this->assign('filename',getMillisecond());
            $selTemplate = 'single_default.html';
        }
        $this->assign('selTemplate',$selTemplate);

        $this->getTemplates();

        $this->display();
    }

    /**
     * 读取模板
     */
    private function getTemplates() {
        $path = $this->getThemePath();
        //pc模板
        $pcList = File::dirList($path );
        $templates = $this->getTempByList($pcList);
        $this->assign("templates", $templates);
        return $templates;
    }

    private function getTempByList($list) {
        $templates = array();
        foreach ($list as $value) {
            $arr = explode("_", $value);
            if (count($arr) == 2) {
                if ($arr[0] == "single") {
                    //封面模板
                    $templates[] = $value;
                }
            }
        }
        return $templates;
    }
}