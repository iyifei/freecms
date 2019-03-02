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
<h1>{$freecms.title}</h1>
<div class="clearfix">
    <div class="cleft">
        <div id="article">
            <h1 style="font-size: 24px;">{$myfcms.title}</h1>
            <div class="info">
                <div class="infoleft">
                    {$freecms.pubtime|date_format:'%Y-%m-%d %H:%M'}<br/>
                </div>
            </div>
            <div class="line"></div>
            <div id="content">
                <img src="{$freecms.imgurl}?thumbnail=h-300">
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
</body>
</html>