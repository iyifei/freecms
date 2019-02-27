var FreeCms = {};
//编辑页面提交数据
FreeCms.doEditSubmit=function () {

    //前置函数
    if(typeof beforeSubmitFun === 'function'){
        beforeSubmitFun();
    }

    var isCheck = true;
    $("form input").each(function () {

        var id = $(this).attr("id");
        if ($(this).attr("required") == 'required' && $.trim($(this).val()) == "") {
            $("#error_" + id).addClass('error').html('必填字段');
            $(this).addClass('fm-text-error');
            isCheck = false;
        } else {
            $("#error_" + id).removeClass('error').html('');
            $(this).removeClass('fm-text-error');
        }
    });

    if(isCheck){
        var url = $("#submitUrl").val();
        $.post(url, FreeCms.serializeObject($("form")), function (result) {
            //成功
            if (result.status == 0) {
                if(typeof callbackSaveSuccess === 'function'){
                    callbackSaveSuccess();
                }
            } else {
                FreeCms.error(result.errmsg);
            }
        }, 'json');
    }
};

//批量更新
FreeCms.batchSave = function (key) {
    var list = [];
    $("."+key).each(function () {
        var id = $(this).attr("did");
        var val = $(this).val();
        var item = {
            id:id,
            key:key,
            val:val
        };
        list.push(item);
    });
    var json = JSON.stringify(list);
    var data = {
        list:json,
        method:'batch'
    };
    var saveUrl = $("#saveUrl").val();
    $.post(saveUrl,data,function (result) {
        if(result.status==0){
            if(typeof successCallback === 'function'){
                successCallback();
            }
        }else{
            FreeCms.error(result.errmsg);
        }
    });
};

//单个字段更新
FreeCms.oneSave = function (id,key,val) {
    var data = {
        id:id,
        method:'edit',
        key:key,
        val:val
    };
    var saveUrl = $("#saveUrl").val();
    $.post(saveUrl,data,function (result) {
        if(result.status==0){
            if(typeof successCallback === 'function'){
                successCallback();
            }
        }else{
            FreeCms.error(result.errmsg);
        }
    })
};

//删除记录
FreeCms.deleteRow = function (id) {
    //询问框
    FreeCms.confirm('确定删除?删除后无法恢复？', function(){
        var data = {
            id:id
        };
        var url = $("#deleteUrl").val()+"?method=delete";
        $.post(url,data,function (result) {
            if(result.status==0){
                if(typeof successCallback === 'function'){
                    successCallback();
                }
            }else{
                FreeCms.error(result.errmsg);
            }
        });
    });
};

//批量删除
FreeCms.batchDeleteRows = function () {
    var ids = [];
    $(".chkid").each(function () {
        var checked = $(this).is(':checked');
        if(checked){
            ids.push($(this).val());
        }
    });
    if(ids.length>0){
        //询问框
        FreeCms.confirm('确定删除?删除后无法恢复？', function(){
            var data = {
                ids:ids.join(',')
            };
            var url = $("#deleteUrl").val()+"?method=batch_delete";
            $.post(url,data,function (result) {
                if(result.status==0){
                    if(typeof successCallback === 'function'){
                        successCallback();
                    }
                }else{
                    FreeCms.error(result.errmsg);
                }
            });
        });
    }else{
        FreeCms.info('请选择需要删除的内容');
    }
};

//处理form表单数据
FreeCms.serializeObject = function (form) {
    var o = {};
    $.each(form.serializeArray(), function (index) {
        if (this['value'] != undefined && this['value'].length > 0) {
            // 如果表单项的值非空，才进行序列化操作
            if (o[this['name']]) {
                o[this['name']] = o[this['name']] + "," + this['value'];
            } else {
                o[this['name']] = this['value'];
            }
        }
    });
    return o;
};

//成功提示
FreeCms.success = function (msg,afterFun,time) {
    if(typeof time===undefined){
        time = 1500;
    }
    $.toast({
        heading: '成功',
        text: msg,
        position: 'top-center',
        icon: 'success',
        hideAfter:time,
        afterHidden:function () {
            if(typeof afterFun === 'function'){
                afterFun();
            }
        }
    })
};

//出错
FreeCms.error = function (msg,afterFun) {
    $.toast({
        heading: '出错',
        text: msg,
        position: 'top-center',
        icon: 'error',
        afterHidden:function () {
            if(typeof afterFun === 'function'){
                afterFun();
            }
        }
    })
};

//警告
FreeCms.warn = function (msg,afterFun) {
    $.toast({
        heading: '警告',
        text: msg,
        position: 'top-center',
        icon: 'warning',
        afterHidden:function () {
            if(typeof afterFun === 'function'){
                afterFun();
            }
        }
    })
};

//警告
FreeCms.info = function (msg,afterFun) {
    $.toast({
        heading: '提示',
        text: msg,
        position: 'top-center',
        icon: 'info',
        afterHidden:function () {
            if(typeof afterFun === 'function'){
                afterFun();
            }
        }
    })
};

//确认框
FreeCms.confirm = function (msg,succFun) {
    swal({
        title: '确认操作?',
        text: msg,
        icon: 'info',
        buttons: {
            cancel: {
                text: '取消',
                value: null,
                visible: true,
                className: 'btn btn-default',
                closeModal: true,
            },
            confirm: {
                text: '确认',
                value: true,
                visible: true,
                className: 'btn btn-primary',
                closeModal: true
            }
        }
    }).then(function (value) {
        if(value && typeof succFun ==='function'){
            succFun();
        }
    });
}

//保存成功
FreeCms.callbackEditSaveSuccess = function() {
    FreeCms.success('操作执行成功');
    setTimeout(function () {
        var hash  = window.location.hash;
        var addrs = hash.split('?')[0].split('/');
        var addr = addrs[0]+'/'+addrs[1];
        window.location.hash = addr+"?"+Date.parse(new Date());
    },500);
}

//上传图片
FreeCms._imageEditor=null;
FreeCms._uploadSingleImage = false;
FreeCms.initUploadEditor = function () {
    //图片上传
    FreeCms._imageEditor = UE.getEditor('freeCmsImageEditor');
    FreeCms._imageEditor.ready(function () {
        //设置编辑器不可用
        //_editor.setDisabled();  这个地方要注意 一定要屏蔽
        //隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
        FreeCms._imageEditor.hide();
        //侦听图片上传
        FreeCms._imageEditor.addListener('beforeinsertimage', function (t, arg) {
            if(FreeCms._uploadSingleImage){
                var src = arg[0].src;
                if(typeof uploadSingleImageCallbackFun === 'function'){
                    uploadSingleImageCallbackFun(src);
                }
            }else{
                var list = [];
                for(var a in arg){
                    var src =arg[a].src;
                    list.push(src);
                }
                if(typeof uploadImageCallbackFun === 'function'){
                    uploadImageCallbackFun(list);
                }
            }
        })
    });
}

FreeCms.simpleUpload = function () {
    FreeCms._uploadSingleImage = true;
    var myImage = FreeCms._imageEditor.getDialog("insertimage");
    myImage.open();
}

FreeCms.upImages = function () {
    FreeCms._uploadSingleImage = false;
    var myImage = FreeCms._imageEditor.getDialog("insertimage");
    myImage.open();
}

FreeCms.upFile = function () {
    var myFiles = FreeCms._imageEditor.getDialog("attachment");
    myFiles.open();
}