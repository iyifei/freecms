        {include file="top.html"}
            <div class="clearfix">
                <div class="cleft">
                    <div id="article">
                        <h1 style="font-size: 24px;">{$myfcms.title}</h1>
                        <div class="line"></div>
                        <div id="content">
                            {$myfcms.body}
                        </div>
                    </div>
                </div>
                <div class="cright">
                	<div class="ritem">
            			<h3 class="title">
            				导航
            			</h3>
			            <ul class="b">
			            	  {single id="arc" flag="default"}
                            <li><a href="{$arc.arcurl}" target="_blank" title="{$arc.title}">{$arc.title}</a></li>
                            {/single}
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
        function doZoom(size){
            document.getElementById('content').style.fontSize=size+'px';
        }
        //除去内容中多余的p
        {/literal}
        </script>
         <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=460351" ></script>
        <script type="text/javascript" id="bdshell_js"></script>
        <script type="text/javascript">
        document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
        </script>