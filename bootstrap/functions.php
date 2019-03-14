<?php
/**
 * 公共函数
 * Author: 闵益飞
 * Date: 2018/5/23
 */

use FreeCMS\Common\Exception\ErrorCode;
use FreeCMS\Common\Exception\FreeCmsException;

/**
 * 获取目录下的文件名称
 *
 * @param $dir
 *
 * @return array
 */
function dir_files($dir)
{
    $files = [];
    if (is_dir($dir)) {
        $handler = opendir($dir);
        while (($filename = readdir($handler)) !== false) {
            $file = $dir . '/' . $filename;
            //略过linux目录的名字为'.'和‘..'的文件
            if ($filename != "." && $filename != ".." && is_file($file)) {
                $item = ['file' => $file, 'name' => $filename];
                $files[] = $item;
            }
        }
        closedir($handler);
    }
    return $files;
}

/**
 * 读取配置文件内容
 *
 * @param string $name
 *
 * @return null
 */
function config($name = null)
{
    global $_gblConfig;
    $nameArr = explode('.', $name);
    $fName = current($nameArr);
    $res = null;
    if (isset($_gblConfig[$fName])) {
        unset($nameArr[0]);
        $res = $_gblConfig[$fName];
        foreach ($nameArr as $ne) {
            if (isset($res[$ne])) {
                $res = $res[$ne];
            } else {
                $res = null;
                break;
            }
        }
    }
    return $res;
}

/**
 * 加载配置文件
 *
 * @param array $configFiles 配置文件数组,注意数组的先后顺序，后面的文件会覆盖前面
 *
 * @return array
 */
function load_configs($configFiles)
{
    $_gblConfig = [];
    foreach ($configFiles as $iniFile) {
        if (!isset($_gblConfig)) {
            $_gblConfig = [];
        }
        $file = $iniFile['file'];
        $fileArr = explode("/", $file);
        $fileName = end($fileArr);
        $fileNames = explode(".", $fileName);
        $c = count($fileNames);
        $cs = [];
        if ($fileNames[$c - 2] == 'config') {
            unset($fileNames[$c - 1]);
            unset($fileNames[$c - 2]);
            $data = include $file;
            switch ($c) {
                case 3:
                    $cs[$fileNames[0]] = $data;
                    break;
                case 4:
                    $cs[$fileNames[0]][$fileNames[1]] = $data;
                    break;
                case 5:
                    $cs[$fileNames[0]][$fileNames[1]][$fileNames[2]] = $data;
                    break;
            }
            $_gblConfig = array_merge_recursive($_gblConfig, $cs);
        }
    }
    return $_gblConfig;
}

/**
 * 压缩html代码
 *
 * @param $html_source
 *
 * @return string
 */
function compress_html($html_source)
{
    return ltrim(
        rtrim(
            preg_replace(
                array(
                    "/> *([^ ]*) *</", "//", "'/\*[^*]*\*/'", "/\r\n/", "/\n/",
                    "/\t/", '/>[ ]+</'
                ),
                array(">\\1<", '', '', '', '', '', '><'), $html_source
            )
        )
    );
}


/**
 * 字符串加密
 *
 * @param string $original
 * @param string $secret 秘钥
 *
 * @return string
 */
function encodePassword($original, $secret = 'ZqK2et5JMI')
{
    $encoder = md5($secret . md5(base64_encode($original . "_freecms.com.cn")));
    return $encoder;
}

/**
 * 获取纯字符串
 *
 * @param $name
 *
 * @return null
 */
function getUrlString($name)
{
    $value = filter_input(INPUT_GET, $name, FILTER_SANITIZE_STRIPPED);
    if ($value) {
        return trim($value);
    } else {
        return null;
    }
}


/**
 * 获取客户端IP
 *
 * @return null
 */
function getClientIP()
{
    static $ip = null;
    if ($ip !== null) {
        return $ip;
    }
    if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
        $pos = array_search('unknown', $arr);
        if (false !== $pos) {
            unset($arr[$pos]);
        }
        $ip = trim($arr[0]);
    } elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    } elseif (isset($_SERVER['REMOTE_ADDR'])) {
        $ip = $_SERVER['REMOTE_ADDR'];
    }
    // IP地址合法验证
    $ip = (false !== ip2long($ip)) ? $ip : '0.0.0.0';
    return $ip;
}

