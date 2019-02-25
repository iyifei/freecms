<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">站点</li>
    <li class="breadcrumb-item">栏目管理</li>
    <li class="breadcrumb-item active">
        编辑栏目
    </li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    栏目管理
    <small>编辑栏目</small>
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
                <h4 class="panel-title">基本信息</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body p-30 ">
                <form autocomplete="off">
                    <input type="hidden" name="id" value="<{$data.id}>">
                    <input type="hidden" name="method" value="<{$method}>" />
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>父级栏目</label>
                        <div class="col-md-9">
                            <select class="form-control" name="pid">
                                <option value="0">顶级栏目</option>
                                <{foreach from=$arctypes item=vo}>
                                    <option value="<{$vo.id}>" <{if $vo.id eq $pid}>selected="selected"<{/if}>>&emsp;<{$vo.spacer}><{$vo.typename}>|<{$vo.channel}></option>
                                <{/foreach}>
                            </select>
                            <small class="f-s-12 text-grey-darker">选择上级栏目</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>内容模型</label>
                        <div class="col-md-9">
                            <select  class="form-control" name="channel" id="selChannel" onchange="changeChannel()">
                                <option <{if $channel eq 'article'}>selected="selected"<{/if}> value="article" >普通文章|article</option>
                                <option <{if $channel eq 'image'}>selected="selected"<{/if}> value="image"  >图片集|image</option>
                                <option <{if $channel eq 'video'}>selected="selected"<{/if}> value="video"  >视频集|video</option>
                                <option <{if $channel eq 'audio'}>selected="selected"<{/if}> value="audio"  >音频集|audio</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>栏目名称</label>
                        <div class="col-md-9">
                            <input class="form-control" name="typename" type="text" value="<{$data.typename}>" />
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>栏目属性</label>
                        <div class="col-md-9">
                            <label><input type="radio" name="type"  value="list" checked="checked">&nbsp;最终列表栏目（允许在本栏目发布文档，并生成文档列表）</label><br>
                            <label><input type="radio" name="type" <{if $data.type eq 'face'}>checked="checked"<{/if}>  value="face">&nbsp;封面栏目（栏目本身不允许发布文档）</label><br/>
                            <label><input type="radio" name="type"  <{if $data.type eq 'link'}>checked="checked"<{/if}> value="link">&nbsp;跳转连接（填写在"文件保存目录"处，外部链接：填写网址）</label><br/>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">文件保存目录</label>
                        <div class="col-md-9">
                            <input class="form-control" type="text" value="<{$data.typedir}>" name="typedir" />
                            <small class="f-s-12 text-grey-darker">不填写时默认是拼音</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">排序</label>
                        <div class="col-md-9">
                            <input class="form-control" name="sortrank" type="text" value="<{if $data}><{$data.sortrank}><{else}>50<{/if}>" />
                            <small class="f-s-12 text-grey-darker">越小越靠前</small>
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
                <h4 class="panel-title">SEO优化</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body p-30 ">
                <form autocomplete="off">
                    <div class="form-group row m-b-15">
                        <label class="col-sm-3 col-form-label text-right">栏目SEO标题</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="text" name="seotitle" value="<{$data.seotitle}>" />
                            <small class="f-s-12 text-grey-darker">输入栏目SEO标题</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-sm-3 col-form-label text-right">栏目关键字</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="text" name="keywords" value="<{$data.keywords}>" />
                            <small class="f-s-12 text-grey-darker">多个关键字用逗号隔开</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-sm-3 col-form-label text-right">栏目描述</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" rows="5" name="description"><{$data.description}></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <!-- end panel-body -->
        </div>
        <!-- end panel -->

        <!-- begin panel -->
        <div class="panel panel-inverse" data-sortable-id="index-3">
            <!-- begin panel-heading -->
            <div class="panel-heading">
                <div class="panel-heading-btn">
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                </div>
                <h4 class="panel-title">模板设置</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body p-30 ">
                <form autocomplete="off">
                    <div class="form-group row m-b-15">
                        <label class="col-sm-3 col-form-label text-right">封面模板</label>
                        <div class="col-sm-9">
                            <input type="hidden" id="hideSelFace" value="<{$data.tempface}>">
                            <select name="tempface" id="selFace"  class="form-control">
                            </select>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-sm-3 col-form-label text-right">列表模板</label>
                        <div class="col-sm-9">
                            <input type="hidden" id="hideSelList" value="<{$data.templist}>">
                            <select name="templist" id="selList"  class="form-control">
                            </select>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-sm-3 col-form-label text-right">内容页模板</label>
                        <div class="col-sm-9">
                            <input type="hidden" id="hideSelArchive" value="<{$data.temparchive}>">
                            <select name="temparchive" id="selArchive" class="form-control">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <!-- end panel-body -->
        </div>
        <!-- end panel -->

        <!-- begin panel -->
        <div class="panel panel-inverse" data-sortable-id="index-4">
            <!-- begin panel-heading -->
            <div class="panel-heading">
                <div class="panel-heading-btn">
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                </div>
                <h4 class="panel-title">扩展信息</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body">
                <form autocomplete="off">
                    <div class="row form-group m-b-10">
                        <label class="col-md-3 col-form-label text-right">扩展属性</label>
                        <div class="col-md-9">
                            <textarea class="form-control" rows="10" name="extinfo"><{$data.extinfo}></textarea>
                            <small class="f-s-12 text-grey-darker">输入json格式</small>
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

