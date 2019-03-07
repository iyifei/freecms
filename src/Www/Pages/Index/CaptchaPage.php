<?php
/**
 * Class [CaptchaPage]
 * 验证码
 */

namespace FreeCMS\Www\Pages\Index;


use FreeCMS\Common\Libs\Captcha;
use FreeCMS\Common\Libs\Page;
use FreeCMS\Common\Model\CmsSysConfigModel;

class CaptchaPage extends Page
{

    protected $declareNeedLogin = false;

    public function beforeExecute()
    {
        //不用初始化smarty
    }

    /**
     * 执行入口
     *
     * @param array $vars
     *
     * @return mixed
     */
    function execute($vars = [])
    {
       $cp = config('captcha');
       $width = $cp['width'];
       $height = $cp['height'];
       $len = $cp['len'];
       $type = $cp['type'];
       $size = $cp['fontSize'];
        //开启了参数模式
        if($cp['enableParam']){
            $width = getInteger('w', $width);
            $height = getInteger('h', $height);
            $size = getInteger('s', $size);
        }

        //初始化工具(必须传入有效的字体路径)
        $captcha = (new Captcha())->setLength($len)->setVerifyType($type)->drawImage($width, $height, $size);
        //绘制图像并显示
        $code = $captcha->getCode();
        session('captcha', $code);
        $captcha->show();
        exit;
    }
}