/**
 * GET请求
 *
 * @param      $name
 * @param null $default
 *
 * @return string
 */
function get($name, $default = null)
{
    if (isset($_GET[$name])) {
        $value = $_GET[$name];
    } else {
        $value = $default;
    }
    return trim($value);
}


/**
 * 读取POST值
 *
 * @param      $name
 * @param null $default
 *
 * @return string
 */
function post($name, $default = null)
{
    if (isset($_POST[$name])) {
        $value = $_POST[$name];
    } else {
        $value = $default;
    }
    return trim($value);
}


/**
 * 读取请求数据
 *
 * @param      $name
 * @param null $default
 *
 * @return string
 */
function request($name, $default = null)
{
    if (isset($_REQUEST[$name])) {
        $value = $_REQUEST[$name];
    } else {
        $value = $default;
    }
    return trim($value);
}


/**
 * 获取Integer变量
 *
 * @param String $name
 * @param        $default null
 *
 * @return NULL|number
 */
function getInteger($name, $default = null)
{
    if (isset($_REQUEST[$name]) && is_numeric($_REQUEST[$name])) {
        $value = intval($_REQUEST[$name]);
    } else {
        $value = $default;
    }
    return $value;
}

/**
 * 获取Double变量
 *
 * @param String $name
 * @param        $default null
 *
 * @return NULL|number
 */
function getDouble($name, $default = null)
{
    if (isset($_REQUEST[$name]) && is_numeric($_REQUEST[$name])) {
        $value = doubleval($_REQUEST[$name]);
    } else {
        $value = $default;
    }
    return $value;
}

/**
 * 接受一个email参数，并校验格式
 *
 * @param string $name 请求参数
 *
 * @return string
 */
function requestEmail($name)
{
    $email = request($name);
    if (checkEmail($email)) {
        return $email;
    } else {
        FreeCmsException::throwExp(
            ErrorCode::PARAM_ERROR, $name . " is not a email"
        );
    }
}

/**
 * 读取不为null的请求数据
 *
 * @param string $name 请求参数
 *
 * @return mixed
 */
function requestNotEmpty($name)
{
    if (isset($_REQUEST[$name]) && !empty($_REQUEST[$name])) {
        $value = $_REQUEST[$name];
        return $value;
    } else {
        FreeCmsException::throwExp(
            ErrorCode::PARAM_ERROR, $name . " is not empty"
        );
    }
}

/**
 * 检查手机号格式
 *
 * @param string $mobile 搜集好
 *
 * @return bool
 */
function checkMobile($mobile)
{
    $result = filter_var(
        $mobile, FILTER_VALIDATE_REGEXP,
        array('options' => array('regexp' => '/^1[0-9]{10,10}$/'))
    );
    if ($result) {
        return true;
    } else {
        return false;
    }
}

/**
 * 检查邮箱格式
 *
 * @param string $email 邮箱
 *
 * @return bool
 */
function checkEmail($email)
{
    $pattern
        = "/([a-z0-9]*[-_.]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[.][a-z]{2,3}([.][a-z]{2})?/i";
    if (preg_match($pattern, $email)) {
        return true;
    } else {
        return false;
    }
}

/**
 * 读取一个header的值
 *
 * @param      $name
 * @param null $headers
 *
 * @return null
 */
function getHeader($name, $headers = null)
{
    if (!isset($headers)) {
        $headers = getFreeCmcAllHeaders();
    }
    if (isset($headers[$name])) {
        return $headers[$name];
    } else {
        return null;
    }
}

/**
 * 读取所有的header信息
 *
 * @return array
 */
function getFreeCmcAllHeaders()
{
    $headers = [];
    foreach ($_SERVER as $name => $value) {
        if (substr($name, 0, 5) == 'HTTP_') {
            $headers[str_replace(
                ' ', '-', strtolower(str_replace('_', ' ', substr($name, 5)))
            )]
                = $value;
        }
    }
    return $headers;
}

