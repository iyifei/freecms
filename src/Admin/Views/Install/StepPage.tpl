<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <title>安装程序-MyfCMS内容管理系统</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <meta content="" name="description" />
    <meta content="minyifei.cn" name="author" />

    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <link href="{$myf_path}/statics/admin/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="{$myf_path}/statics/admin/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="{$myf_path}/statics/admin/plugins/font-awesome/css/fontawesome-all.min.css" rel="stylesheet" />
    <link href="{$myf_path}/statics/admin/plugins/animate/animate.min.css" rel="stylesheet" />
    <link href="{$myf_path}/statics/admin/css/default/style.min.css" rel="stylesheet" />
    <link href="{$myf_path}/statics/admin/css/default/style-responsive.min.css" rel="stylesheet" />
    <link href="{$myf_path}/statics/admin/css/default/theme/default.css" rel="stylesheet" id="theme" />
    <!-- ================== END BASE CSS STYLE ================== -->

    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="{$myf_path}/statics/admin/plugins/jquery-smart-wizard/css/smart_wizard.min.css" rel="stylesheet" />
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="{$myf_path}/statics/admin/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade show"><span class="spinner"></span></div>
<!-- end #page-loader -->

<!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <!-- begin #header -->
    <div id="header" class="header navbar-default">
        <!-- begin navbar-header -->
        <div class="navbar-header">
            <a href="index.html" class="navbar-brand"><span class="navbar-logo"></span> <b>Color</b> Admin</a>
            <button type="button" class="navbar-toggle" data-click="sidebar-toggled">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <!-- end navbar-header -->
    </div>
    <!-- end #header -->

    <!-- begin #content -->
    <div id="content" class="content-full-width" style="width:80%;margin:20px auto;">
        <!-- begin page-header -->
        <h1 class="page-header">程序安装 <small>安装引导</small></h1>
        <!-- end page-header -->

        <!-- begin wizard-form -->
        <form action="/" method="POST" name="form-wizard" class="form-control-with-bg">
            <!-- begin wizard -->
            <div id="wizard">
                <!-- begin wizard-step -->
                <ul>
                    <li class="col-md-3 col-sm-4 col-6">
                        <a href="#step-1">
                            <span class="number">1</span>
                            <span class="info text-ellipsis">
									许可协议
									<small class="text-ellipsis">阅读许可协议</small>
								</span>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-6">
                        <a href="#step-2">
                            <span class="number">2</span>
                            <span class="info text-ellipsis">
									环境检测
									<small class="text-ellipsis">检查安装环境</small>
								</span>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-6">
                        <a href="#step-3">
                            <span class="number">3</span>
                            <span class="info text-ellipsis">
									参数配置
									<small class="text-ellipsis">初始化配置</small>
								</span>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-6">
                        <a href="#step-4">
                            <span class="number">4</span>
                            <span class="info text-ellipsis">
									安装&完成
									<small class="text-ellipsis">安装使用系统</small>
								</span>
                        </a>
                    </li>
                </ul>
                <!-- end wizard-step -->
                <!-- begin wizard-content -->
                <div>
                    <!-- begin step-1 -->
                    <div id="step-1">
                        <!-- begin fieldset -->
                        <fieldset>
                            <!-- begin row -->
                            <div class="row">
                                <!-- begin col-8 -->
                                <div class="col-md-10 offset-md-1">
                                    <legend class="no-border f-w-700 p-b-0 m-t-0 m-b-20 f-s-16 text-inverse">阅读许可协议</legend>
                                    <div class="pr-agreement" style="height:500px;overflow: scroll">
                                        <p>版权所有 (c)2003-2011，DedeCMS.com 保留所有权利。 </p>
                                        <p>感谢您选择织梦内容管理系统（以下简称DedeCMS），DedeCMS是目前国内最强大、最稳定的中小型门户网站建设解决方案之一，基于 PHP + MySQL   的技术开发，全部源码开放。</p>
                                        <p>DedeCMS 的官方网址是： <a href="http://www.dedecms.com" target="_blank">www.dedecms.com</a> 交流论坛：<a href="http://bbs.dedecms.com" target="_blank"> bbs.dedecms.com</a></p>
                                        <p>为了使你正确并合法的使用本软件，请你在使用前务必阅读清楚下面的协议条款：</p>
                                        <strong>一、本授权协议适用且仅适用于 DedeCMS 5.x.x 版本，DedeCMS官方对本授权协议的最终解释权。</strong>
                                        <strong>二、协议许可的权利 </strong>
                                        <p>1、您可以在完全遵守本最终用户授权协议的基础上，将本软件应用于非商业用途，而不必支付软件版权授权费用。 </p>
                                        <p>2、您可以在协议规定的约束和限制范围内修改 DedeCMS 源代码或界面风格以适应您的网站要求。 </p>
                                        <p>3、您拥有使用本软件构建的网站全部内容所有权，并独立承担与这些内容的相关法律义务。 </p>
                                        <p>4、获得商业授权之后，您可以将本软件应用于商业用途，同时依据所购买的授权类型中确定的技术支持内容，自购买时刻起，在技术支持期限内拥有通过指定的方式获得指定范围内的技术支持服务。商业授权用户享有反映和提出意见的权力，相关意见将被作为首要考虑，但没有一定被采纳的承诺或保证。 </p>
                                        <strong>二、协议规定的约束和限制 </strong>
                                        <p>1、未获商业授权之前，不得将本软件用于商业用途（包括但不限于企业网站、经营性网站、以营利为目的或实现盈利的网站）。购买商业授权请登陆   <a href="http://bbs.dedecms.com" target="_blank">bbs.dedecms.com</a> 了解最新说明。</p>
                                        <p>2、未经官方许可，不得对本软件或与之关联的商业授权进行出租、出售、抵押或发放子许可证。</p>
                                        <p>3、不管你的网站是否整体使用 DedeCMS ，还是部份栏目使用 DedeCMS，在你使用了 DedeCMS 的网站主页上必须加上 DedeCMS   官方网址(<a href="http://www.dedecms.com" target="_blank">www.dedecms.com</a>)的链接。</p>
                                        <p>4、未经官方许可，禁止在 DedeCMS   的整体或任何部分基础上以发展任何派生版本、修改版本或第三方版本用于重新分发。</p>
                                        <p>5、如果您未能遵守本协议的条款，您的授权将被终止，所被许可的权利将被收回，并承担相应法律责任。 </p>
                                        <strong>三、有限担保和免责声明 </strong>
                                        <p>1、本软件及所附带的文件是作为不提供任何明确的或隐含的赔偿或担保的形式提供的。 </p>
                                        <p>2、用户出于自愿而使用本软件，您必须了解使用本软件的风险，在尚未购买产品技术服务之前，我们不承诺对免费用户提供任何形式的技术支持、使用担保，也不承担任何因使用本软件而产生问题的相关责任。 </p>
                                        <p>3、电子文本形式的授权协议如同双方书面签署的协议一样，具有完全的和等同的法律效力。您一旦开始确认本协议并安装   DedeCMS，即被视为完全理解并接受本协议的各项条款，在享有上述条款授予的权力的同时，受到相关的约束和限制。协议许可范围以外的行为，将直接违反本授权协议并构成侵权，我们有权随时终止授权，责令停止损害，并保留追究相关责任的权力。</p>
                                        <p>4、如果本软件带有其它软件的整合API示范例子包，这些文件版权不属于本软件官方，并且这些文件是没经过授权发布的，请参考相关软件的使用许可合法的使用。</p>
                                        <p><b>协议发布时间：</b> 2008年1月18日</p>
                                        <p><b>版本最新更新：</b> 2011年2月21日 By DedeCMS.com</p>
                                    </div>
                                </div>
                                <!-- end col-8 -->
                            </div>
                            <!-- end row -->
                        </fieldset>
                        <!-- end fieldset -->
                    </div>
                    <!-- end step-1 -->
                    <!-- begin step-2 -->
                    <div id="step-2">
                        <!-- begin fieldset -->
                        <fieldset>
                            <!-- begin row -->
                            <div class="row">
                                <!-- begin col-8 -->
                                <div class="col-md-10 offset-md-1">
                                    <legend class="no-border f-w-700 p-b-0 m-t-0 m-b-20 f-s-16 text-inverse">服务器信息</legend>
                                    <table class="table table-bordered table-condensed">
                                        <thead>
                                            <tr>
                                                <th>参数</th>
                                                <th>值</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>服务器域名</td>
                                                <td>nicky@hotmail.com</td>
                                            </tr>
                                            <tr>
                                                <td>服务器操作系统</td>
                                                <td>nicky@hotmail.com</td>
                                            </tr>
                                            <tr>
                                                <td>服务器解译引擎</td>
                                                <td>edmund@yahoo.com</td>
                                            </tr>
                                            <tr>
                                                <td>PHP版本</td>
                                                <td>harvinder@gmail.com</td>
                                            </tr>
                                            <tr>
                                                <td>系统安装目录</td>
                                                <td>harvinder@gmail.com</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <legend class="no-border f-w-700 p-b-0 m-t-0 m-b-20 f-s-16 text-inverse">系统环境检测</legend>
                                    <table class="table table-bordered table-condensed">
                                        <thead>
                                            <tr>
                                                <th>需开启的变量或函数</th>
                                                <th>要求</th>
                                                <th>实际状态及建议</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>curl</td>
                                                <td>On</td>
                                                <td>[√]On (不符合要求将导致采集、远程资料本地化等功能无法应用)</td>
                                            </tr>
                                            <tr>
                                                <td>MysqlPDO</td>
                                                <td>On</td>
                                                <td>[√]On (不支持无法使用本系统)</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <legend class="no-border f-w-700 p-b-0 m-t-0 m-b-20 f-s-16 text-inverse">目录权限检测</legend>
                                    <table class="table table-bordered table-condensed">
                                        <thead>
                                            <tr>
                                                <th>目录名</th>
                                                <th>读取权限</th>
                                                <th>写入权限</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>/</td>
                                                <td>[√]读</td>
                                                <td>[√]写</td>
                                            </tr>
                                            <tr>
                                                <td>/uploads</td>
                                                <td>[√]读</td>
                                                <td>[√]写</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- end col-8 -->
                            </div>
                            <!-- end row -->
                        </fieldset>
                        <!-- end fieldset -->
                    </div>
                    <!-- end step-2 -->
                    <!-- begin step-3 -->
                    <div id="step-3">
                        <!-- begin fieldset -->
                        <fieldset>
                            <!-- begin row -->
                            <div class="row">
                                <!-- begin col-8 -->
                                <div class="col-md-10 offset-md-1">
                                    <legend class="no-border f-w-700 p-b-0 m-t-0 m-b-20 f-s-16 text-inverse">数据库设置</legend>
                                    <!-- begin form-group -->
                                    <div class="form-group row m-b-10">
                                        <label class="col-md-3 col-form-label text-md-right">数据库类型 <span class="text-danger">*</span></label>
                                        <div class="col-md-6">
                                            <select name="driver" class="form-control">
                                                <option>MySQL</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row m-b-10">
                                        <label class="col-md-3 col-form-label text-md-right">数据库主机 <span class="text-danger">*</span></label>
                                        <div class="col-md-6">
                                            <input class="form-control" type="text" placeholder="" value="localhost" />
                                        </div>
                                    </div>
                                    <div class="form-group row m-b-10">
                                        <label class="col-md-3 col-form-label text-md-right">数据库用户 <span class="text-danger">*</span></label>
                                        <div class="col-md-6">
                                            <input class="form-control" type="text" placeholder="" value="root" />
                                        </div>
                                    </div>
                                    <div class="form-group row m-b-10">
                                        <label class="col-md-3 col-form-label text-md-right">数据库密码 <span class="text-danger">*</span></label>
                                        <div class="col-md-6">
                                            <input class="form-control" type="text" placeholder="" value="" />
                                        </div>
                                    </div>
                                    <div class="form-group row m-b-10">
                                        <label class="col-md-3 col-form-label text-md-right">数据库名称 <span class="text-danger">*</span></label>
                                        <div class="col-md-6">
                                            <input class="form-control" type="text" placeholder="" value="freecms" />
                                        </div>
                                    </div>
                                    <!-- end form-group -->
                                    <legend class="no-border f-w-700 p-b-0 m-t-0 m-b-20 f-s-16 text-inverse">管理员初始密码</legend>
                                    <div class="form-group row m-b-10">
                                        <label class="col-md-3 col-form-label text-md-right">用户名 <span class="text-danger">*</span></label>
                                        <div class="col-md-6">
                                            <input class="form-control" type="text" placeholder="" value="admin" />
                                        </div>
                                    </div>
                                    <div class="form-group row m-b-10">
                                        <label class="col-md-3 col-form-label text-md-right">密码 <span class="text-danger">*</span></label>
                                        <div class="col-md-6">
                                            <input class="form-control" type="text" placeholder="" value="admin" />
                                        </div>
                                    </div>
                                    <div class="form-group row m-b-10">
                                        <label class="col-md-3 col-form-label text-md-right">Cookie加密码 <span class="text-danger">*</span></label>
                                        <div class="col-md-6">
                                            <input class="form-control" type="text" value="freecms" />
                                        </div>
                                    </div>
                                    <legend class="no-border f-w-700 p-b-0 m-t-0 m-b-20 f-s-16 text-inverse">网站设置</legend>
                                    <div class="form-group row m-b-10">
                                        <label class="col-md-3 col-form-label text-md-right">网站名称 <span class="text-danger">*</span></label>
                                        <div class="col-md-6">
                                            <input class="form-control" type="text" value="我的网站" />
                                        </div>
                                    </div>
                                </div>
                                <!-- end col-8 -->
                            </div>
                            <!-- end row -->
                        </fieldset>
                        <!-- end fieldset -->
                    </div>
                    <!-- end step-3 -->
                    <!-- begin step-4 -->
                    <div id="step-4">
                        <div class="jumbotron m-b-0 text-center">
                            <h2 class="text-inverse">恭喜,安装成功!</h2>
                            <p class="m-b-30 f-s-16 m-t-15">
                                <a href="./">访问网站首页</a>
                            </p>
                            <p>
                                <a href="#" class="btn btn-primary btn-lg">登录网站后台</a>
                            </p>
                        </div>
                    </div>
                    <!-- end step-4 -->
                </div>
                <!-- end wizard-content -->
            </div>
            <!-- end wizard -->
        </form>
        <!-- end wizard-form -->
    </div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<script src="{$myf_path}/statics/admin/plugins/jquery/jquery-3.2.1.min.js"></script>
