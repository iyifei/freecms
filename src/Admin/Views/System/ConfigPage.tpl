<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">站点</li>
    <li class="breadcrumb-item">栏目管理</li>
    <li class="breadcrumb-item active">
        基本参数
    </li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    基本参数
</h1>


<!-- begin row -->
<div class="row">
    <!-- begin col-6 -->
    <div class="col-lg-6">
        <!-- begin panel -->
        <div class="panel panel-inverse" data-sortable-id="index-1">
            <!-- begin panel-heading -->
            <div class="panel-heading">
                <div class="panel-heading-btn">
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                </div>
                <h4 class="panel-title">系统参数</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body p-30 ">
                <form autocomplete="off">

                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>网站名称</label>
                        <div class="col-md-9">
                            <input class="form-control value"  did="{$config.sys_cfg_webname.id}" tabindex="1" maxlength="60" id="sys_cfg_webname" name="sys_cfg_webname" type="text" size="15" value="{$config.sys_cfg_webname.value}" />
                            <small class="f-s-12 text-grey-darker">变量名：【sys_cfg_webname】网站名称不超过60字符</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">网站关键字</label>
                        <div class="col-md-9">
                            <input class="form-control value"  did="{$config.sys_cfg_keywords.id}" tabindex="2" maxlength="60" id="sys_cfg_keywords" name="sys_cfg_keywords" type="text" size="15" value="{$config.sys_cfg_keywords.value}" />
                            <small class="f-s-12 text-grey-darker">变量名：【sys_cfg_keywords】多个关键字用逗号隔开</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">网站描述</label>
                        <div class="col-md-9">
                            <textarea rows="4" class="form-control value" did="{$config.sys_cfg_description.id}" tabindex="3" maxlength="250" name="sys_cfg_description" id="sys_cfg_description">{$config.sys_cfg_description.value}</textarea>
                            <small class="f-s-12 text-grey-darker">变量名：【sys_cfg_description】描述不能超过250字</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">网站版权</label>
                        <div class="col-md-9">
                            <textarea rows="4" class="form-control value" did="{$config.sys_cfg_copyright.id}" tabindex="4"  name="sys_cfg_copyright" id="sys_cfg_copyright">{$config.sys_cfg_copyright.value}</textarea>
                            <small class="f-s-12 text-grey-darker">变量名：【sys_cfg_copyright】版权信息支持html和script语法</small>
                        </div>
                    </div>
                </form>
            </div>
            <!-- end panel-body -->

        </div>
        <!-- end panel -->

    </div>
    <!-- end col-6 -->
    <!-- begin col-6 -->
    <div class="col-lg-6">
        <!-- begin panel -->
        <div class="panel panel-inverse" data-sortable-id="index-1">
            <!-- begin panel-heading -->
            <div class="panel-heading">
                <div class="panel-heading-btn">
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                </div>
                <h4 class="panel-title">图片验证码</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body p-30 ">
                <form autocomplete="off">
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>验证码参数模式</label>
                        <div class="col-md-9">
                            <input type="hidden"  id="vcodeMode" class="value" name="sys_cfg_vcode_mode" did="{$config.sys_cfg_vcode_mode.id}" value="{$config.sys_cfg_vcode_mode.value}">
                            <label>
                                <input type="radio" name="vcodeMode" value="1" {if $config.sys_cfg_vcode_mode.value eq '1'}checked="checked"{/if}>
                                开启
                            </label>
                            <label>
                                <input type="radio" name="vcodeMode" value="0" {if $config.sys_cfg_vcode_mode.value eq '0'}checked="checked"{/if}>
                                关闭
                            </label>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>验证码生成类型</label>
                        <div class="col-md-9">

                            <input type="hidden"  id="vcodeType" class="value" name="sys_cfg_vcode_type" did="{$config.sys_cfg_vcode_type.id}" value="{$config.sys_cfg_vcode_type.value}">
                            <label>
                                <input type="radio" name="vcodeType" value="number" {if $config.sys_cfg_vcode_type.value eq 'number'}checked="checked"{/if}>
                                数字
                            </label>
                            <label>
                                <input type="radio" name="vcodeType" value="english" {if $config.sys_cfg_vcode_type.value eq 'english'}checked="checked"{/if}>
                                英文
                            </label>
                            <label>
                                <input type="radio" name="vcodeType" value="blend" {if $config.sys_cfg_vcode_type.value eq 'blend'}checked="checked"{/if}>
                                混合
                            </label>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">验证码字符数</label>
                        <div class="col-md-9">
                            <input class="form-control value"  did="{$config.sys_cfg_vcode_len.id}" tabindex="2" maxlength="60" id="sys_cfg_vcode_len" name="sys_cfg_vcode_len" type="text" size="15" value="{$config.sys_cfg_vcode_len.value}" />
                            <small class="f-s-12 text-grey-darker">2-8位</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">验证码图片大小</label>
                        <div class="col-md-4">
                            <input type="hidden" id="vcodeSize" class="value" name="sys_cfg_vcode_size" did="{$config.sys_cfg_vcode_size.id}" value="{$config.sys_cfg_vcode_size.value}">
                            长：<input class="form-control" name="vcodeSize" tabindex="2" maxlength="3" id="vcodeSizeWidth" size="15" value="" />
                            宽：<input class="form-control" name="vcodeSize" tabindex="2" maxlength="3" id="vcodeSizeHeight" size="15" value="" />
                            字体大小：<input class="form-control" name="vcodeSize" tabindex="2" maxlength="2" id="vcodeSizeFontsize" size="15" value="" />
                        </div>
                    </div>
                </form>
            </div>
            <!-- end panel-body -->

        </div>
        <!-- end panel -->

    </div>
    <!-- end col-6 -->
