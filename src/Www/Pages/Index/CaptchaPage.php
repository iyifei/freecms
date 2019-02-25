<?php
/**
 * Class [CaptchaPage]
 * 验证码
 */

namespace FreeCMS\Www\Pages\Index;


use FreeCMS\Common\Libs\Captcha;
use FreeCMS\Common\Libs\Page;

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
        $width = getInteger('w',65);
        $height = getInteger('h',25);
        $size = getInteger('s',16);
        //初始化工具(必须传入有效的字体路径)
        $captcha = (new Captcha())->drawImage($width,$height,$size);
        //绘制图像并显示
        $code = $captcha->getCode();
        session('captcha',$code);
        $captcha->show();
        exit;
    }
}