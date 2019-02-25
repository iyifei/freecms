<?php
/**
 * Class [FlinkEditAjax]
 * 请描述类的功能
 * author minyifei
 * date 2018/11/20
 */

namespace FreeCMS\Admin\Pages\Site;


use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Model\CmsFlinkModel;
use FreeCMS\Admin\BaseAdminPage;

class FlinkEditAjax extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $method = requestNotEmpty('method');
        $model = new CmsFlinkModel();
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
            $sortrank = getInteger('sortrank', 50);
            $url = requestNotEmpty('url');
            if (!strpos('#' . $url, 'http')) {
                $url = 'http://' . $url;
            }
            $webname = requestNotEmpty('webname');
            $logo = post('litpic');
            $subgroup = post('subgroup', 'default');
            $dtime = getCurrentTime();
            $remark = post('remark');
            $data = [
                'sortrank' => $sortrank,
                'url' => $url,
                'webname' => $webname,
                'logo' => $logo,
                'subgroup' => $subgroup,
                'remark'=>$remark
            ];
            if ($method == EditType::Update) {
                $id = getInteger('id', 0);
                $model->updateById($id, $data);
            } else {
                $data['dtime'] = $dtime;
                $model->add($data);
            }
        }
        $this->successJson('ok');
    }
}