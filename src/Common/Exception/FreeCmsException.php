<?php
/**
 * Class [FreeCmsException]
 * 异常类
 * author minyifei
 * date 2019/2/22
 */

namespace FreeCMS\Common\Exception;


class FreeCmsException extends \RuntimeException
{

    public function __construct(
        $message = "", $code = 0, $previous = null
    )
    {
        parent::__construct($message, $code, $previous);
    }

    public static function throwException($e)
    {
        self::throwExp($e->getCode(), $e->getMessage());
    }

    /**
     * 抛出异常
     *
     * @param        $code
     * @param string $msg
     *
     * @throws MyfException
     */
    public static function throwExp($code, $msg = '')
    {
        throw new self($msg, $code);
    }


    public static function throwExpMsg( $msg = '')
    {
        throw new self($msg, ErrorCode::FAIL);
    }


    /**
     * 抛出参数错误异常
     *
     * @param $msg
     */
    public static function throwParamExp($msg)
    {
        throw new self($msg, ErrorCode::PARAM_ERROR);
    }

}