</div>
<!-- end row -->


<!-- begin row -->
<div class="row">

    <!-- begin col-6 -->
    <div class="col-lg-6">
        <!-- begin panel -->
        <div class="panel panel-inverse" data-sortable-id="index-1">
            <!-- begin panel-heading -->
            <div class="panel-heading">
                <div class="panel-heading-btn">
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                </div>
                <h4 class="panel-title">图片水印</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body p-30 ">
                <form autocomplete="off">
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>上传图片是否使用图片水印功能</label>
                        <div class="col-md-9">
                            <input type="hidden"  id="water" class="value" name="sys_cfg_water" did="{$config.sys_cfg_water.id}" value="{$config.sys_cfg_water.value}">
                            <label>
                                <input type="radio" name="water" value="1" {if $config.sys_cfg_water.value eq '1'}checked="checked"{/if}>
                                是
                            </label>
                            <label>
                                <input type="radio" name="water" value="0" {if $config.sys_cfg_water.value eq '0'}checked="checked"{/if}>
                                否
                            </label>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">选择水印的文件类型</label>
                        <div class="col-md-9">
                            <input type="hidden"  id="waterType" class="value" name="sys_cfg_water" did="{$config.sys_cfg_water_type.id}" value="{$config.sys_cfg_water_type.value}">
                            <label>
                                <input type="radio" name="waterType" value="image" {if $config.sys_cfg_water_type.value eq 'image'}checked="checked"{/if}>
                                图片
                            </label>
                            <label>
                                <input type="radio" name="waterType"  value="word"  {if $config.sys_cfg_water_type.value eq 'word'}checked="checked"{/if}>
                                文字
                            </label>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">添加水印的图片大小控制</label>
                        <div class="col-md-9">
                            <input type="hidden"  id="waterSize" class="value" name="sys_cfg_water_size" did="{$config.sys_cfg_water_size.id}" value="{$config.sys_cfg_water_size.value}">
                            长：<input class="form-control" tabindex="2" maxlength="3" name="waterSize" id="waterSizeWidth" size="15" value="" />
                            宽：<input class="form-control" tabindex="2" maxlength="3" name="waterSize" id="waterSizeHeight" size="15" value="" />
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">水印图片文字</label>
                        <div class="col-md-9">
                            <input class="form-control value"  did="{$config.sys_cfg_water_word.id}" name="sys_cfg_water_word" tabindex="2" maxlength="30" id="sys_cfg_water_word" size="15" value="{$config.sys_cfg_water_word.value}" />
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">水印图片文字的字体大小及颜色</label>
                        <div class="col-md-9">
                            <input type="hidden"  id="waterFont" class="value" name="sys_cfg_water_font" did="{$config.sys_cfg_water_font.id}" value="{$config.sys_cfg_water_font.value}">
                            字体大小(px)：<input class="form-control" tabindex="2" maxlength="2" name="waterFont" id="waterFontSize" size="15" value="" />
                            字体颜色：<input class="form-control" tabindex="2" maxlength="7" name="waterFont" id="waterFontColor" size="15" value="" />
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">水印图片文件</label>
                        <div class="col-md-9">
                            <div>
                                /statics/water/water.png
                            </div>
                            <small class="f-s-12 text-grey-darker">需要手动上传覆盖该文件,缩略图仅支持jpg、png格式，且大小不能超过1M</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">水印图片透明度</label>
                        <div class="col-md-9">
                            <input class="form-control value"  did="{$config.sys_cfg_water_alpha.id}" name="sys_cfg_water_alpha" tabindex="2" maxlength="2" id="sys_cfg_water_alpha" size="15" value="{$config.sys_cfg_water_alpha.value}" />
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">水印位置</label>
                        <div class="col-md-9">
                            <input type="hidden"  id="waterPos" class="value" name="sys_cfg_water_pos" did="{$config.sys_cfg_water_pos.id}" value="{$config.sys_cfg_water_pos.value}">
                            <table class="table table-bordered waterPos">
                                <tr>
                                    <td><label><input type="radio" value="top-left" {if $config.sys_cfg_water_pos.value eq 'top-left'}checked="checked"{/if} name="sys_cfg_water_pos">顶部居左</label></td>
                                    <td><label><input type="radio" value="top-center" {if $config.sys_cfg_water_pos.value eq 'top-center'}checked="checked"{/if} name="sys_cfg_water_pos">顶部居中</label></td>
                                    <td><label><input type="radio" value="top-right" {if $config.sys_cfg_water_pos.value eq 'top-right'}checked="checked"{/if} name="sys_cfg_water_pos">顶部居右</label></td>
                                </tr>
                                <tr>
                                    <td><label><input type="radio" value="center-left" {if $config.sys_cfg_water_pos.value eq 'center-left'}checked="checked"{/if} name="sys_cfg_water_pos">左边居中</label></td>
                                    <td><label><input type="radio" value="center" {if $config.sys_cfg_water_pos.value eq 'center'}checked="checked"{/if} name="sys_cfg_water_pos">图片中心</label></td>
                                    <td><label><input type="radio" value="center-right" {if $config.sys_cfg_water_pos.value eq 'center-right'}checked="checked"{/if} name="sys_cfg_water_pos">右边居中</label></td>
                                </tr>
                                <tr>
                                    <td><label><input type="radio" value="bottom-left" {if $config.sys_cfg_water_pos.value eq 'bottom-left'}checked="checked"{/if} name="sys_cfg_water_pos">底部居左</label></td>
                                    <td><label><input type="radio" value="bottom-center" {if $config.sys_cfg_water_pos.value eq 'bottom-center'}checked="checked"{/if} name="sys_cfg_water_pos">底部局中</label></td>
                                    <td><label><input type="radio" value="bottom-right" {if $config.sys_cfg_water_pos.value eq 'bottom-right'}checked="checked"{/if} name="sys_cfg_water_pos">底部居右</label></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
            <!-- end panel-body -->

        </div>
        <!-- end panel -->

    </div>
    <!-- end col-6 -->

    <!-- begin col-6 -->
    <div class="col-lg-6">
        <!-- begin panel -->
        <div class="panel panel-inverse" data-sortable-id="index-2">
            <!-- begin panel-heading -->
            <div class="panel-heading">
                <div class="panel-heading-btn">
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                </div>
                <h4 class="panel-title">自定义参数</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body p-30 ">
                <form autocomplete="off">
                    {foreach from=$userConfigs item=vo}
                        <div class="form-group row m-b-15">
                            <label class="col-sm-3 col-form-label text-right">{$vo.info|escape:'html'}：</label>
                            <div class="col-sm-9">
                                {if $vo.type eq 'text'}
                                    <textarea rows="5" class="form-control value" did="{$vo.id}" name="cfg_{$vo.id}" id="faq_content">{$vo.value}</textarea>
                                {else}
                                    <input class="form-control value" did="{$vo.id}"  name="cfg_{$vo.id}" type="text" size="15" value="{$vo.value}">
                                {/if}
                                <small class="f-s-12 text-blue-lighter">变量名：【{$vo.varname|escape:'html'}】</small><br/>
                                <small class="f-s-12 text-grey-darker">分组名：【{$vo.subgroup}】</small>
                            </div>
                        </div>
                    {/foreach}

                </form>
            </div>
            <!-- end panel-body -->
        </div>
        <!-- end panel -->

    </div>
    <!-- end col-6 -->
