<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/tab.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/common/back/head.jsp" %>
    <link href="<%=basePath%>bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>bootstrap-fileinput/css/fileinput.min.css" />
    <style type="text/css">
        body{
            padding-bottom: 40px;
        }
    </style>
</head>

<body>
<div id="wrapper">
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="##">秒杀后台管理系统</a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-messages">
                    <li>
                        <a href="#">
                            <div>
                                <strong>John Smith</strong>
                                <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                            </div>
                            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque
                                eleifend<%=basePath%>bootstrap/back.
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <strong>John Smith</strong>
                                <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                            </div>
                            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque
                                eleifend<%=basePath%>bootstrap/back.
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <strong>John Smith</strong>
                                <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                            </div>
                            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque
                                eleifend<%=basePath%>bootstrap/back.
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>Read All Messages</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-messages -->
            </li>
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-tasks">
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>Task 1</strong>
                                    <span class="pull-right text-muted">40% Complete</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                        <span class="sr-only">40% Complete (success)</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>Task 2</strong>
                                    <span class="pull-right text-muted">20% Complete</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                        <span class="sr-only">20% Complete</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>Task 3</strong>
                                    <span class="pull-right text-muted">60% Complete</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        <span class="sr-only">60% Complete (warning)</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>Task 4</strong>
                                    <span class="pull-right text-muted">80% Complete</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                        <span class="sr-only">80% Complete (danger)</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>See All Tasks</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-tasks -->
            </li>
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-comment fa-fw"></i> New Comment
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                <span class="pull-right text-muted small">12 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-envelope fa-fw"></i> Message Sent
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-tasks fa-fw"></i> New Task
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>See All Alerts</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-alerts -->
            </li>
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> 我的设置</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="搜索">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                        <!-- /input-group -->
                    </li>
                    <li>
                        <a href="<%=basePath%>Admin/main"><i class="fa fa-dashboard fa-fw"></i> 主页</a>
                    </li>
                    <li class="active">
                        <a href="##"><i class="fa fa-bar-chart-o fa-fw"></i> 商品管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=basePath%>Admin/seckillAlllist">商品列表</a>
                            </li>
                            <li>
                                <a class="active" href="<%=basePath%>Admin/toAddSeckill">商品添加</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>Admin/toseckillSearch">商品查询</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <!-- /.nav-second-level -->
                    <li>
                        <a href="#"><i class="fa fa-files-o fa-fw"></i>分类管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a  href="<%=basePath%>Admin/categoryAllList">分类列表</a>
                            </li>
                            <li>
                                <a  href="<%=basePath%>Admin/toaddCategory">编辑分类</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-files-o fa-fw"></i>订单管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=basePath%>Admin/orderAlllist">订单列表</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>Admin/toorderSearch">订单查询</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-files-o fa-fw"></i>用户管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=basePath%>Admin/userList">用户列表</a>
                            </li>
                            <%--<li>
                                <a href="<%=basePath%>Admin/toorderSearch">订单查询</a>
                            </li>--%>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>
    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">添加商品</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <form class="form-horizontal" action="<%=basePath%>Admin/AddSeckill" method="post" enctype="multipart/form-data" >

                        <div class="form-group">
                            <label for="input1" class="col-md-3 col-sm-3 control-label">商品名称</label>
                            <div class="col-md-5 col-sm-5">
                                <input type="text" class="form-control" value="${editSeckill.sname}" name="sname" id="input1" >
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="input2" class="col-md-3 col-sm-3 control-label">商品描述</label>
                            <div class="col-md-5 col-sm-5">
                                <input type="text" class="form-control" value="${editSeckill.seckillDesc}" name="seckillDesc" id="input2" >
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="input3" class="col-md-3 col-sm-3 control-label">价格</label>
                            <div class="col-md-5 col-sm-5">
                                <input type="text" class="form-control" value="${editSeckill.price}" name="price" id="input3" >
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="input4" class="col-md-3 col-sm-3 control-label">商品库存</label>
                            <div class="col-md-5 col-sm-5">
                                <input type="text" class="form-control" value="${editSeckill.numbers}" name="numbers" id="input4" >
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="datetimeStart" class="col-md-3 col-sm-3 control-label">秒杀开启时间</label>
                            <div style="padding: 0 15px" class="input-group date form_datetime1 col-md-5 col-sm-5" data-date="1979-09-16T05:25:07Z">
                                <fmt:formatDate   var="s" value="${editSeckill.startTime}" pattern="yyyy年MM月dd日 HH:mm:ss" />
                                <input type="text" size="16" class="form-control" value="${s}" name="startTime" id="datetimeStart" readonly >
                                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="datetimeEnd" class="col-md-3 col-sm-3 control-label">秒杀结束时间</label>
                            <div style="padding: 0 15px" class="input-group date form_datetime2 col-md-5 col-sm-5" data-date="1979-09-16T05:25:07Z">
                                <fmt:formatDate   var="e" value="${editSeckill.endTime}" pattern="yyyy年MM月dd日 HH:mm:ss" />
                                <input type="text" size="16" class="form-control" value="${e}" name="endTime" id="datetimeEnd" readonly>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="input7" class="col-md-3 col-sm-3 control-label">所属分类</label>
                            <div class="col-md-5 col-sm-5">

                                <select id="input7" name="cid" class=" show-tick form-control">
                                        <c:forEach items="${categorySort}" var="category">
                                            <option value="${category.cid}" selected="${editSeckill.cid eq category.cid ? "selected":""}">${category.cname}</option>
                                        </c:forEach>

                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="img-file" class="col-md-3 col-sm-3 control-label">图片</label>
                            <div class="col-md-9 col-sm-9">
                                <%--todo怎么回显图片--%>
                                <input id="img-file"  type="file" name="file" value="${editSeckill.image}" data-min-file-count="1">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-3 col-md-5 col-sm-5">
                                <p class="text-warning small">${addError}</p>
                            <button type="submit" class="btn btn-default">${empty editSeckill ?"添加":"修改"}</button>
                            <button type="reset" class="btn btn-default">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>

        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->
