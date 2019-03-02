<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <title>{$freecms.title}</title>
    <meta name="description" content="{$freecms.description}"/>
    <meta name="keywords" content="{$freecms.keywords}"/>
</head>

<body>
<h1>栏目：{$freecms.typename}</h1>
<div class="clearfix">
    <div class="cleft">
        {channel id="arctype" pid="{$freecms.id}"}
            <div id="newslist" style="width:668px">
                <div class="title clearfix"><span><a href="{$arctype.typeurl}">{$arctype.id},{$arctype.typename}</a></span><a
                            class="more" href="{$arctype.typeurl}" rel="nofollow">更多>></a></div>
                <ul>
                    {arclist id="vo" key="k" typeid="{$arctype.id}" getall="1"  channel="{$arctype.channel}"}
                        <li>·<a href="{$vo.arcurl}" target="_blank"
                                title="{$vo.title}">{$vo.title}</a><span>{$vo.pubtime|date_format:'%Y-%m-%d %H:%M:%S'}</span>
                        </li>
                    {/arclist}
                </ul>
            </div>
        {/channel}
    </div>
</div>
</body>
</html>