<?php
/**
 * Class [CmsSysConfigModel]
 * 系统配置
 * author minyifei
 * date 2018/11/19
 */

namespace FreeCMS\Common\Model;



use FreeCMS\Common\Libs\File;

class CmsSysConfigModel extends Model
{

    public function getTableName()
    {
        return 'cms_sysconfig';
    }


    public function getCacheConfigs(){
        $name = 'sys_config';
        $data = File::readArrayCache($name);
        if(empty($data)){
            $rows = $this->findAll();
            $data = array_column($rows,null,'varname');
            File::writeArrayCache($name,$data);
        }
        return $data;
    }

    //更新缓存
    public function updateCacheConfigs(){
        $name = 'sys_config';
        $rows = $this->findAll();
        $data = array_column($rows,null,'varname');
        File::writeArrayCache($name,$data);
    }

}