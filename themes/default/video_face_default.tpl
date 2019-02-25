        {include file="top.html"}
            <div class="clearfix">
            	<div class="cleft">
            		{channel id="type" pid=$myfcms.id}
            		<div class="pnews">
            			<h3>
            				<a href="{$type.typeurl}">{$type.typename}</a>
            			</h3>
            			<ul class="clearfix">
            				{arclist limit="8" typeid={$type.id} id="arc" channeltype="image"}
							<li><a href="{$arc.arcurl}" title="{$arc.title}" target="_blank"><i style="width: 150px; height: 110px; overflow: hidden;"><img src="{$arc.litpic|default:"$myf_theme_path/public/images/nopic.jpg"}" alt="{$arc.title}" width="150" height="110"></i><b>{$arc.title}</b></a></li>
							{/arclist}
		       		    </ul>
            		</div>
            		{/channel}
            		<div class="sectioncenter">
            		</div>
            	</div>
            	<div class="cright">
            		<div class="ritem">
            			<h3 class="title">
            				最新资讯
            			</h3>
            			<ul class="t clearfix">
            				{arclist id="arc" limit="2" flag="p"}
							<li><a href="{$arc.arcurl}" target="_blank" title="{$arc.title}"><i style="width: 124px; height: 92px; overflow: hidden;"><img src="{$arc.litpic|default:"$myf_theme_path/public/images/nopic.jpg"}"  width="124" height="92" alt="{$arc.title}"></i><b>{$arc.title}</b></a></li>
							{/arclist}
			            </ul>
			            <ul class="b">
			            	{arclist id="arc" limit="5" index="1"}
							<li><a href="{$arc.arcurl}" target="_blank" title="{$arc.title}">{$arc.title}</a></li>
							{/arclist}
			            </ul>
            		</div>
            		<div class="ritem">
            			<h3 class="title">
            				热点新闻
            			</h3>
            			<ul class="hnews">
            				{arclist id="arc" limit="10" order="click desc"}
							<li><a href="{$arc.arcurl}" target="_blank" title="{$arc.title}">{$arc.title}</a></li>
							{/arclist}
            			</ul>
            		</div>
            	</div>
            </div>
        </div>
       {include file="bottom.html"}