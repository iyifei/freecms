<?php
/**
 * Class [ErrorCode]
 * 错误码
 * author minyifei
 * date 2019/2/22
 */

namespace FreeCMS\Common\Exception;

class ErrorCode
{

    //成功
    const SUCCESS = 0;

    //未知失败
    const FAIL = 1;

    //参数错误
    const PARAM_ERROR = 2;


    //注册的用户名已经存在
    const AUTH_REGISTER_USERNAME_EXIST = 1001;
    //注册的邮箱账号已经存在
    const AUTH_REGISTER_EMAIL_EXIST = 1002;
    //用户或密码错误
    const AUTH_LOGIN_ERROR = 1003;
    //权限
    const AUTHORITY = 1004;

}