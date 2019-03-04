<!-- begin theme-panel -->
<div class="theme-panel theme-panel-lg">
    <a href="javascript:;" data-click="theme-panel-expand" class="theme-collapse-btn"><i class="fa fa-cog"></i></a>
    <div class="theme-panel-content">
        <h5 class="m-t-0">系统样式</h5>
        <ul class="theme-list clearfix">
            <li><a href="javascript:;" class="bg-red" data-theme="red" data-theme-file="{$myf_path}/statics/admin/css/default/theme/red.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="红色">&nbsp;</a></li>
            <li><a href="javascript:;" class="bg-pink" data-theme="pink" data-theme-file="{$myf_path}/statics/admin/css/default/theme/pink.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="粉色">&nbsp;</a></li>
            <li><a href="javascript:;" class="bg-orange" data-theme="orange" data-theme-file="{$myf_path}/statics/admin/css/default/theme/orange.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="橘色">&nbsp;</a></li>
            <li><a href="javascript:;" class="bg-yellow" data-theme="yellow" data-theme-file="{$myf_path}/statics/admin/css/default/theme/yellow.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="黄色">&nbsp;</a></li>
            <li><a href="javascript:;" class="bg-lime" data-theme="lime" data-theme-file="{$myf_path}/statics/admin/css/default/theme/lime.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="浅绿色">&nbsp;</a></li>
            <li><a href="javascript:;" class="bg-green" data-theme="green" data-theme-file="{$myf_path}/statics/admin/css/default/theme/green.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="绿色">&nbsp;</a></li>
            <li><a href="javascript:;" class="bg-teal" data-theme="default" data-theme-file="{$myf_path}/statics/admin/css/default/theme/default.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="默认">&nbsp;</a></li>
            <li><a href="javascript:;" class="bg-aqua" data-theme="aqua" data-theme-file="{$myf_path}/statics/admin/css/default/theme/aqua.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="水绿色">&nbsp;</a></li>
            <li><a href="javascript:;" class="bg-blue" data-theme="blue" data-theme-file="{$myf_path}/statics/admin/css/default/theme/blue.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="蓝色">&nbsp;</a></li>
            <li><a href="javascript:;" class="bg-purple" data-theme="purple" data-theme-file="{$myf_path}/statics/admin/css/default/theme/purple.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="紫色">&nbsp;</a></li>
            <li><a href="javascript:;" class="bg-indigo" data-theme="indigo" data-theme-file="{$myf_path}/statics/admin/css/default/theme/indigo.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="靛蓝">&nbsp;</a></li>
            <li><a href="javascript:;" class="bg-black" data-theme="black" data-theme-file="{$myf_path}/statics/admin/css/default/theme/black.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="黑色">&nbsp;</a></li>
        </ul>
        <div class="divider"></div>
        <div class="row m-t-10">
            <div class="col-md-6 control-label text-inverse f-w-600">顶部样式</div>
            <div class="col-md-6">
                <select name="header-styling" class="form-control form-control-sm">
                    <option value="1">默认</option>
                    <option value="2">相反</option>
                </select>
            </div>
        </div>
        <div class="row m-t-10" style="display: none">
            <div class="col-md-6 control-label text-inverse f-w-600">顶部</div>
            <div class="col-md-6">
                <select name="header-fixed" class="form-control form-control-sm">
                    <option value="1">固定</option>
                    <option value="2">默认</option>
                </select>
            </div>
        </div>
        <div class="row m-t-10">
            <div class="col-md-6 control-label text-inverse f-w-600">侧边栏样式</div>
            <div class="col-md-6">
                <select name="sidebar-styling" class="form-control form-control-sm">
                    <option value="1">默认</option>
                    <option value="2">表格</option>
                </select>
            </div>
        </div>
        <div class="row m-t-10">
            <div class="col-md-6 control-label text-inverse f-w-600">侧边栏</div>
            <div class="col-md-6">
                <select name="sidebar-fixed" class="form-control form-control-sm">
                    <option value="1">固定</option>
                    <option value="2">默认</option>
                </select>
            </div>
        </div>
        <div class="row m-t-10">
            <div class="col-md-6 control-label text-inverse f-w-600">边栏渐变</div>
            <div class="col-md-6">
                <select name="content-gradient" class="form-control form-control-sm">
                    <option value="1">关闭</option>
                    <option value="2">开启</option>
                </select>
            </div>
        </div>
        <div class="row m-t-10">
            <div class="col-md-6 control-label text-inverse f-w-600">内容样式</div>
            <div class="col-md-6">
                <select name="content-styling" class="form-control form-control-sm">
                    <option value="1">默认</option>
                    <option value="2">黑色</option>
                </select>
            </div>
        </div>
        <div class="divider"></div>
        <div class="row m-t-10">
            <div class="col-md-12">
                <a href="javascript:;" class="btn btn-inverse btn-block btn-rounded" data-click="reset-local-storage"><b>重置本地缓存</b></a>
            </div>
        </div>
    </div>
</div>
<!-- end theme-panel -->