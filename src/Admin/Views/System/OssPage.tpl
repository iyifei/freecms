<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">站点</li>
    <li class="breadcrumb-item">系统管理</li>
    <li class="breadcrumb-item active">
        云存储配置
    </li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    云存储配置
</h1>


<!-- begin row -->
<div class="row">
    <!-- begin col-6 -->
    <div class="col-lg-12">
        <!-- begin panel -->
        <div class="panel panel-inverse" data-sortable-id="index-1">
            <!-- begin panel-heading -->
            <div class="panel-heading">
                <div class="panel-heading-btn">
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                </div>
                <h4 class="panel-title">基本设置</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body " style="padding-bottom:0;padding-top:20px;">
                <form autocomplete="off">
                    <div class="form-group row">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>存储模式</label>
                        <div class="col-md-9">
                            <input type="hidden"  id="storeMode" class="value" name="sys_cfg_storage_mode" did="{$config.sys_cfg_storage_mode.id}" value="{$config.sys_cfg_storage_mode.value}">
                            <p>
                                <label>
                                    <input type="radio" id="storeModel_local" name="storeMode" value="local" {if $config.sys_cfg_storage_mode.value eq 'local'}checked="checked"{/if}>
                                    本机磁盘存储
                                </label>
                            </p>
                            <p>
                                <label>
                                    <input type="radio" id="storeModel_aliyun" name="storeMode" value="aliyun" {if $config.sys_cfg_storage_mode.value eq 'aliyun'}checked="checked"{/if}>
                                    阿里云存储
                                </label>
                            </p>
                            <p>
                                <label>
                                    <input type="radio" id="storeModel_qiniu" name="storeMode" value="qiniu" {if $config.sys_cfg_storage_mode.value eq 'qiniu'}checked="checked"{/if}>
                                    七牛云存储
                                </label>
                            </p>
                            <p class="f-s-12 text-red-darker">切换存储空间之前上传的数据会丢失，请谨慎操作！！！</p>
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
                <h4 class="panel-title">阿里云存储配置</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body p-30 ">
                <form autocomplete="off">
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>access_id</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control value aliyun"  did="{$config.sys_cfg_aliyun_access_id.id}" name="sys_cfg_aliyun_access_id" id="sys_cfg_aliyun_access_id" value="{$config.sys_cfg_aliyun_access_id.value}" />
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>access_secret</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control value aliyun"  did="{$config.sys_cfg_aliyun_access_secret.id}" name="sys_cfg_aliyun_access_secret" id="sys_cfg_aliyun_access_secret" value="{$config.sys_cfg_aliyun_access_secret.value}" />
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>bucket</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control value aliyun"  did="{$config.sys_cfg_aliyun_bucket.id}" name="sys_cfg_aliyun_bucket" id="sys_cfg_aliyun_bucket" value="{$config.sys_cfg_aliyun_bucket.value}" />
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>endpoint</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control value aliyun"  did="{$config.sys_cfg_aliyun_endpoint.id}" name="sys_cfg_aliyun_endpoint" id="sys_cfg_aliyun_endpoint" value="{$config.sys_cfg_aliyun_endpoint.value}" />
                        </div>
                    </div>
                    <div class="text-right">
                        <input type="hidden" class="form-control value"  did="{$config.sys_cfg_aliyun_check.id}" name="sys_cfg_aliyun_check" id="sys_cfg_aliyun_check" value="{$config.sys_cfg_aliyun_check.value}" />
                        <label class="m-r-10" id="labelAliyun">状态：{if $config.sys_cfg_aliyun_check.value eq 1}可用{else}不可用{/if}</label>
                        <input type="button" id="btnAliyunTest" class="btn btn-danger" value="检测阿里云存储参数配置是否正确">
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
                <h4 class="panel-title">七牛云存储配置</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body p-30 ">
                <form autocomplete="off">
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>accessKey</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control value qiniu"  did="{$config.sys_cfg_qiniu_accessKey.id}" name="sys_cfg_qiniu_accessKey" id="sys_cfg_qiniu_accessKey" value="{$config.sys_cfg_qiniu_accessKey.value}" />
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>secretKey</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control value qiniu"  did="{$config.sys_cfg_qiniu_secretKey.id}" name="sys_cfg_qiniu_secretKey" id="sys_cfg_qiniu_secretKey" value="{$config.sys_cfg_qiniu_secretKey.value}" />
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>bucket</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control value qiniu"  did="{$config.sys_cfg_qiniu_bucket.id}" name="sys_cfg_qiniu_bucket" id="sys_cfg_qiniu_bucket" value="{$config.sys_cfg_qiniu_bucket.value}" />
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>domain</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control value qiniu"  did="{$config.sys_cfg_qiniu_domain.id}" name="sys_cfg_qiniu_domain" id="sys_cfg_qiniu_domain" value="{$config.sys_cfg_qiniu_domain.value}" />
                        </div>
                    </div>
                    <div class="text-right">
                        <input type="hidden" class="form-control value"  did="{$config.sys_cfg_qiniu_check.id}" name="sys_cfg_qiniu_check" id="sys_cfg_qiniu_check" value="{$config.sys_cfg_qiniu_check.value}" />
                        <label class="m-r-10" id="labelQiniu">状态：{if $config.sys_cfg_qiniu_check.value eq 1}可用{else}不可用{/if}</label>
                        <input type="button" id="btnQiniuTest" class="btn btn-info" value="检测七牛云存储参数配置是否正确">
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

