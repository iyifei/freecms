<?php

namespace FreeCMS\Storage\Pages;

use FreeCMS\Common\Exception\FreeCmsException;
use FreeCMS\Storage\BaseCloudPage;
use FreeCMS\Storage\GEnum\ErrorCode;
use FreeCMS\Storage\Libs\AdapterManager;

/**
 * Class [DeleteAjax]
 * 删除资源
 * author freecms.com.cn
 * date 2018/11/16
 */
class DeleteAjax extends BaseCloudPage
{

    /**
     * Function:execute
     * 执行入口
     *
     * @param array $vars
     *
     * @throws \Exception
     * @return void
     */
    function execute($vars = [])
    {
        $key = requestNotEmpty('key');
        //授权token
        $token = requestNotEmpty('token');
        if(session('FreeCMS_Cloud_Token')==$token){
            if (!empty($key) && $key != '/') {
                //存储key
                $key = ltrim($key, '/');

                $fileSystem = AdapterManager::getFilesystem();
                $fileSystem->delete($key);
                $res = ['key'=>$key];
                $this->successJson($res);
            } else {
                FreeCmsException::throwExp(ErrorCode::KEY_ERROR,'key is not empty');
            }
        }else{
            FreeCmsException::throwExp(ErrorCode::TOKEN_ERROR,'token error');
        }
    }
}