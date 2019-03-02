<?php
/**
 * 全局配置函数
 * author minyifei
 * date 2018/11/28
 */

function smarty_function_global($params, &$smarty) {
    //function的返回值将替换模版中函数调用位置的内容
    $name = getParamsValue($params, "name");
    if (isset($name)) {
        //所有的栏目
        $allConfigs = (new \FreeCMS\Common\Model\CmsSysConfigModel())->getCacheConfigs();
        if(isset($allConfigs[$name])){
            $config = $allConfigs[$name];
            return $config["value"];
        }else{
            return "";
        }
    }
}