/**
 * 获取项目基础绝对URL
 *
 * @return string
 */
function getFullURL()
{
    $pageURL = 'http://';
    $sitePath = getBasePath();
    $host = $_SERVER["HTTP_HOST"];
    $port = $_SERVER["SERVER_PORT"];
    if ($port != "80") {
        $pageURL .= $host . $sitePath;
    } else {
        $pageURL .= str_replace(":80", "", $host) . $sitePath;
    }
    return $pageURL;
}

/**
 * 获取项目基础相对URL
 *
 * @return string
 */
function getBasePath()
{
    $sitePath = dirname($_SERVER['SCRIPT_NAME']);
    if ($sitePath == "/" || $sitePath == "\\") {
        $sitePath = "";
    }
    return $sitePath;
}

/**
 * 获取项目相对url地址
 *
 * @return string
 */
function getBaseURL()
{
    return getBasePath();
}


/**
 * 获取当前时间
 *
 * @return bool|string
 */
function getCurrentTime()
{
    return date("Y-m-d H:i:s");
}


/**
 * session管理
 *
 * @param        $name
 * @param string $value
 */
function session($name, $value = '')
{
    $prefix = "freecms_";
    if ('' === $value) {
        if (0 === strpos($name, '[')) {// session 操作
            if ('[pause]' == $name) {// 暂停session
                session_write_close();
            } elseif ('[start]' == $name) {// 启动session
                session_start();
            } elseif ('[destroy]' == $name) {// 销毁session
                $_SESSION = array();
                session_unset();
                session_destroy();
            } elseif ('[regenerate]' == $name) {// 重新生成id
                session_regenerate_id();
            }
        } elseif (0 === strpos($name, '?')) {// 检查session
            $name = substr($name, 1);
            if ($prefix) {
                return isset($_SESSION[$prefix][$name]);
            } else {
                return isset($_SESSION[$name]);
            }
        } elseif (is_null($name)) {// 清空session
            if ($prefix) {
                unset($_SESSION[$prefix]);
            } else {
                $_SESSION = array();
            }
        } elseif ($prefix) {// 获取session
            if (isset($_SESSION[$prefix][$name])) {
                return $_SESSION[$prefix][$name];
            } else {
                return null;
            }
        } else {
            return $_SESSION[$name];
        }
    } elseif (is_null($value)) {// 删除session
        if ($prefix) {
            unset($_SESSION[$prefix][$name]);
        } else {
            unset($_SESSION[$name]);
        }
    } else {// 设置session
        if ($prefix) {
            if (isset($_SESSION[$prefix]) && !is_array($_SESSION[$prefix])) {
                $_SESSION[$prefix] = array();
            }
            $_SESSION[$prefix][$name] = $value;
        } else {
            $_SESSION[$name] = $value;
        }
    }
}

/**
 * Cookie 设置、获取、删除
 *
 * @param        $name
 * @param string $value
 * @param null   $option
 *
 * @return null|void
 */
function cookie($name, $value = '', $option = null)
{
    // 默认设置
    $config = array(
        'prefix' => "myf", // cookie 名称前缀
        'expire' => '36000', // cookie 保存时间
        'path' => '.', // cookie 保存路径
        'domain' => null, // cookie 有效域名
    );
    // 参数设置(会覆盖黙认设置)
    if (!empty($option)) {
        if (is_numeric($option)) {
            $option = array('expire' => $option);
        } elseif (is_string($option)) {
            parse_str($option, $option);
        }
        $config = array_merge($config, array_change_key_case($option));
    }
    // 清除指定前缀的所有cookie
    if (is_null($name)) {
        if (empty($_COOKIE)) {
            return;
        }
        // 要删除的cookie前缀，不指定则删除config设置的指定前缀
        $prefix = empty($value) ? $config['prefix'] : $value;
        if (!empty($prefix)) {// 如果前缀为空字符串将不作处理直接返回
            foreach ($_COOKIE as $key => $val) {
                if (0 === stripos($key, $prefix)) {
                    setcookie(
                        $key, '', time() - 3600, $config['path'],
                        $config['domain']
                    );
                    unset($_COOKIE[$key]);
                }
            }
        }
        return;
    }
    $name = $config['prefix'] . $name;
    if ('' === $value) {
        return isset($_COOKIE[$name]) ? $_COOKIE[$name] : null;
        // 获取指定Cookie
    } else {
        if (is_null($value)) {
            setcookie(
                $name, '', time() - 3600, $config['path'], $config['domain']
            );
            unset($_COOKIE[$name]);
            // 删除指定cookie
        } else {
            // 设置cookie
            $expire = !empty($config['expire']) ? time() + intval(
                    $config['expire']
                ) : 0;
            setcookie(
                $name, $value, $expire, $config['path'], $config['domain']
            );
            $_COOKIE[$name] = $value;
        }
    }
}

