<?php
/**
 * Class [CmsICloudTokenModel]
 * 云存储token信息
 * author minyifei
 * date 2018/11/16
 */

namespace FreeCMS\Common\Model;


class CmsICloudTokenModel extends Model
{
    public function getTableName()
    {
        return 'cms_icloud_token';
    }

    /**
     * Function:checkToken
     * 检测token是否过期
     *
     * @param $token
     *
     * @return bool
     */
    public function checkToken($token){
        $row = $this->find('token',$token);
        if($row && strtotime($row['expire_time'])>time()){
            return true;
        }else{
            return false;
        }
    }
}