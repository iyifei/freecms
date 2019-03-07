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
           $data = $this->updateCacheConfigs();
        }
        return $data;
    }

    //更新缓存
    public function updateCacheConfigs(){
        $name = 'sys_config';
        $rows = $this->findAll();
        $data = array_column($rows,null,'varname');
        File::writeArrayCache($name,$data);

        //设置水印配置
        $water = config('water');
        $water['type']=$data['sys_cfg_water_type']['value'];
        list($ww,$wh)=explode(',',$data['sys_cfg_water_size']['value']);
        $water['imageMinWidth']=$ww;
        $water['imageMinHeight']=$wh;
        $water['word']=$data['sys_cfg_water_word']['value'];
        list($wf,$wc)=explode(',',$data['sys_cfg_water_font']['value']);
        $water['fontSize']=$wf;
        $water['fontColor']=$wc;
        $water['position']=$data['sys_cfg_water_pos']['value'];
        $water['word']=$data['sys_cfg_water_word']['value'];
        $water['transparent']=intval($data['sys_cfg_water_alpha']['value']);
        if($data['sys_cfg_water']['value']==0){
            $water['enable']=false;
        }else{
            $water['enable']=true;
        }
        File::writeArray(SYS_PATH.'/configs/water.config.php',$water);

        //设置验证码
        $captcha = config("captcha");
        list($width,$height,$size) = explode(',',$data['sys_cfg_vcode_size']['value']);
        $captcha['len'] = intval($data['sys_cfg_vcode_len']['value']);
        $captcha['type'] = $data['sys_cfg_vcode_type']['value'];
        $captcha['enableParam'] = $data['sys_cfg_vcode_mode']['value']==1?true:false;
        $captcha['width']=$width;
        $captcha['height']=$height;
        $captcha['fontSize']=$size;
        File::writeArray(SYS_PATH.'/configs/captcha.config.php',$captcha);

        return $data;
    }

}