/**
 * 组织成easyui tree格式
 * request data = [[{"id":"1","text":"text","pid":0,"iconCls":"icon_home_page"}]]
 */
function easyuitree($treedata, $pid = 0)
{
    $tree = array();
    foreach ($treedata as $value) {
        $vpid = $value["pid"];
        if ($vpid == $pid) {
            $value["children"] = easyuitree($treedata, $value["id"]);
            $tree[] = $value;
        }
    }
    return $tree;
}

/**
 * 页面跳转
 *
 * @param string $url
 */
function jumpUrl($url)
{
    header("Location:" . $url);
    exit;
}

/**
 * 字符串签名
 *
 * @param $info
 * @param $token
 *
 * @return string
 */
function signEncode($info, $token)
{
    return md5(sprintf("%s_%s", md5($info), $token));
}

/**
 * Function:getMillisecond
 * 获取当前时间毫秒数
 *
 * @return float
 */
function getMillisecond()
{
    list($s1, $s2) = explode(' ', microtime());
    return (float)sprintf('%.0f', (floatval($s1) + floatval($s2)) * 1000);
}

/**
 * 获取唯一标识
 *
 * @return string
 */
function getUUID()
{
    $str = uniqid(microtime(true), true);
    return md5($str);
}


/**
 * Function:getParamsValue
 * 获取数组内容
 *
 * @param      $params
 * @param      $key
 * @param null $default
 *
 * @return null
 */
function getParamsValue($params, $key,$default=null)
{
    if (isset($params[$key]) && $params[$key] != '') {
        return $params[$key];
    } else {
        return $default;
    }
}

/**
 * Function:formatArcUrl
 * 格式化文章地址
 *
 * @param $typedir
 * @param $aid
 * @param $arcnamerule
 *
 * @return mixed
 */
function formatArcUrl($typedir, $aid, $arcnamerule) {
    $searchArr = array("{aid}", "{typedir}");
    $replaceArr = array($aid, $typedir);
    $filename = str_replace($searchArr, $replaceArr, $arcnamerule);
    return $filename;
}

function fun_adm_each(&$array){
    $res = array();
    $key = key($array);
    if($key !== null){
        next($array);
        $res[1] = $res['value'] = $array[$key];
        $res[0] = $res['key'] = $key;
    }else{
        $res = false;
    }
    return $res;
}


//获取本机oss访问域名地址
function getLocalOssDomain(){
    $url = getCurrentDomain().'/cloud';
    return $url;
}

//获取默认缩略图配置
function getDefaultThumbnailConfig(){
    return config('base.thumbnail');
}

//获取当前域名地址
function getCurrentDomain(){
    $current_url = 'http://';
    if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') {
        $current_url = 'https://';
    }
    if ($_SERVER['SERVER_PORT'] != '80') {
        $current_url .= $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'];
    } else {
        $current_url .= $_SERVER['SERVER_NAME'];
    }
    return $current_url;
}

//替换一次
function str_replace_once($needle, $replace, $haystack) {
    // Looks for the first occurence of $needle in $haystack
    // and replaces it with $replace.
    $pos = strpos($haystack, $needle);
    if ($pos === false) {
        // Nothing found
        return $haystack;
    }
    return substr_replace($haystack, $replace, $pos, strlen($needle));
}

