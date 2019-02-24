<?php
/**
 * 树结构
 * User: iyifei
 * Date: 2018/11/14
 * Time: 下午3:07
 */

namespace FreeCMS\Common\Libs;


class Tree
{


    /**
     * 生成树型结构所需要的2维数组
     * @var array
     */
    public $arr = array();

    /**
     * 生成树型结构所需修饰符号，可以换成图片
     * @var array
     */
    public $icon = array('│ ', '├─ ', '└─ ');
    public $nbsp = "&emsp;";
    private $str ='';
    /**
     * @access private
     */
    public $ret = '';

    /**
     * 构造函数，初始化类
     * @param array 2维数组，例如：
     * array(
     *      1 => array('id'=>'1','pid'=>0,'name'=>'一级栏目一'),
     *      2 => array('id'=>'2','pid'=>0,'name'=>'一级栏目二'),
     *      3 => array('id'=>'3','pid'=>1,'name'=>'二级栏目一'),
     *      4 => array('id'=>'4','pid'=>1,'name'=>'二级栏目二'),
     *      5 => array('id'=>'5','pid'=>2,'name'=>'二级栏目三'),
     *      )
     */
    public function init($arr=array()) {
        if(is_array($arr)) $this->arr = $arr;
    }

    /**
     * 得到父级数组
     * @param int
     * @return array
     */
    public function get_parent($myid) {
        $newarr = array();
        if (!isset($this->arr[$myid]))
            return false;
        $pid = $this->arr[$myid]['pid'];
        $pid = $this->arr[$pid]['pid'];
        if (is_array($this->arr)) {
            foreach ($this->arr as $id => $a) {
                if ($a['pid'] == $pid)
                    $newarr[$id] = $a;
            }
        }
        return $newarr;
    }

    /**
     * 得到子级数组
     * @param int
     * @return array
     */
    public function get_child($myid) {
        $child = array();
        if (count($this->arr)>0) {
            foreach ($this->arr as $k => $v) {
                if ($v['pid'] == $myid)
                    $child[] = $v;
            }
        }
        return $child;
    }

    /**
     * 得到当前位置数组
     * @param int
     * @return array
     */
    public function get_pos($myid, &$newarr) {
        $a = array();
        if (!isset($this->arr[$myid]))
            return false;
        $newarr[] = $this->arr[$myid];
        $pid = $this->arr[$myid]['pid'];
        if (isset($this->arr[$pid])) {
            $this->get_pos($pid, $newarr);
        }
        if (is_array($newarr)) {
            krsort($newarr);
            foreach ($newarr as $v) {
                $a[$v['id']] = $v;
            }
        }
        return $a;
    }

    /**
     * 得到树型表格列表数组
     * @param int ID，表示获得这个ID下的所有子级
     * @param string $adds 列表前缀符号
     * @return array
     */
    public function get_tree_list($id=0,$adds='') {
        $treeList=array();
        $number = 1;//一级栏目
        $child = $this->get_child($id);
        $count=count($child);
        if ($count>0) {
            foreach ($child as $val) {
                $j = $k = '';
                if ($number == $count) {
                    $j .= $this->icon[2];
                } else {
                    $j .= $this->icon[1];
                    $k = $adds ? $this->icon[0] : '';
                }
                $spacer = $adds ? $adds . $j : '';
                $val['spacer']=$spacer;
                $treeList[]=$val;
                $a=$this->get_tree_list($val['id'],$adds.$k.$this->nbsp);
                if(is_array($a)&&count($a)>0) $treeList=array_merge($treeList,$a);
                $number++;
            }
        }
        return $treeList;
    }


    /**
     * 得到树型结构数组
     * @param int ID，表示获得这个ID下的所有子级
     * @param string 生成树型结构的基本代码，例如："<option value=\$id \$selected>\$spacer\$name</option>"
     * @param int 被选中的ID，比如在做树型下拉框的时候需要用到
     * @return string
     */
    public function get_tree_array($myid, $str, $sid = 0, $adds = '', $str_group = '') {
        $retarray = array();
        //一级栏目数组
        $child = $this->get_child($myid);
        if (is_array($child)) {
            //数组长度
            $total = count($child);
            foreach ($child as $id => $value) {
                @extract($value);
                $retarray[$value['id']] = $value;
                $retarray[$value['id']]["child"] = $this->get_tree_array($id, '');
            }
        }
        return $retarray;
    }

}