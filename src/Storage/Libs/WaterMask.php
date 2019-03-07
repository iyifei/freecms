<?php
/**
 * Class [WaterMask]
 * 水印处理
 * author minyifei
 * date 2019/3/7
 */

namespace FreeCMS\Storage\Libs;


use FreeCMS\Common\Exception\FreeCmsException;

class WaterMask
{
    public $waterType = 'word';  //水印类型：word-为文字水印、image-为图片水印
    public $pos = 'bottom-right';  //水印位置
    public $transparent = 100; //水印透明度
    public $waterStr = 'freecms.com.cn';  //水印文字
    public $fontSize = 16; //文字字体大小
    public $fontColor = "#FFFFFF"; //水印文字颜色（RGB）
    public $fontFile = SYS_PATH.'/statics/water/FZXSSJW.TTF';//字体文件
    public $waterImg = SYS_PATH.'/statics/water/water.png';//水印图片
    private $srcImg = '';//需要添加水印的图片
    private $im = '';//图片句柄
    private $water_im = '';//水印图片句柄
    private $srcImg_info = '';//图片信息
    private $waterImg_info = '';//水印图片信息
    private $str_w = '';//水印文字宽度
    private $str_h = '';//水印文字高度
    private $x = '';//水印X坐标
    private $y = '';//水印y坐标

    function __construct($img)
    {
        ob_clean();/* 清空（擦掉）输出缓冲区，不加此行可能无法显示图像*/
        if (!file_exists($img)) {
            die('"' . $img . '" 对不起，水印文件不存在！');
        }
        $this->srcImg = $img;
    }

    private function imginfo()
    {//获取水印图片信息，并加载。
        $this->srcImg_info = getimagesize($this->srcImg);
        switch ($this->srcImg_info[2]) {
            case 3:
                $this->im = imagecreatefrompng($this->srcImg);
                break 1;
            case 2:
                $this->im = imagecreatefromjpeg($this->srcImg);
                break 1;
            case 1:
                $this->im = imagecreatefromgif($this->srcImg);
                break 1;
            default:
                FreeCmsException::throwExpMsg('水印图片（' . $this->srcImg . '）水印图片格式不对，请选择PNG、JPEG、GIF格式的图片。');
        }
    }

    private function waterimginfo()
    {//获取水印图片并载入。
        $this->waterImg_info = getimagesize($this->waterImg);
        switch ($this->waterImg_info[2]) {
            case 3:
                $this->water_im = imagecreatefrompng($this->waterImg);
                break 1;
            case 2:
                $this->water_im = imagecreatefromjpeg($this->waterImg);
                break 1;
            case 1:
                $this->water_im = imagecreatefromgif($this->waterImg);
                break 1;
            default:
                FreeCmsException::throwExpMsg('水印图片（' . $this->srcImg . '）格式不对，只支持PNG、JPEG、GIF。');
        }
    }

    private function waterpos()
    {//水印位置算法
        switch ($this->pos) {
            case 'random':     //随机位置
                $this->x = rand(
                    0, $this->srcImg_info[0] - $this->waterImg_info[0]
                );
                $this->y = rand(
                    0, $this->srcImg_info[1] - $this->waterImg_info[1]
                );
                break 1;
            case 'top-left':     //上左
                $this->x = 10;
                $this->y = 10;
                break 1;
            case 'top-center':     //上中
                $this->x = ($this->srcImg_info[0] - $this->waterImg_info[0])
                    / 2+10;
                $this->y = 10;
                break 1;
            case 'top-right':     //上右
                $this->x = $this->srcImg_info[0] - $this->waterImg_info[0]-10;
                $this->y = 10;
                break 1;
            case 'center-left':     //中左
                $this->x = 10;
                $this->y = ($this->srcImg_info[1] - $this->waterImg_info[1])
                    / 2;
                break 1;
            case 'center':     //中中
                $this->x = ($this->srcImg_info[0] - $this->waterImg_info[0])
                    / 2;
                $this->y = ($this->srcImg_info[1] - $this->waterImg_info[1])
                    / 2;
                break 1;
            case 'center-right':     //中右
                $this->x = $this->srcImg_info[0] - $this->waterImg_info[0]-10;
                $this->y = ($this->srcImg_info[1] - $this->waterImg_info[1])
                    / 2;
                break 1;
            case 'bottom-left':     //下左
                $this->x = 10;
                $this->y = $this->srcImg_info[1] - $this->waterImg_info[1]-10;
                break 1;
            case 'bottom-center':     //下中
                $this->x = ($this->srcImg_info[0] - $this->waterImg_info[0])
                    / 2;
                $this->y = $this->srcImg_info[1] - $this->waterImg_info[1]-10;
                break 1;
            default:    //下右
                $this->x = $this->srcImg_info[0] - $this->waterImg_info[0]-10;
                $this->y = $this->srcImg_info[1] - $this->waterImg_info[1]-10;
                break 1;
        }
    }