/**
 * Function:half_replace
 * 中间几位字符替换为*
 *
 * @param $str
 *
 * @return mixed
 */
function half_replace($str){
    $len = strlen($str)/2;
    return substr_replace($str,str_repeat('*',$len),ceil(($len)/2),$len);
}

/**
 * RGB转 十六进制
 * @param $rgb RGB颜色的字符串 如：rgb(255,255,255);
 * @return string 十六进制颜色值 如：#FFFFFF
 */
function RGBToHex($rgb){
    $regexp = "/^rgb\(([0-9]{0,3})\,\s*([0-9]{0,3})\,\s*([0-9]{0,3})\)/";
    $re = preg_match($regexp, $rgb, $match);
    $re = array_shift($match);
    $hexColor = "#";
    $hex = array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
    for ($i = 0; $i < 3; $i++) {
        $r = null;
        $c = $match[$i];
        $hexAr = array();
        while ($c > 16) {
            $r = $c % 16;
            $c = ($c / 16) >> 0;
            array_push($hexAr, $hex[$r]);
        }
        array_push($hexAr, $hex[$c]);
        $ret = array_reverse($hexAr);
        $item = implode('', $ret);
        $item = str_pad($item, 2, '0', STR_PAD_LEFT);
        $hexColor .= $item;
    }
    return $hexColor;
}
/**
 * 十六进制 转 RGB
 */
function hex2rgb($hexColor) {
    $color = str_replace('#', '', $hexColor);
    if (strlen($color) > 3) {
        $rgb = array(
            'r' => hexdec(substr($color, 0, 2)),
            'g' => hexdec(substr($color, 2, 2)),
            'b' => hexdec(substr($color, 4, 2))
        );
    } else {
        $color = $hexColor;
        $r = substr($color, 0, 1) . substr($color, 0, 1);
        $g = substr($color, 1, 1) . substr($color, 1, 1);
        $b = substr($color, 2, 1) . substr($color, 2, 1);
        $rgb = array(
            'r' => hexdec($r),
            'g' => hexdec($g),
            'b' => hexdec($b)
        );
    }
    return $rgb;
}

function byte_format($size, $dec = 3)
{
    $a = array("B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB");
    $pos = 0;
    while ($size >= 1024) {
        $size /= 1024;
        $pos++;
    }
    return round($size, $dec) . " " . $a[$pos];
}

function directorySize($directory){
    $directorySize = 0;
    //打开目录读取其内容
    if($dh = @opendir($directory)){
        //迭代处理每个目录项
        while(($filename=readdir($dh))){
            //过滤掉一些目录项
            if($filename !="." && $filename !=".."){
                //文件确定大小并添加总大小
                if(is_file($directory."/".$filename)){
                    $directorySize+=filesize($directory."/".$filename);
                }
                //新目录，开始递归
                if(is_dir($directory."/".$filename)){
                    $directorySize += directorySize($directory."/".$filename);
                }
            }
        }
    }
    @closedir($dh);
    return $directorySize;
}


/**
 * XSS 清除处理
 */
