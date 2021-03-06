<?php
/**
 * Class [CmsAddOnImagesModel]
 * 图片
 * author minyifei
 * date 2018/11/21
 */

namespace FreeCMS\Common\Model;


class CmsAddOnImagesModel extends Model
{

    public function getTableName()
    {
        return 'cms_addonimages';
    }

    public function updateById($id, $data)
    {
        $where = 'aid=:aid';
        $bind = ['aid'=>$id];
        return $this->update($data,$where,$bind);
    }

    function findById($id)
    {
        $where = 'aid=:aid';
        $bind = ['aid'=>$id];
        return $this->where($where,$bind)->findFirst();
    }

    function deleteById($id){
        $where = 'aid=:aid';
        $bind = ['aid'=>$id];
        return $this->where($where,$bind)->delete();
    }

    /**
     * Function:deleteByIds
     * 批量删除
     *
     * @param $ids
     *
     * @return void
     */
    public function deleteByIds($ids){
        if(is_array($ids)){
            $ids = join(',',$ids);
        }
        $where = sprintf("aid in(%s)",$ids);
        $this->where($where)->delete();
    }

}