<script src="{$myf_path}/statics/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="{$myf_path}/statics/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!--[if lt IE 9]>
<script src="{$myf_path}/statics/admin/crossbrowserjs/html5shiv.js"></script>
<script src="{$myf_path}/statics/admin/crossbrowserjs/respond.min.js"></script>
<script src="{$myf_path}/statics/admin/crossbrowserjs/excanvas.min.js"></script>
<![endif]-->
<script src="{$myf_path}/statics/admin/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="{$myf_path}/statics/admin/plugins/js-cookie/js.cookie.js"></script>
<script src="{$myf_path}/statics/admin/js/theme/default.min.js"></script>
<script src="{$myf_path}/statics/admin/js/apps.min.js"></script>
<!-- ================== END BASE JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="{$myf_path}/statics/admin/plugins/parsley/parsley.min.js"></script>
<script src="{$myf_path}/statics/admin/plugins/jquery-smart-wizard/js/jquery.smartWizard.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<script>
    $(document).ready(function() {
        App.init();

        //handleDashboardGritterNotification();
        handleBootstrapWizardsValidation();
    });


    var handleBootstrapWizardsValidation = function() {
        "use strict";
        $('#wizard').smartWizard({
            selected: 0,
            theme: 'default',
            transitionEffect:'',
            transitionSpeed: 0,
            useURLhash: false,
            showStepURLhash: false,
            toolbarSettings: {
                toolbarPosition: 'bottom'
            },
            buttonLabels: {
                next: '继续',
                back: '后退',
                finish: '完成'
            }
        });
        $('#wizard').on('leaveStep', function(e, anchorObject, stepNumber, stepDirection) {
            var res = $('form[name="form-wizard"]').parsley().validate('step-' + (stepNumber + 1));
            return res;
        });

        $('#wizard').keypress(function( event ) {
            if (event.which == 13 ) {
                $('#wizard').smartWizard('next');
            }
        });
    };

    var FormWizardValidation = function () {
        "use strict";
        return {
            //main function
            init: function () {
                handleBootstrapWizardsValidation();
            }
        };
    }();

</script>
</body>
</html>
