<?php
/**
 * Class [ArcTypeEditAjax]
 * 栏目编辑处理
 */

namespace FreeCMS\Admin\Pages\Site;


use FreeCMS\Common\Enum\EditType;
use FreeCMS\Common\Exception\ErrorCode;
use FreeCMS\Common\Exception\FreeCmsException;
use FreeCMS\Common\Model\CmsArctypeModel;
use FreeCMS\Admin\BaseAdminPage;

class ArcTypeEditAjax extends BaseAdminPage
{

    function execute($vars = [])
    {
        $method = request('method');
        $model = new CmsArctypeModel();
        if($method==EditType::Delete){
            //删除
            $id = getInteger('id');
            $where = sprintf("id=%d or pid=%d",$id,$id);
            $sql = 'select max(arccount) as cc from cms_arctype where '.$where;
            $row = $model->findFirstBySql($sql);
            if($row['cc']>0){
                FreeCmsException::throwExp(ErrorCode::PARAM_ERROR,'栏目或子栏目有文章内容，无法删除');
            }else{
                $model->where($where)->delete();
            }
        }elseif ($method == EditType::Batch) {
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

            $pid = getInteger('pid', 0);
            $sortrank = getInteger('sortrank', 50);
            $typename = requestNotEmpty('typename');
            $typedir = post('typedir');
            $channel = requestNotEmpty('channel');
            $type = requestNotEmpty('type');
            $seotitle = post('seotitle');
            $description = post('description');
            $keywords = post('keywords');
            $tempface = post('tempface');
            $templist = post('templist');
            $temparchive = post('temparchive');
            $litpic = post('litpic');
            $extinfo = post('extinfo');
            if(!empty($extinfo)){
                $ext = json_decode($extinfo,true);
                if($ext){
                    $extinfo = json_encode($ext);
                }else{
                    $extinfo = null;
                }
            }
            //上级菜单
            $topid = 0;
            //级别
            $level = 1;
            if ($pid > 0) {
                $prow = $model->findById($pid);
                $pl = intval($prow['level']);
                $level = $pl + 1;
                $topid = $level > 2
                    ? intval($prow['topid'])
                    : intval(
                        $prow['id']
                    );
            }
            $data = [
                'pid' => $pid,
                'topid' => $topid,
                'sortrank' => $sortrank,
                'typename' => $typename,
                'typedir' => $typedir,
                'channel' => $channel,
                'type' => $type,
                'seotitle' => $seotitle,
                'description' => $description,
                'keywords' => $keywords,
                'tempface' => $tempface,
                'templist' => $templist,
                'temparchive' => $temparchive,
                'litpic' => $litpic,
                'level' => $level,
                'extinfo'=>$extinfo,
            ];
            switch ($method) {
                case EditType::Add:
                    $model->add($data);
                    break;
                case EditType::Update:
                case EditType::Edit:
                    $id = getInteger('id', 0);
                    $model->updateById($id, $data);
                    break;
            }
        }
        $this->successJson('ok');

    }
}