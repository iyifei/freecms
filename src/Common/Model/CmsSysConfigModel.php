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


    public function getCacheConfigs()
    {
        $name = 'sys_config';
        $data = File::readArrayCache($name);
        if (empty($data)) {
            $data = $this->updateCacheConfigs();
        }
        return $data;
    }

    //更新缓存
    public function updateCacheConfigs()
    {
        $name = 'sys_config';
        $rows = $this->findAll();
        $data = array_column($rows, null, 'varname');
        File::writeArrayCache($name, $data);

        //设置水印配置
        $water = config('water');
        $water['type'] = $data['sys_cfg_water_type']['value'];
        list($ww, $wh) = explode(',', $data['sys_cfg_water_size']['value']);
        $water['imageMinWidth'] = $ww;
        $water['imageMinHeight'] = $wh;
        $water['word'] = $data['sys_cfg_water_word']['value'];
        list($wf, $wc) = explode(',', $data['sys_cfg_water_font']['value']);
        $water['fontSize'] = $wf;
        $water['fontColor'] = $wc;
        $water['position'] = $data['sys_cfg_water_pos']['value'];
        $water['word'] = $data['sys_cfg_water_word']['value'];
        $water['transparent'] = intval($data['sys_cfg_water_alpha']['value']);
        if ($data['sys_cfg_water']['value'] == 0) {
            $water['enable'] = false;
        } else {
            $water['enable'] = true;
        }
        File::writeArray(SYS_PATH . '/configs/water.config.php', $water);

        //设置验证码
        $captcha = config("captcha");
        list($width, $height, $size) = explode(
            ',', $data['sys_cfg_vcode_size']['value']
        );
        $captcha['len'] = intval($data['sys_cfg_vcode_len']['value']);
        $captcha['type'] = $data['sys_cfg_vcode_type']['value'];
        $captcha['enableParam'] = $data['sys_cfg_vcode_mode']['value'] == 1
            ? true : false;
        $captcha['width'] = $width;
        $captcha['height'] = $height;
        $captcha['fontSize'] = $size;
        File::writeArray(SYS_PATH . '/configs/captcha.config.php', $captcha);

        //更新云存储配置
        $sm = strtolower($data['sys_cfg_storage_mode']['value']);
        switch ($sm) {
            case 'qiniu':
                if($data['sys_cfg_qiniu_check']['value']==1){
                    $ossConfig = [
                        'adapter' => [
                            'class' => \FreeCMS\Storage\Adapter\QiniuAdapter::class,
                            'param' => [
                                'accessKey' => $data['sys_cfg_qiniu_accessKey']['value'],
                                'secretKey' => $data['sys_cfg_qiniu_secretKey']['value'],
                                'bucket' => $data['sys_cfg_qiniu_bucket']['value'],
                                'domain' => $data['sys_cfg_qiniu_domain']['value'],
                            ],
                        ]
                    ];
                }
                break;
            case 'aliyun':
                if($data['sys_cfg_aliyun_check']['value']==1){
                    $ossConfig = [
                        'adapter' => [
                            'class' => \FreeCMS\Storage\Adapter\AliyunAdapter::class,
                            'param' => [
                                'access_id' => $data['sys_cfg_aliyun_access_id']['value'],
                                'access_secret' => $data['sys_cfg_aliyun_access_secret']['value'],
                                'bucket' => $data['sys_cfg_aliyun_bucket']['value'],
                                'endpoint' => $data['sys_cfg_aliyun_endpoint']['value'],
                            ],
                        ],
                    ];
                }
                break;
        }
        if(empty($ossConfig)){
            $ossConfig = [
                'adapter' => [
                    //本机存储
                    'class' => \FreeCMS\Storage\Adapter\LocalAdapter::class,
                    'param' => [
                        'root' => SYS_PATH . '/uploads',
                        'domain' => getCurrentDomain() . '/uploads',
                    ],
                ],
            ];
        }
        File::writeArray(SYS_PATH . '/configs/oss.config.php', $ossConfig);

        //更新论坛配置
        $forum = [
            'title'=>$data['sys_cfg_forum_title']['value'],
            'description'=>$data['sys_cfg_forum_description']['value'],
            'keywords'=>$data['sys_cfg_forum_keywords']['value'],
        ];
        File::writeArray(SYS_PATH . '/configs/forum.config.php', $forum);

        return $data;
    }

}