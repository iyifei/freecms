<?php
/**
 * Class [Http]
 * 请求类
 * author minyifei
 * date 2018/11/16
 */

namespace  FreeCMS\Common\Libs;


class Http
{

    /**
     * Function:get
     * GET请求
     *
     * @param String $url     请求地址
     * @param array  $params  参数
     * @param array  $headers header扩展信息
     *
     * @return string
     */
    public static function get($url, $params = array(), $headers = array())
    {
        return self::request($url, $params, "GET", $headers, false);
    }

    /**
     * Function:post
     * POST请求
     *
     * @param string $url     请求地址
     * @param array  $params  参数
     * @param array  $headers header扩展信息
     * @param array  $multi   文件
     *
     * @return string
     */
    public static function post(
        $url, $params = array(), $headers = array(), $multi = false
    )
    {
        return self::request($url, $params, "POST", $headers, $multi);
    }

    /**
     * 发起一个HTTP/HTTPS的请求
     *
     * @param string    $url     接口的URL
     * @param  array    $params  接口参数   array('content'=>'test', 'format'=>'json');
     * @param    string $method  请求类型，GET|POST|JSON|DELETE
     * @param     array $headers 扩展的包头信息
     * @param     array $multi   图片信息
     *
     * @return string
     */
    public static function request(
        $url, $params = array(), $method = 'GET', $headers = array(),
        $multi = false
    )
    {
        if (!function_exists('curl_init')) {
            exit('Need to open the curl extension');
        }
        try {
            $httpStartTime = getMillisecond();
            $method = strtoupper($method);
            $ci = curl_init();
            curl_setopt($ci, CURLOPT_USERAGENT, 'php client');
            curl_setopt($ci, CURLOPT_CONNECTTIMEOUT, 10);
            curl_setopt($ci, CURLOPT_TIMEOUT, 10);
            curl_setopt($ci, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ci, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ci, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($ci, CURLOPT_HEADER, false);
            switch ($method) {
                case 'POST':
                    curl_setopt($ci, CURLOPT_POST, true);
                    if ($multi) {
                        foreach ($multi as $key => $file) {
                            //php5.6需要用curl_file_create不能用@
                            $params[$key] = curl_file_create($file);
                        }
                        curl_setopt($ci, CURLOPT_POSTFIELDS, $params);
                        $headers[] = 'Expect: ';
                    } else {
                        if (!empty($params)) {
                            curl_setopt(
                                $ci, CURLOPT_POSTFIELDS,
                                http_build_query($params)
                            );
                        }
                    }
                    break;
                case 'DELETE':
                case 'GET':
                    $method == 'DELETE'
                    && curl_setopt(
                        $ci, CURLOPT_CUSTOMREQUEST, 'DELETE'
                    );
                    if (!empty($params)) {
                        $url = $url . (strpos($url, '?') ? '&' : '?')
                            . (is_array($params) ? http_build_query($params)
                                : $params);
                    }
                    break;
                case 'JSON':
                    if (!empty($params)) {
                        $data = json_encode($params);
                        curl_setopt($ci, CURLOPT_POSTFIELDS, $data);
                        curl_setopt(
                            $ci, CURLOPT_HTTPHEADER, array(
                                'Content-Type: application/json',
                                'Content-Length: ' . strlen($data)
                            )
                        );
                        curl_setopt($ci, CURLOPT_CUSTOMREQUEST, "POST");
                    }
                    break;
            }
            curl_setopt($ci, CURLINFO_HEADER_OUT, true);
            curl_setopt($ci, CURLOPT_URL, $url);
            if ($headers) {
                curl_setopt($ci, CURLOPT_HTTPHEADER, $headers);
            }
            $response = curl_exec($ci);
            curl_close($ci);
            $httpEndTime = getMillisecond();
            $msg = ['msg'=>sprintf(
                "HTTP COSTTIME=【%s】ms, URL=【%s】,RESPONSE=【%s】",
                ($httpEndTime - $httpStartTime), $url, $response
            )];
            Logger::debug(
                'http',$msg
            );
            return $response;
        } catch (\Exception $ex) {
            $msg = ['error'=>sprintf(
                "HTTP URL=【%s】,ERRORS=【%s】", $url, $ex->getMessage()
            )];
            Logger::debug(
                'http',
                $msg
            );
        }
    }

}