<div class="row">
    <div class="col-lg-12">
        <div class="panel">
            <div class="panel-body text-right">
                <button type="button" onclick="FreeCms.batchSave('value');" class="btn btn-primary">确认保存</button>&nbsp;&nbsp;
                <small class="f-s-12 text-red-darker">配置第三方云存储，保存前请务必确保通过参数配置校验！！！</small>
            </div>
        </div>
    </div>
</div>

<input type="hidden" id="saveUrl" value="{$myf_path}/admin/system/oss/save">
<input type="hidden" id="testUrl" value="{$myf_path}/cloud/test">

<script type="text/javascript">

    FreeCms.initUploader('uploadFile');

    function beforeBatchSubmitFun() {
        var storeMode = $("#storeMode").val();
        if(storeMode=='aliyun'){
            var isAliyunCheck = $("#sys_cfg_aliyun_check").val();
            if(isAliyunCheck!='1'){
                $("#storeModel_local").prop('checked',true);
                $("#storeMode").val('local');
            }
        }else if(storeMode=='qiniu'){
            var isCheck = $("#sys_cfg_qiniu_check").val();
            if(isCheck!='1'){
                $("#storeModel_local").prop('checked',true);
                $("#storeMode").val('local');
            }
        }
    }

    $(document).ready(function () {
        $("input[name='storeMode']").click(function () {
            $("#storeMode").val($(this).val());
        })

        $("#btnQiniuTest").click(function () {
            var id = $("#sys_cfg_qiniu_accessKey").val();
            var secret = $("#sys_cfg_qiniu_secretKey").val();
            var bucket = $("#sys_cfg_qiniu_bucket").val();
            var domain = $("#sys_cfg_qiniu_domain").val();
            if(id==''||secret==''||bucket==''||domain==''){
                FreeCms.error('七牛配置的所有参数为必填参数');
                return;
            }
            var url = $("#testUrl").val();
            var data = {
                type:"Qiniu",
                id:id,
                secret:secret,
                domain:domain,
                bucket:bucket
            };
            $.post(url,data,function (res) {
                if(res.status==0){
                    $("#sys_cfg_check").val(1);
                    $("#labelQiniu").html("状态：正确");
                }else{
                    FreeCms.error(res.errmsg);
                }
            })
        })

        $("#btnAliyunTest").click(function () {
            var id = $("#sys_cfg_aliyun_access_id").val();
            var secret = $("#sys_cfg_aliyun_access_secret").val();
            var bucket = $("#sys_cfg_aliyun_bucket").val();
            var domain = $("#sys_cfg_aliyun_endpoint").val();
            if(id==''||secret==''||bucket==''||domain==''){
                FreeCms.error('阿里配置的所有参数为必填参数');
                return;
            }
            var url = $("#testUrl").val();
            var data = {
                type:"Aliyun",
                id:id,
                secret:secret,
                domain:domain,
                bucket:bucket
            };
            $.post(url,data,function (res) {
                if(res.status==0){
                    $("#sys_cfg_aliyun_check").val(1);
                    $("#labelAliyun").html("状态：正确");
                }else{
                    FreeCms.error(res.errmsg);
                }
            })
        })
        
        $(".aliyun").blur(function () {
            $("#sys_cfg_aliyun_check").val(0);
            $("#labelAliyun").html("状态：待校验");
        })

        $(".qiniu").blur(function () {
            $("#sys_cfg_qiniu_check").val(0);
            $("#labelQiniu").html("状态：待校验");
        })
    });

    function callbackSaveSuccess() {
        FreeCms.callbackEditSaveSuccess();
    }

</script>

