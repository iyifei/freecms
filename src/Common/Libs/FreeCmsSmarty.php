<?php
/**
 * Class [FreeCmsSmarty]
 * smarty子类
 * author minyifei
 * date 2019/3/1
 */

namespace FreeCMS\Common\Libs;


class FreeCmsSmarty extends \Smarty
{

    public $block_data = [];

    public function __get($name)
    {
        if (isset($this->accessMap[ $name ])) {
            $method = 'get' . $this->accessMap[ $name ];
            return $this->{$method}();
        } elseif (isset($this->_cache[ $name ])) {
            return $this->_cache[ $name ];
        } elseif (in_array($name, $this->obsoleteProperties)) {
            return null;
        } else {
            trigger_error('Undefined property: ' . get_class($this) . '::$' . $name, E_USER_NOTICE);
        }
        return null;
    }

    public function __set($name, $value)
    {
        if (isset($this->accessMap[ $name ])) {
            $method = 'set' . $this->accessMap[ $name ];
            $this->{$method}($value);
        } elseif (in_array($name, $this->obsoleteProperties)) {
            return;
        } elseif (is_object($value) && method_exists($value, $name)) {
            $this->$name = $value;
        } else {
            trigger_error('Undefined property: ' . get_class($this) . '::$' . $name, E_USER_NOTICE);
        }
    }

    public function setBlockData($key,$val){
        $this->block_data[$key]=$val;
    }

    public function getBlockData($key){
        if(isset($this->block_data[$key])){
            return $this->block_data[$key];
        }else{
            return null;
        }
    }


}