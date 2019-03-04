<?php
/**
 * Class [ConfigEditAjax]
 * 请描述类的功能
 * author minyifei
 * date 2019/3/4
 */

namespace FreeCMS\Admin\Pages\System;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Model\CmsSysConfigModel;

class ConfigEditAjax extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $method = requestNotEmpty('method');
        $model = new CmsSysConfigModel();
        if ($method == EditType::Batch) {
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
                //批量更新完成后，需要生成缓存
                (new CmsSysConfigModel())->updateCacheConfigs();
            }
        } else {
            $varname = requestNotEmpty('varname');
            $info = requestNotEmpty('info');
            $type = post('type');
            $value = post('value');
            $subgroup = post('subgroup');
            $data = [
                'varname' => 'user_cfg_'.$varname,
                'info' => $info,
                'type' => $type,
                'value' => $value,
                'subgroup' => $subgroup
            ];
            if ($method == EditType::Update) {
                $id = getInteger('id', 0);
                $model->updateById($id, $data);
            } else {
                $model->add($data);
            }
        }

        $this->successJson('ok');
    }
}