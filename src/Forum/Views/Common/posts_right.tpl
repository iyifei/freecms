<!-- begin panel-forum -->
<div class="panel panel-forum">
    <div class="panel-heading">
        <h4 class="panel-title">最新帖子</h4>
    </div>
    <!-- begin threads-list -->
    <ul class="threads-list">
        {subject id="arc" columnId="{$data.id}" limit="10" orderby="id"}
            <li>
                <h4 class="title"><a href="{$arc.linkurl}">{$arc.title}</a></h4>
                最后回帖 <a href="#">{$arc.lastMember.uname}</a> {$arc.lastTime}
            </li>
        {/subject}
    </ul>
    <!-- end threads-list -->
</div>
<!-- end panel-forum -->