    private function waterimg()
    {
        if ($this->srcImg_info[0] <= $this->waterImg_info[0]
            || $this->srcImg_info[1] <= $this->waterImg_info[1]
        ) {
            FreeCmsException::throwExpMsg('水印比原图大');
        }
        $this->waterpos();
        $cut = imagecreatetruecolor(
            $this->waterImg_info[0], $this->waterImg_info[1]
        );
        imagecopy(
            $cut, $this->im, 0, 0, $this->x, $this->y, $this->waterImg_info[0],
            $this->waterImg_info[1]
        );
        $pct = $this->transparent;
        imagecopy(
            $cut, $this->water_im, 0, 0, 0, 0, $this->waterImg_info[0],
            $this->waterImg_info[1]
        );
        imagecopymerge(
            $this->im, $cut, $this->x, $this->y, 0, 0, $this->waterImg_info[0],
            $this->waterImg_info[1], $pct
        );
    }

    private function waterstr()
    {
        $rect = imagettfbbox(
            $this->fontSize, 0, $this->fontFile, $this->waterStr
        );
        $w = abs($rect[2] - $rect[6]);
        $h = abs($rect[3] - $rect[7]);
        $fontHeight = $this->fontSize;
        $this->water_im = imagecreatetruecolor($w, $h);
        imagealphablending($this->water_im, false);
        imagesavealpha($this->water_im, true);
        $white_alpha = imagecolorallocatealpha(
            $this->water_im, 255, 255, 255, 127
        );
        imagefill($this->water_im, 0, 0, $white_alpha);
        $fontColorRgb = hex2rgb($this->fontColor);
        $color = imagecolorallocate(
            $this->water_im, $fontColorRgb['r'], $fontColorRgb['g'],
            $fontColorRgb['b']
        );
        imagettftext(
            $this->water_im, $this->fontSize, 0, 0, $this->fontSize, $color,
            $this->fontFile, $this->waterStr
        );
        $this->waterImg_info = array(0 => $w, 1 => $h);
        $this->waterimg();
    }

    function save($file){
        $this->imginfo();
        if ($this->waterType == 'image') {
            $this->waterimginfo();
            $this->waterimg();
        } else {
            $this->waterstr();
        }
        switch ($this->srcImg_info[2]) {
            case 3:
                imagepng($this->im,$file);
                break 1;
            case 2:
                imagejpeg($this->im,$file);
                break 1;
            case 1:
                imagegif($this->im,$file);
                break 1;
            default:
                FreeCmsException::throwExpMsg('原因未知：水印添加失败！');
                break;
        }
        imagedestroy($this->im);
        imagedestroy($this->water_im);
        return $file;
    }

    function output()
    {
        $this->imginfo();
        if ($this->waterType == 0) {
            $this->waterstr();
        } else {
            $this->waterimginfo();
            $this->waterimg();
        }
        switch ($this->srcImg_info[2]) {
            case 3:
                Header('Content-type:image/png');
                imagepng($this->im);
                break 1;
            case 2:
                Header('Content-type:image/jpeg');
                imagejpeg($this->im);
                break 1;
            case 1:
                Header('Content-type:image/gif');
                imagegif($this->im);
                break 1;
            default:
                FreeCmsException::throwExpMsg('原因未知：水印添加失败！');
                break;
        }
        imagedestroy($this->im);
        imagedestroy($this->water_im);
    }

}