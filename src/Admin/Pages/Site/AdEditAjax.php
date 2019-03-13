<?php
/**
 * Class [AdEditAjax]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/13
 */

namespace FreeCMS\Admin\Pages\Site;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Libs\Utils;
use FreeCMS\Common\Model\CmsAdModel;

class AdEditAjax extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $method = requestNotEmpty('method');
        $model = new CmsAdModel();
        if ($method == EditType::Delete) {
            //删除
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
            $name = requestNotEmpty('name');
            $uuid = post('uuid', Utils::getLogId());
            $time = getCurrentTime();
            $timetype = post('timetype');
            $starttime = post('starttime');
            $endtime = post('endtime');
            $body = post('body');
            $expirebody = post('expirebody');
            $data = [
                'uuid' => $uuid,
                'name' => $name,
                'timetype' => $timetype,
                'starttime' => $starttime,
                'endtime' => date("Y-m-d 23:59:59",strtotime($endtime)),
                'body'=>$body,
                'expirebody'=>$expirebody,
                'updatetime'=>$time,
            ];
            if ($method == EditType::Update) {
                $id = getInteger('id', 0);
                $model->updateById($id, $data);
            } else {
                $data['createtime'] = $time;
                $model->add($data);
            }
        }
        $this->successJson('ok');
    }
}