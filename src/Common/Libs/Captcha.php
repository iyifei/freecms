<?php
/**
 * Class [Captcha]
 * 验证码
 */

namespace FreeCMS\Common\Libs;


class Captcha
{

    private $fontPath;      //字体路径
    private $verifyStr;     //字符库
    private $verifyLen;     //字符数
    private $verifyCode;    //验证码
    private $verifyImg;     //验证图像
    private $verifyType; //字符类型；blend-混合，number-数字，english-英文字母
    private $number;
    private $string;

    public function __construct()
    {
        $this->fontPath = SYS_PATH.'/statics/fonts/texb.ttf';
        $this->verifyLen = 4;
        $this->number = '0123456789';
        $this->string = 'abcdefghijkmnpqrstuvwxyz';
        $this->verifyStr = $this->number.$this->string;
        $this->verifyType = 'blend';
    }


    /**
     * Function:setVerifyType
     * 描述
     *
     * @param $verifyType
     *
     * @return $this
     */
    public function setVerifyType($verifyType)
    {
        switch ($verifyType){
            case 'blend':
                $this->verifyStr = $this->number.$this->string;
                break;
            case 'number':
                $this->verifyStr = $this->number;
                break;
            case 'english':
                $this->verifyStr = $this->string;
                break;
        }
        return $this;
    }


    /**
     * 设置验证码所包含的字符
     *
     * @param $str
     */
    public function setChars($str)
    {
        $this->verifyStr = $str;
    }

    /**
     * Function:setLength
     * 设置验证码字符串长度
     *
     * @param $num
     *
     * @return $this
     */
    public function setLength($num)
    {
        $this->verifyLen = $num;
        return $this;
    }

    /**
     * 得到验证码的内容(默认转换为小写)
     *
     * @param bool $tolower
     *
     * @return string
     */
    public function getCode($tolower = true)
    {
        if ($tolower) {
            return strtolower($this->verifyCode);
        } else {
            return $this->verifyCode;
        }
    }

    /**
     * Function:drawImage
     * 绘制验证码图像
     *
     * @param int $width 宽度
     * @param int $height 高度
     * @param int $fontsize 字体大小
     *
     * @return $this
     */
    public function drawImage($width=65,$height=25,$fontsize=16)
    {
        $graylevel = 250;//背景灰度
        $content = '';//验证码内容
        $image = imagecreatetruecolor($width, $height);
        $bgcolor = imagecolorallocate(
            $image, $graylevel, $graylevel, $graylevel
        );
        imagefill($image, 0, 0, $bgcolor);
        //绘制随机字符
        for ($i = 0; $i < $this->verifyLen; $i++) {
            $fontcolor = imagecolorallocate(
                $image, rand(1, 220), rand(1, 150), rand(1, 200)
            );
            $fontchar = mb_substr(
                $this->verifyStr,
                rand(0, mb_strlen($this->verifyStr, 'utf8') - 1), 1, 'utf8'
            );
            $x = ($i * $width / $this->verifyLen) + rand(0, 10);
            $y = $height / 2 + rand(-2, 2) + $fontsize / 2;
            imagettftext(
                $image, $fontsize, rand(-2, 2), $x, $y, $fontcolor,
                $this->fontPath, $fontchar
            );
            $content .= $fontchar;
        }
        //绘制随机点
        for ($i = 0; $i < $this->verifyLen * 10; $i++) {
            $pointcolor = imagecolorallocate(
                $image, rand(1, 200), rand(50, 200), rand(50, 200)
            );
            imagefilledellipse(
                $image, rand(0, $width), rand(0, $height), 1, 1, $pointcolor
            );
        }
        //绘制随机直线
        for ($i = 0; $i < $this->verifyLen; $i++) {
            $linecolor = imagecolorallocatealpha(
                $image, rand(60, 120), rand(80, 160), rand(60, 120),
                rand(80, 100)
            );
            imageline(
                $image, 0, rand(0, $height - 0), $width, rand(0, $height - 0),
                $linecolor
            );
        }
        $this->verifyCode = $content;
        $this->verifyImg = $image;
        return $this;
    }

    /**
     * 显示验证码
     */
    public function show()
    {
        header('content-type: image/png');
        imagepng($this->verifyImg);
        imagedestroy($this->verifyImg);
    }
}