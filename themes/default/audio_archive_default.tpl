        {include file="top.html"}
            <div class="clearfix">
                <div class="cleft">
                    <div id="article">
                        <h1 style="font-size: 24px;">{$myfcms.title}</h1>
                        <div class="info">
                        	<div class="infoleft">
            					{$myfcms.pubtime|date_format:'%Y-%m-%d %H:%M'}<br/>
            					来源：{$myfcms.source|default:"myfcms"}
            				</div>
            				<div class="inforight clearfix">
            					<span class="l">浏览：<script src="{$myf_path}/index.php?a=click&id={$myfcms.id}" type="text/javascript" language="javascript"></script>次</span>
            					<div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare r">
									<span class="bds_more">分享到：</span>
									<a class="bds_qzone"></a>
									<a class="bds_tsina"></a>
									<a class="bds_tqq"></a>
									<a class="bds_renren"></a>
									<a class="bds_t163"></a>
								</div>
            				</div>
                        </div>
                        <div class="line"></div>
                        <div id="content">
                        	<div class="con-images">
                        		<ul>
                        			{foreach from=$myfcms.images item=vo}
                        			<li>
                        				<img src="{$vo.url}" title="{$vo.text}" /><br/>
                        				{$vo.text}
                        			</li>
                        			{/foreach}
                        		</ul>
                        	</div>	
                            {$myfcms.body}
                            <p>
                            	转载请注明来源：{$myfcms.fullurl}
                            </p>
                        </div>
                        <div>
                            <div id="sns">
                            	<div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare">
	                                <span class="bds_more">分享到：</span>
	                                <a class="bds_qzone"></a>
	                                <a class="bds_tsina"></a>
	                                <a class="bds_tqq"></a>
	                                <a class="bds_renren"></a>
	                                <a class="bds_t163"></a>
                                </div>
                            </div>
                            <dl id="correlation">
                                <dt>相关文章</dt>
                                {arclist id="arc" limit="3" order="rand()" }
                                <dd><a href="{$arc.arcurl}" target="_blank">{$arc.title}</a>　{$arc.pubtime|date_format:'%Y.%m.%d'}</dd>
                                {/arclist}
                            </dl>
                        </div>
                    </div>
                    <div class="sectioncenter">
                        
                    </div>
                    <div id="comment">
                        <!-- Duoshuo Comment BEGIN -->
                        <div class="ds-thread"></div>
                        <!-- Duoshuo Comment END -->
                    </div>
                    <div class="pnews">
                        <h3>
                            图文推荐
                        </h3>
                        <ul class="clearfix">
                            {arclist id="arc" limit="8" flag="p" }
                            <li><a href="{$arc.arcurl}" title="{$arc.title}" target="_blank"><i style="width: 150px; height: 110px; overflow: hidden;"><img src="{$arc.litpic|default:"$myf_path/public/images/nopic.jpg"}" alt="{$arc.title}" width="150" height="110"></i><b>{$arc.title}</b></a></li>
                            {/arclist}
                        </ul>
                    </div>
                </div>
                <div class="cright">
                    <div class="ritem">
                        <h3 class="title">
                            最新资讯
                        </h3>
                        <ul class="t clearfix">
                            {arclist id="arc" limit="2" flag="p" }
                            <li><a href="{$arc.arcurl}" target="_blank" title="{$arc.title}"><i style="width: 124px; height: 92px; overflow: hidden;"><img src="{$arc.litpic|default:"$myf_path/public/images/nopic.jpg"}"  width="124" height="92" alt="{$arc.title}"></i><b>{$arc.title}</b></a></li>
                            {/arclist}
                        </ul>
                        <ul class="b">
                            {arclist id="arc" limit="5" }
                            <li><a href="{$arc.arcurl}" target="_blank" title="{$arc.title}">{$arc.title}</a></li>
                            {/arclist}
                        </ul>
                    </div>
                    <div>
                    </div>
                    <div class="ritem">
                        <h3 class="title">
                            热点新闻
                        </h3>
                        <ul class="hnews">
                            {arclist id="arc" limit="10" order="click desc" }
                            <li><a href="{$arc.arcurl}" target="_blank" title="{$arc.title}">{$arc.title}</a></li>
                            {/arclist}
                        </ul>
                    </div>
                    <div>
                    </div>
                    <div class="ritem">
                        <h3 class="title">
                            推荐新闻
                        </h3>
                        <ul class="t clearfix">
                            {arclist id="arc" limit="2" flag="a" }
                            <li><a href="{$arc.arcurl}" target="_blank" title="{$arc.title}"><i style="width: 124px; height: 92px; overflow: hidden;"><img src="{$arc.litpic|default:"$myf_path/public/images/nopic.jpg"}"  width="124" height="92" alt="{$arc.title}"></i><b>{$arc.title}</b></a></li>
                            {/arclist}
                        </ul>
                        <ul class="b">
                            {arclist id="arc" limit="5" flag="c" }
                            <li><a href="{$arc.arcurl}" target="_blank" title="{$arc.title}">{$arc.title}</a></li>
                            {/arclist}
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        {include file="bottom.html"}
        <script src="{$myf_theme_path}/public/js/jquery-1.8.1.min.js"></script>
        <script type="text/javascript">
        {literal}
        //返回顶部
        (function() {
            var context = $("#content");
            var conPosition = context.position();
            var $backToTopTxt = "返回顶部", $backToTopEle = $('<div class="backToTop"></div>').appendTo($("body"))
                .text($backToTopTxt).attr("title", $backToTopTxt).click(function() {
                    $("html, body").animate({ scrollTop: 0 }, 120);
            }), $backToTopFun = function() {
                var st = $(document).scrollTop(), winh = $(window).height();
                (st > 0)? $backToTopEle.show(): $backToTopEle.hide();    
                //IE6下的定位
                if (!window.XMLHttpRequest) {
                    $backToTopEle.css("top", st + winh - 166);    
                }
            };
            $(window).bind("scroll", $backToTopFun);
            $(function() { $backToTopFun(); });
            $(".backToTop").css("left",conPosition.left+658);
        })();
        //多说评论
        var duoshuoQuery = {short_name:"myfcms"};
            (function() {
                var ds = document.createElement('script');
                ds.type = 'text/javascript';ds.async = true;
                ds.src = 'http://static.duoshuo.com/embed.js';
                ds.charset = 'UTF-8';
                (document.getElementsByTagName('head')[0] 
                || document.getElementsByTagName('body')[0]).appendChild(ds);
        })();
        function doZoom(size){
            document.getElementById('content').style.fontSize=size+'px';
        }
        //除去内容中多余的p
         $(document).ready(function(){
            $("#content p").each(function(i){
                var content = $.trim($(this).html());
                if(content=="<br>"){
                    $(this).remove();
                }else{
                    var img = $(this).children("img");
                    if(img.size()>0){
                        $(this).css("text-indent","0");
                        var myImage = new Image();
                        myImage.src = img.attr("src");
                        myImage.onload = function(){
                            if(myImage.width>500){
                               img.css("width","500px");
                            }
                        };
                    }
                }
                
                $("#test").html($(this).html());
            });
        });
        {/literal}
        </script>
         <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=460351" ></script>
        <script type="text/javascript" id="bdshell_js"></script>
        <script type="text/javascript">
        document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
        </script>