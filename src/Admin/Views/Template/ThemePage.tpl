<style>
    @media (min-width:1024px) {
        .result-list li.item-list .result-info{
            width:60%;
        }
    }
</style>

<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">模板</li>
    <li class="breadcrumb-item active">主题管理</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    主题管理
</h1>
<!-- end page-header -->

<!-- begin row -->
<div class="row">
    <!-- begin col-12 -->
    <div class="col-md-12">
        <!-- begin result-container -->
        <div class="result-container">
            <div class="btn-group m-l-10 m-b-20">
                <a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-buttons"
                   data-href="{$myf_path}/admin/template/theme/edit?method=add"
                   href="javascript:openModel('btnAddTheme')"
                   data-title="创建新主题"
                   id="btnAddTheme"
                ><span>创建新主题</span></a>
                <a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-buttons"
                   id="btnImportTheme"
                   href="javascript:doUploadFile('zip');"
                ><span>上传导入主题</span></a>
            </div>

            <!-- begin result-list -->
            <ul class="result-list">
                {foreach from=$datas item=vo}
                <li class="item-list">
                    <a href="javascript:;" class="result-image" style="background-image: url({$vo.screenshot});"></a>
                    <div class="result-info">
                        <h4 class="title"><a href="javascript:;">{$vo.name|escape:'html'}</a></h4>
                        <ul class="p-t-10">
                            <li>更新时间:{$vo.updatetime|escape:'html'}</li>
                            <li>作者:{$vo.author|escape:'html'}</li>
                            <li>颜色:{$vo.color|escape:'html'}</li>
                            <li>目录:{$vo.themePath}</li>
                        </ul>
                        <p class="desc p-t-10 " style="max-height:50px;">
                            {$vo.description|escape:'html'}
                        </p>
                        <div class="btn-row">
                            <a data-href="{$myf_path}/admin/template/theme/edit?theme={$vo.theme}&method=update"
                               href="javascript:openModel('btnEdit_{$vo.theme}')"
                               data-title="编辑主题"
                               id="btnEdit_{$vo.theme}"
                               title="编辑主题" data-container="body"><i class="fas fa-pencil-alt"></i></a>
                            <a href="{$vo.web|escape:'html'}" target="_blank" title="官方网站" data-toggle="tooltip" data-container="body" data-title="Analytics"><i class="fas fa-home"></i></a>
                            <a href="https://bbs.freecms.com.cn" target="_blank" title="论坛交流" data-toggle="tooltip" data-container="body" data-title="Tasks"><i class="fas fa-comments"></i></a>
                        </div>
                    </div>
                    <div class="result-price">
                            {$vo.version|escape:'html'}
                        <p>
                            {if $vo.theme eq $currTheme}
                                <span class="label label-green" style="font-size:14px;">使用中</span><br/>
                                <a href="{$myf_path}/admin/template/theme/export?theme={$vo.theme}" target="_blank" class="btn btn-indigo">导出</a>
                            {else}
                                <a href="javascript:operateTheme('{$vo.theme}','use');" class="btn btn-primary">使用</a>
                                <a href="{$myf_path}/admin/template/theme/export?theme={$vo.theme}" target="_blank" class="btn btn-indigo">导出</a>
                                <a href="javascript:operateTheme('{$vo.theme}','uninstall');" class="btn btn-danger">卸载</a>
                            {/if}
                        </p>
                    </div>
                </li>
                {/foreach}
            </ul>
            <!-- end result-list -->
        </div>
        <!-- end result-container -->
    </div>
    <!-- end col-12 -->
</div>
<!-- end row -->

<input type="hidden" id="operateUrl" value="{$myf_path}/admin/template/theme/operate">

<script type="text/javascript">

    function operateTheme(theme,type) {
        var url = $("#operateUrl").val();
        var data =  {
            theme:theme,
            type:type
        };
        FreeCms.confirm("确定要进行此操作吗？",function () {
            $.post(url, data, function (result) {
                //成功
                if (result.status == 0) {
                    FreeCms.success('操作执行成功',function () {
                        window.location.hash = '#!template/theme?'+Date.parse(new Date());
                    },3000);
                } else {
                    FreeCms.error(result.errmsg);
                }
            }, 'json');
        })
    }

    function uploadCallback(data) {
        console.log(data);
        successCallback();
    }

</script>

