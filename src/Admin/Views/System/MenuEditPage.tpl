<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
   {include file="../Common/Head.tpl"}
</head>
<body style="background: none">
    <!-- begin #content -->
    <div class="content-full-width">
        <!-- begin row -->
        <div class="row">
            <!-- begin col-12 -->
            <div class="col-lg-12">
                <form autocomplete="off">
                    <input type="hidden" name="id" value="{$data.id}">
                    <input type="hidden" name="method" value="{$method}" />
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>父级菜单</label>
                        <div class="col-md-9">
                            <select name="pid" class="form-control">
                                <option value="0">顶级菜单</option>
                                {foreach from=$menus item=vo}
                                <option value="{$vo.id}" {if $vo.id eq $pid}selected="selected"{/if}>&emsp;{$vo.spacer}{$vo.name}</option>
                                {/foreach}
                            </select>
                            <small class="f-s-12 text-grey-darker">选择上级菜单</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>菜单名称</label>
                        <div class="col-md-9">
                            <input class="form-control" type="text" name="name" value="{$data.name}"/>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>访问地址</label>
                        <div class="col-md-9">
                            <input class="form-control" id="url" name="url" type="text" value="{$data.url}">
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3">图标</label>
                        <div class="col-md-9">
                            <div class="input-group">
                                <div class="input-group-prepend"><span id="iconContainer" style="padding: 6px 12px;padding-top:10px;font-size: 14px;background:#d3d8df;border-radius: 3px;" class="{$data.icon}"></span></div>
                                <input id="icon" name="icon" onblur="iconChange()"  class="form-control" type="text" value="{if $data}{$data.icon}{/if}"/>
                            </div>
                            <small class="f-s-12 text-grey-darker">支持的<a target="_blank" href="{$myf_path}/admin#!system/icon">图标列表</a> </small>
                            例如：<b>fas fa-home 代表</b><i class="fas fa-home"></i>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3">排序</label>
                        <div class="col-md-9">
                            <input id="sortrank" name="sortrank"  class="form-control" type="text" value="{if $data}{$data.sortrank}{else}50{/if}"/>
                            <small class="f-s-12 text-grey-darker">越小越靠前</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3">是否隐藏</label>
                        <div class="col-md-9">
                            <label>
                                <input type="checkbox" name="ishide" value="1" {if $data.ishide eq 1}checked="checked"{/if} >
                                是否隐藏
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <!-- end col-12 -->
        </div>
        <!-- end row -->
    </div>

    <input type="hidden" id="submitUrl" value="{$myf_path}/admin/system/menu/save">
    <!-- end #content -->
    <!-- end page container -->
    {include file="../Common/BaseJs.tpl"}

    <script>
        function submitForm() {
            FreeCms.doEditSubmit();
        }

        function callbackSaveSuccess() {
            window.parent.successCallback();
        }

        function iconChange() {
            var fa = $("#icon").val();
            $("#iconContainer").addClass(fa);
        }
    </script>
</body>
</html>