<div class="row">
    <div class="col-lg-12">
        <div class="panel">
            <div class="panel-body text-right">
                <button type="button" onclick="FreeCms.doEditSubmit();" class="btn btn-primary">确认保存</button>&nbsp;&nbsp;
                <a href="javascript:window.history.back(-1);" class="btn btn-default">返回</a>
            </div>
        </div>
    </div>
</div>

<input type="hidden" id="submitUrl" value="<{$myf_path}>/admin/site/arctype/save">
<div style="display: none" id="templatesJson"><{$templatesJson}></div>

<script type="text/javascript">
    function changeChannel() {
        var channel = $("#selChannel").val();
        if(channel=='blend'){
            $(".not-blend").hide();
        }else{
            $(".not-blend").show();
            var templates = JSON.parse($("#templatesJson").html());
            var template = templates[channel];
            var faces = template['face'];
            var facesel = document.getElementById("selFace");
            facesel.options.length = 0;
            if(faces!=undefined){
                var selFace = $("#hideSelFace").val();
                for (var i = 0; i < faces.length; i++) {
                    var f = faces[i];
                    var option = new Option(f, f);
                    if(selFace!=''){
                        if(selFace==f){
                            option.selected = true;
                        }
                    }else if(f.indexOf("_default.") > 0){
                        option.selected = true;
                    }
                    facesel.options.add(option);
                }
            }
            var lists = template['list'];
            var listsel = document.getElementById("selList");
            listsel.options.length = 0;
            if(lists!=undefined){
                var selList = $("#hideSelList").val();
                for (var i = 0; i < lists.length; i++) {
                    var f = lists[i];
                    var option = new Option(f, f);
                    if(selList!=''){
                        if(selList==f){
                            option.selected = true;
                        }
                    }else if(f.indexOf("_default.") > 0){
                        option.selected = true;
                    }
                    listsel.options.add(option);
                }
            }
            var archives = template['archive'];
            var archivesel = document.getElementById("selArchive");
            archivesel.options.length = 0;
            if(archives!=undefined){
                var selArchive = $("#hideSelArchive").val();
                for (var i = 0; i < archives.length; i++) {
                    var f = archives[i];
                    var option = new Option(f, f);
                    if(selArchive!=''){
                        if(selArchive==f){
                            option.selected = true;
                        }
                    }else if(f.indexOf("_default.") > 0){
                        option.selected = true;
                    }
                    archivesel.options.add(option);
                }
            }
        }
    }
    //初始化
    $(document).ready(function () {
        changeChannel();
    });

    function callbackSaveSuccess() {
        FreeCms.success('更新成功');
        window.history.back(-1);
    }
</script>