function xssClean($data, $htmlentities = 0)
{
    $htmlentities && $data = htmlentities($data, ENT_QUOTES, 'utf-8');
    // Fix &entity\n;
    $data = str_replace(array('&amp;','&lt;','&gt;'), array('&amp;amp;','&amp;lt;','&amp;gt;'), $data);
    $data = preg_replace('/(&#*\w+)[\x00-\x20]+;/u', '$1;', $data);
    $data = preg_replace('/(&#x*[0-9A-F]+);*/iu', '$1;', $data);
    $data = html_entity_decode($data, ENT_COMPAT, 'UTF-8');

    // Remove any attribute starting with "on" or xmlns
    $data = preg_replace('#(<[^>]+?[\x00-\x20"\'])(?:on|xmlns)[^>]*+>#iu', '$1>', $data);

    // Remove javascript: and vbscript: protocols
    $data = preg_replace('#([a-z]*)[\x00-\x20]*=[\x00-\x20]*([`\'"\\\\]*)[\x00-\x20]*j[\x00-\x20]*a[\x00-\x20]*v[\x00-\x20]*a[\x00-\x20]*s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:#iu', '$1=$2nojavascript...', $data);
    $data = preg_replace('#([a-z]*)[\x00-\x20]*=([\'"\\\\]*)[\x00-\x20]*v[\x00-\x20]*b[\x00-\x20]*s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:#iu', '$1=$2novbscript...', $data);
    $data = preg_replace('#([a-z]*)[\x00-\x20]*=([\'"\\\\]*)[\x00-\x20]*-moz-binding[\x00-\x20]*:#u', '$1=$2nomozbinding...', $data);

    // Only works in IE: <span style="width: expression(alert('Ping!'));"></span>
    $data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"\\\\]*.*?expression[\x00-\x20]*\([^>]*+>#i', '$1>', $data);
    $data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"\\\\]*.*?behaviour[\x00-\x20]*\([^>]*+>#i', '$1>', $data);
    $data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"\\\\]*.*?s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:*[^>]*+>#iu', '$1>', $data);

    // Remove namespaced elements (we do not need them)
    $data = preg_replace('#</*\w+:\w[^>]*+>#i', '', $data);

    do
    {
        // Remove really unwanted tags
        $old_data = $data;
        $data = preg_replace('#</*(?:applet|b(?:ase|gsound|link)|embed|frame(?:set)?|i(?:frame|layer)|l(?:ayer|ink)|meta|object|s(?:cript|tyle)|title|xml)[^>]*+>#i', '', $data);
    }
    while ($old_data !== $data);

    // we are done...
    $data = filter_remote_img_type($data, FALSE);
    return $data;
}

/**
 * 过滤内容中有问题网络图片
 * @author phpseyo<phpseyo@qq.com>
 * @param string $text 过滤文本
 * @param boolean $bbcode 是否为BBCODE类型
 * @return string
 */
function filter_remote_img_type($text, $bbcode = TRUE)
{
    $pattern = $bbcode ? "/\[img[^\]]*\]\s*(.*?)+\s*\[\/img\]/is" : "/<img[^>]+src=[\'|\"]([^\'|\"]+)[\'|\"][^>]*[\/]?>/is";
    preg_match_all($pattern, $text, $matches);
    foreach ($matches[1] as $k => $src) {
        $data = get_headers($src);
        $header_str = implode('', $data);
        if (FALSE === strpos($header_str, 'Content-Type: image') || FALSE !== strpos($header_str, 'HTTP/1.1 401') || FALSE !== strpos($header_str, 'HTTP/1.1 404')) {
            $text = str_replace($matches[0][$k], '', $text);
        }
    }
    return $text;
}

/**
 * Function:mdate
 * 时间转换
 *
 * @param null $time
 *
 * @return false|string
 */
function mdate($time = NULL) {
    if(is_string($time)){
        $time = strtotime($time);
    }
    $text = '';
    $time = $time === NULL || $time > time() ? time() : intval($time);
    $t = time() - $time; //时间差 （秒）
    $y = date('Y', $time)-date('Y', time());//是否跨年
    switch($t){
        case $t == 0:
            $text = '刚刚';
            break;
        case $t < 60:
            $text = $t . '秒前'; // 一分钟内
            break;
        case $t < 60 * 60:
            $text = floor($t / 60) . '分钟前'; //一小时内
            break;
        case $t < 60 * 60 * 24:
            $text = floor($t / (60 * 60)) . '小时前'; // 一天内
            break;
        case $t < 60 * 60 * 24 * 3:
            $text = floor($time/(60*60*24)) ==1 ?'昨天 ' . date('H:i', $time) : '前天 ' . date('H:i', $time) ; //昨天和前天
            break;
        case $t < 60 * 60 * 24 * 30:
            $text = date('m月d日 H:i', $time); //一个月内
            break;
        case $t < 60 * 60 * 24 * 365&&$y==0:
            $text = date('m月d日', $time); //一年内
            break;
        default:
            $text = date('Y年m月d日', $time); //一年以前
            break;
    }

    return $text;
}