<!-- jQuery -->
<!--<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>-->
<script src="<%=basePath%>bootstrap/back/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>bootstrap/back/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>bootstrap/back/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="<%=basePath%>bootstrap/back/vendor/raphael/raphael.min.js"></script>
<%--<script src="<%=basePath%>bootstrap/back/data/morris-data.js"></script>--%>

<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>bootstrap/back/dist/js/sb-admin-2.js"></script>

<script type="text/javascript" src="<%=basePath%>bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap-fileinput/js/fileinput.min.js"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap-fileinput/js/locales/zh.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

        $('#img-file').fileinput({
            language: 'zh',
            uploadUrl: '<%=basePath%>/Admin/uploadImg',
            browseClass:"btn btn-primary", //按钮样式
            allowedFileExtensions: ['jpg', 'png', 'gif'],
            maxFileCount:1, //表示允许同时上传的最大文件个数
        });
        $('#img-file').on('fileerror', function(event, data, msg) {
            console.log(data.id);
            console.log(data.index);
            console.log(data.file);
            console.log(data.reader);
            console.log(data.files);
            // get message
            alert(msg);

        });
        $('#img-file').on('filepreupload', function(event, data, previewId, index) {
            var form = data.form, files = data.files, extra = data.extra,
                response = data.response, reader = data.reader;
            console.log('File pre upload triggered form '+form+" ，" +
                ",files："+files+",extra： "+extra+",response："+response+",reader： "+reader);
            console.log("response.status:"+response.status+",response.id:"+response.id);
            console.log("data.data:"+data.data);
            console.log("data.console:"+data.console);
            console.log("response.isSimulated:"+response.isSimulated);


        });

        $(".form_datetime1").datetimepicker({
            language:  'zh-CN',
            format: "yyyy-mm-dd hh:ii:ss",
            autoclose: true,
            todayBtn: true,
            startView:3,
            startDate: new Date,
            /*endDate:,*/
            minuteStep: 10
        }).on("click",function(){
            $("#datetimeStart").datetimepicker("setEndDate",$("#datetimeEnd").val())
        });
        $(".form_datetime2").datetimepicker({
            language:  'zh-CN',
            format: "yyyy-mm-dd hh:ii:ss",
            autoclose: true,
            todayBtn: true,
            startView:3,
            startDate: new Date,
            /*endDate:,*/
            minuteStep: 10
        }).on("click",function(){
            $("#datetimeEnd").datetimepicker("setStartDate",$("#datetimeStart").val())
        });
    });

</script>
</body>

</html>