</div>
<!-- end row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel">
            <div class="panel-body text-right">
                <button type="button" onclick="FreeCms.batchSave('value');" class="btn btn-primary">确认保存</button>&nbsp;&nbsp;
                <a data-href="{$myf_path}/admin/system/config/edit?method=add"
                   href="javascript:openModel('btnAddConfig')"
                   data-title="添加配置"
                   id="btnAddConfig"
                   class="btn btn-purple">添加配置</a>
            </div>
        </div>
    </div>
</div>

<input type="hidden" id="saveUrl" value="{$myf_path}/admin/system/config/save">

<script type="text/javascript">

    FreeCms.initUploader('uploadFile');

    $(document).ready(function () {
        $("input[name='vcodeMode']").click(function () {
            $("#vcodeMode").val($(this).val());
        })
        $("input[name='vcodeExt']").click(function () {
            $("#vcodeExt").val($(this).val());
        })
        $("input[name='vcodeType']").click(function () {
            $("#vcodeType").val($(this).val());
        })
        $("input[name='water']").click(function () {
            $("#water").val($(this).val());
        })
        $("input[name='waterType']").click(function () {
            $("#waterType").val($(this).val());
        })
        $("input[name='vcodeSize']").blur(function () {
            var size = $("#vcodeSizeWidth").val() +","+ $("#vcodeSizeHeight").val()+","+$("#vcodeSizeFontsize").val();
            $("#vcodeSize").val(size);
        })

        var vcodeSize = $("#vcodeSize").val();
        var vs = vcodeSize.split(',');
        $("#vcodeSizeWidth").val(vs[0]);
        $("#vcodeSizeHeight").val(vs[1]);
        $("#vcodeSizeFontsize").val(vs[2]);


        var waterSize =  $("#waterSize").val();
        var waterSizeArr = waterSize.split(",");
        $("#waterSizeWidth").val(waterSizeArr[0]);
        $("#waterSizeHeight").val(waterSizeArr[1]);
        $("input[name='waterSize']").blur(function () {
            var size = $("#waterSizeWidth").val() +","+ $("#waterSizeHeight").val();
            $("#waterSize").val(size);
        })

        var waterFont =  $("#waterFont").val();
        var waterFontArr = waterFont.split(",");
        $("#waterFontSize").val(waterFontArr[0]);
        $("#waterFontColor").val(waterFontArr[1]);
        $("input[name='waterFont']").blur(function () {
            var size = $("#waterFontSize").val() +","+ $("#waterFontColor").val();
            $("#waterFont").val(size);
        })

        var waterType = $("#waterType").val();
        var waterTypeArr = waterType.split(",");
        for(var i=0;i<waterTypeArr.length;i++){
            if(waterTypeArr[i]=='jpg'){
                $("#waterTypeJpg").prop("checked", true);//or
            }
            if(waterTypeArr[i]=='png'){
                $("#waterTypePng").prop("checked", true);//or
            }
        }

        var waterPos = $("#waterPos").val();
        $(".waterPos input").each(function () {
            if($(this).val()==waterPos){
                $(this).prop("checked",true);
            }
        })
        $(".waterPos input").click(function () {
            $("#waterPos").val($(this).val());
        })
    });

    function callbackSaveSuccess() {
        FreeCms.callbackEditSaveSuccess();
    }

    function uploadCallback(data,btnId) {
        var src = data.url+"?thumbnail=h-90";
        $("#txtLitpic").val(data.key);
        $("#imgFile").attr('src',src).show();
        $("#delete_attach").show();
    }

    function deleteLitpic() {
        $("#txtLitpic").val('');
        $("#imgFile").attr('src','').hide();
        $("#delete_attach").hide();
    }
</script>

