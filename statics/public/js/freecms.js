FreeCms = {};

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