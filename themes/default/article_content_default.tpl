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
{include file='top.tpl'}
<h1>{$freecms.title}</h1>
<div class="clearfix">
    <div class="cleft">
        <div id="article">
            <h1 style="font-size: 24px;">{$myfcms.title}</h1>
            <div class="info">
                <div class="infoleft">
                    {$freecms.pubtime|date_format:'%Y-%m-%d %H:%M'}<br/>
                    来源：{$freecms.source}<br/>
                    作者：{$freecms.writer}
                </div>
                <div class="inforight clearfix">
                    <span class="l">浏览：<script src="{$myf_path}/archives/click/{$freecms.enId}"
                                               type="text/javascript" language="javascript"></script>次</span>
                </div>
            </div>
            <div class="line"></div>
            <div id="content">
                {$freecms.body}
                <p>
                    转载请注明来源：{$freecms.fullurl}
                </p>
            </div>
        </div>
        <div class="sectioncenter">

        </div>
        <div id="comment">
            <!-- Duoshuo Comment BEGIN -->
            <div class="ds-thread"></div>
            <!-- Duoshuo Comment END -->
        </div>
    </div>
</div>

<h3>评论</h3>
<div>
<ul>
    {feedback id='fd' pagesize='2'}
        <li>
            <p>昵称：{$fd.uname|escape:'html'}</p>
            <p>时间：{$fd.dtime}</p>
            <p>内容:{$fd.content|escape:'html'}</p>
        </li>
    {/feedback}
</ul>
    <div id="pager" class="clearfix">
        {feedbackpagination pagesize="2"}
    </div>
</div>
<div>
    <input type="hidden" id="hideGdUrl" value="{$myf_path}/archives/#type#/{$freecms.enId}">
    好评数：<a href="javascript:gbpost(1)" id="aGood">{$freecms.goodpost}</a><br/>
    差评数：<a href="javascript:gbpost(0)" id="aBad">{$freecms.badpost}</a><br/>
</div>
<div>
    <form id="feedbackForm" autocomplete="off">
        <input type="hidden" id="feedbackUrl" value="{$myf_path}/archives/feedback/{$freecms.enId}">
        <p><textarea style="width:300px;" name="feedback" rows="5" id="txtFeedback"></textarea></p>
        <p>
                <input type="text" name="vcode" id="txtVcode" maxlength="4" class="form-control form-control-lg" placeholder="验证码" required />
                <img id="vdimgck" onclick="changeAuthCode()" style="cursor: pointer;border:1px solid #d3d8de" alt="验证码"
                     title="看不清？点击更换" src="{$myf_path}/captcha?w=80&h=30&s=16" align="absmiddle">
        </p>
        <input type="button" id="btnFeedback" value="发布评论">
    </form>
</div>
<script type="text/javascript" src="{$cms_theme_path}/public/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
    $("#btnFeedback").click(function () {
        var url = $("#feedbackUrl").val();
        $.post(url, serializeObject($("#feedbackForm")), function (result) {
            //成功
            if (result.status == 0) {
                window.location.reload();
            } else {
                alert(result.errmsg);
            }
        }, 'json');
    })

    function gbpost(type) {
        var url = $("#hideGdUrl").val();
        var btnId ;
        if(type==1){
            url = url.replace('#type#','good');
            btnId = 'aGood';
        }else{
            url = url.replace('#type#','bad');
            btnId = 'aBad';
        }
        $.post(url,function (result) {
            //成功
            if (result.status == 0) {
                $("#"+btnId).html(result.data);
            } else {
                alert(result.errmsg);
            }
        }, 'json');
    }

    function serializeObject(form) {
        var o = {
        };
        $.each(form.serializeArray(), function (index) {
            if (this['value'] != undefined && this['value'].length > 0) {
                // 如果表单项的值非空，才进行序列化操作
                if (o[this['name']]) {
                    o[this['name']] = o[this['name']] + "," + this['value'];
                } else {
                    o[this['name']] = this['value'];
                }
            }
        });
        return o;
    }

    function changeAuthCode() {
        var picsrc = $("#vdimgck").attr("src");
        $("#vdimgck").attr("src", picsrc);
        $("#txtVcode").val('');
    }
</script>
</body>
</html>