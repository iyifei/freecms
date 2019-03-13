<?php
/**
 * 系统菜单
 * User: iyifei
 * Date: 2018/11/14
 * Time: 上午10:25
 */

namespace FreeCMS\Common\Model;


class CmsMenuModel extends Model
{

    //排序
    private $_orderBy = 'sortrank asc,id asc';

    /**
     * Function:findTopMenu
     * 查询顶级菜单
     *
     * @return array|mixed|null
     */
    public function findTopMenu(){
        $where = 'pid=0';
        return $this->where($where)->orderBy($this->_orderBy)->findAll();
    }

    /**
     * Function:findMenuByTopId
     * 查询制定菜单的所有子菜单
     *
     * @param $topId
     *
     * @return array|mixed|null
     */
    public function findMenuByTopId($topId){
        $where = sprintf('topid=%d',$topId);
        return $this->where($where)->orderBy($this->_orderBy)->findAll();
    }

    /**
     * Function:findAllMenu
     * 获取所有的菜单
     *
     * @return array|mixed|null
     */
    public function findAllMenu(){
        return $this->orderBy($this->_orderBy)->findAll();
    }

    public function findShowMenu(){
        $where  = 'ishide=0';
        return $this->where($where)->orderBy($this->_orderBy)->findAll();
    }
}