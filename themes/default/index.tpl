<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <title>{global name="cfg_webname"}</title>
    <meta name="description" content="{global name='cfg_description'}"/>
    <meta name="keywords" content="{global name='cfg_keywords'}"/>
    <link rel="shortcut icon" href="/favicon.ico"/>
</head>

<body>
{include file='top.tpl'}

<h1>首页</h1>
<ul>
    {channel id="arctype"}
        <li>
            <a href="{$arctype.typeurl}">{$arctype.id},{$arctype.typename}</a>
            <ul>
                {channel pid="{$arctype.id}" id="child"}
                    <li><a href="{$child.typeurl}">{$child.id},{$child.typename}</a></li>
                    <h5>>>对应文章</h5>
                    <ul>
                        {arclist typeid="{$child.id}" channel="{$child.channel}"}
                            <li><a href='{$arc.arcurl}'>{$arc.title}</a></li>
                        {/arclist}
                    </ul>
                {/channel}
            </ul>
        </li>
    {/channel}
</ul>

<h3>单页</h3>
{single id='page'}
    <li><a target="_blank" href="{$page.pageurl}">{$page.title}</a> </li>
{/single}

<h3>搜索</h3>
<form>
    <input type="text" name="keyword" autocomplete="off" id="txtSearchKey"> <input type="button" id="btnSearch" value="搜索">
</form>
<script type="text/javascript" src="{$cms_theme_path}/public/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
    $("#btnSearch").click(function () {
        var keyword = $("#txtSearchKey").val();
        if(keyword!=''){
            var url  = "{$myf_path}/search?keyword="+keyword;
            window.location.href = url;
        }
    })
</script>
</body>
</html>