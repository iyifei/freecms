<?php
/**
 * Class [${NAME}]
 * 云存储配置
 * author minyifei
 * date 2019/2/28
 */


return [
    'adapter'=>[
        //本机存储
        'class'=>\FreeCMS\Storage\Adapter\LocalAdapter::class,
        'param' => [
            'root'=>SYS_PATH.'/uploads',
            'domain'=>getCurrentDomain().'/uploads',
        ],
    ],
];