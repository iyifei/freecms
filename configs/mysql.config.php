<?php
/**
 * mysql配置文件
 * Author: 闵益飞
 * Date: 2018/5/23
 */
$host = 'localhost';
$port = "3306";
$pwd = 'minyifei.cn';
$user = 'root';
return [
    'database' => array(
        'freecms' => array(
            'host' => $host,
            'port' => $port,
            'user' => $user,
            'password' => $pwd,
            'database' => 'freecms',
            'charset' => 'utf8',
            'prefix' => ''
        ),
    ),
    'default'=>'freecms',
];