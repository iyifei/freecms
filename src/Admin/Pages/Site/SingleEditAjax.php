<?php
/**
 * Class [SingleEditAjax]
 * 请描述类的功能
 * author minyifei
 * date 2018/11/19
 */

namespace FreeCMS\Admin\Pages\Site;


use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Model\CmsPageModel;
use FreeCMS\Admin\BaseAdminPage;

class SingleEditAjax extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $method = requestNotEmpty('method');
        $model = new CmsPageModel();
        if ($method == EditType::Delete) {
            $id = getInteger('id', 0);
            $model->deleteById($id);
        } elseif ($method == EditType::Batch) {
            //批量更新
            $listStr = post('list');
            $list = json_decode($listStr, true);
            if (!empty($list)) {
                foreach ($list as $item) {
                    $id = intval($item['id']);
                    $ud = [
                        $item['key'] => $item['val']
                    ];
                    $model->updateById($id, $ud);
                }
            }
        } else {
            $sortrank = getInteger('sortrank', 50);
            $subgroup = post('subgroup', 'default');
            $title = requestNotEmpty('title');
            $filename = post('filename');
            $keywords = post('keywords');
            $template = post('template');
            $litpic = post('litpic');
            $description = post('description');
            $body = post('body');
            $uptime = getCurrentTime();
            $data = [
                'sortrank' => $sortrank,
                'subgroup' => $subgroup,
                'title' => $title,
                'filename' => $filename,
                'keywords' => $keywords,
                'template' => $template,
                'litpic' => $litpic,
                'description' => $description,
                'body' => $body,
            ];

            if ($method == EditType::Update) {
                $id = getInteger('id', 0);
                $model->updateById($id, $data);
            } else {
                $data['uptime'] = $uptime;
                $model->add($data);
            }
        }
        $this->successJson('ok');
    }
}