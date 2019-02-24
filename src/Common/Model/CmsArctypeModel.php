<?php
/**
 * Class [CmsArctypeModel]
 * 栏目
 */

namespace FreeCMS\Common\Model;


use Common\Libs\Tree;
use Common\Libs\Utils;

class CmsArctypeModel extends Model
{

    //排序
    private $_orderBy = 'sortrank asc,id asc';

    /**
     * Function:findTopArcType
     * 查询顶级栏目
     *
     * @return array|mixed|null
     */
    public function findTopArcType(){
        $where = 'pid=0';
        return $this->where($where)->orderBy($this->_orderBy)->findAll();
    }

    /**
     * Function:findArcTypeByTopId
     * 查询制定栏目的所有子栏目
     *
     * @param $topId
     *
     * @return array|mixed|null
     */
    public function findArcTypeByTopId($topId){
        $where = sprintf('topid=%d',$topId);
        return $this->where($where)->orderBy($this->_orderBy)->findAll();
    }

    /**
     * Function:findChildIdsByTopId
     * 查询topid对应的子栏目id，包括topid
     *
     * @param $topId
     *
     * @return array
     */
    public function findChildIdsByTopId($topId){
       $rows = $this->field('id')->where('topid=:topid',['topid'=>$topId])->findAll();
       $childIds = array_column($rows,'id');
       $childIds[]=$topId;
       return $childIds;
    }

    /**
     * Function:findAllArcType
     * 获取所有的栏目
     *
     * @return array|mixed|null
     */
    public function findAllArcType(){
        return $this->orderBy($this->_orderBy)->findAll();
    }

    /**
     * Function:findTreeByChannel
     * 根据类型获取树结构
     *
     * @param $channel
     *
     * @return array
     */
    public function findTreeByChannel($channel){
        $where = "channel=:channel and type!='link'";
        $bind = ['channel'=>$channel];
        $rows = $this->orderBy($this->_orderBy)->where($where,$bind)->findAll();
        $tree = new Tree();
        $tree->init($rows);
        $treeData = $tree->get_tree_list();
        return $treeData;
    }

    /**
     * Function:findAllChildIds
     * 读取栏目的所有子栏目id包括自身id
     *
     * @param $id
     *
     * @return array
     */
    public function findAllChildIds($id){
        $row = $this->field('id,pid,topid')->findById($id);
        $topid = $row['topid']==0?$row['id']:$row['topid'];
        $rows = $this->field('id,pid')->where("topid={$topid}")->findAll();
        $tree = Utils::childTree($rows,$id);
        $childs = Utils::childRows($tree);
        $childIds = array_column($childs,'id');
        $childIds = array_merge($childIds,[$id]);
        return $childIds;
    }

    /**
     * Function:findChildIds
     * 查询一批id的所有子栏目id，返回栏目id包含查询的id
     *
     * @param $ids
     *
     * @return array
     */
    public function findChildIds($ids){
        $rows = $this->field('id,pid,topid')->where(sprintf('id in(%s)',join(',',$ids)))->findAll();
        $topIds = [];
        foreach ($rows as $row){
            $topid = $row['topid']==0?$row['id']:$row['topid'];
            if(!in_array($topid,$topIds)){
                $topIds[]=$topid;
            }
        }
        $rows = $this->field('id,pid')->where(sprintf('topid in(%s)',join(',',$topIds)))->findAll();
        $allIds = [];
        foreach ($ids as $id){
            $tree = Utils::childTree($rows,$id);
            $childs = Utils::childRows($tree);
            $childIds = array_column($childs,'id');
            $allIds = array_merge($childIds,$allIds);
        }
        $allIds = array_merge($allIds,$ids);
        return array_unique($allIds);
    }
}