<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/tab.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/common/back/head.jsp" %>
    <style type="text/css">
        #seckillimg{
            width: auto;
            height: 70px;
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
                                <a class="active" href="<%=basePath%>Admin/seckillAlllist">商品列表</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>Admin/toAddSeckill">商品添加</a>
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
                                <a href="<%=basePath%>Admin/categoryAllList">分类列表</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>Admin/toaddCategory">编辑分类</a>
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
                    <h1 class="page-header">商品列表</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <table class="table  table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>商品图片</th>
                            <th>商品名称<span id="returnMessage" class="glyphicon" style="margin-left: 20px"> </span></th>
                            <th>上架时间/开启秒杀时间/结束时间</th>
                            <th>售价</th>
                            <th>所属分类</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                            <c:forEach var="seckill" items="${seckillAlllist}" varStatus="sort">
                                <tr>
                                    <td scope="row">${sort.count}</td>

                                    <td><img id="seckillimg" src="<%=basePath%>image/${seckill.image}"
                                             alt="..."></td>
                                    <td>
                                        <c:if test="${fn:length(seckill.sname)>25}">
                                            ${ fn:substring(seckill.sname ,0,25)}<br>
                                            <c:if test="${fn:length(seckill.sname)>50}">
                                                 ${ fn:substring(seckill.sname ,25,50)}<br>
                                                 ${ fn:substring(seckill.sname ,50,fn:length(seckill.sname))}
                                            </c:if>

                                            <c:if test="${fn:length(seckill.sname)<=50}">
                                                ${ fn:substring(seckill.sname ,25,fn:length(seckill.sname))}
                                            </c:if>
                                        </c:if>
                                        <c:if test="${fn:length(seckill.sname)<=25}">
                                            ${seckill.sname}
                                        </c:if>
                                    </td>
                                    <%--cid:1001
                                        start_time:2017-04-20 11:23:56.0
                                        image:57e3b072N661cd00d.jpg
                                        create_time:2017-04-19 11:28:21.0
                                        seckill_id:1
                                        sname:小米(MI)Air 13.3英寸全金属超轻薄笔记本电脑(i5-6200U 8G 256G PCIE固态硬盘 940MX独显 FHD WIN10)银
                                        price:4899.00
                                        numbers:99
                                        end_time:2017-05-18 11:24:15.0
                                        cname:电脑办公
                                        seckill_desc:4.19 10点-4.21 直降100元【i5 独立显卡】全高清窄边框 8G内存 256G固态硬盘 支持SSD硬盘扩容 薄至14.8mm 轻至1.28kg！
                                        cid:1001--%>
                                    <td><%--${seckill.create_time}--%>
                                        <%--<fmt:parseDate value="${seckill.create_time}" var="date1"/>
                                        <fmt:formatDate   value="${date1}" pattern="yyyy年MM月dd日 HH:mm:ss" />--%>
                                        <fmt:formatDate   value="${seckill.create_time}" pattern="yyyy年MM月dd日 HH:mm:ss" /> /<br>
                                        <fmt:formatDate   value="${seckill.start_time}" pattern="yyyy年MM月dd日 HH:mm:ss" /> /<br>
                                        <fmt:formatDate   value="${seckill.end_time}" pattern="yyyy年MM月dd日 HH:mm:ss" /> /
                                    </td>
                                    <th> ${seckill['price']}</th>
                                    <th>${seckill.cid}/${seckill.get("cname")}</th>
                                <td>
                                    <a href="<%=basePath%>Admin/toAddSeckill?seckillId=${seckill.seckill_id}" role="button" class="btn btn-primary btn-sm"><span
                                            class="glyphicon glyphicon glyphicon-pencil"></span> 修改</a>

                                    <a href="<%=basePath%>Admin/toAddSeckill"  role="button"
                                               class="btn btn-warning btn-sm"><span
                                                    class="glyphicon glyphicon-plus"></span> 添加</a>

                                    <a id="<%=basePath%>Admin/deleteSeckill/${seckill.seckill_id}" role="button" onclick="deleteBtn(this)"
                                       class="btn btn-danger btn-sm">
                                                <span class="glyphicon  glyphicon-remove"></span>删除</a>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                    <hr>
                    <div class="text-center" style="background: #fff">
                        <ul id="pager"></ul>
                    </div>
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
<%--BootStrap 分页--%>
<script src="<%=basePath%>bootstrap-paginator-1.0.2/bootstrap-paginator.js"></script>
<script type='text/javascript'>
    $(function () {
        var options = {
            bootstrapMajorVersion: 3,
            alignment: "center", /*居中显示*/
            size: "normal", /*格式大小*/
            currentPage:'${currentPage}', /*当前页码*/
            totalPages:'${totalPages}', /*总页数*/
            numberOfPages: 5, /*显示page数量*/
            shouldShowPage: true,
            tooltipTitles: function (type, page, current) {
                switch (type) {
                    case "first":
                        return "首页";
                    case "prev":
                        return "上一页";
                    case "next":
                        return "下一页";
                    case "last":
                        return "末页";
                    case "page":
                        return " 第" + page + "页";
                }
            },
            pageUrl: function (type, page, current) {

                if (page == current) {
                    return "javascript:void(0)";
                } else {
                    return "<%=basePath%>Admin/seckillAlllist?currentPage=" + page;
                }

            }
        };
        $('#pager').bootstrapPaginator(options);

    });
    /*todo*/
    function deleteBtn(node) {
        if(confirm("确认修改吗?")) {
            var url = node.id;
            /*请求的url*/
            $.ajax({
                url: url,
                type: 'DELETE',
                success: function (result) {
                    if (result) {
                        window.location.reload();
                    } else {
                        $('#returnMessage').hide().html('<label class="label label-danger">删除失败</label>').show(500).delay(500).hide(800);
                    }
                }
            })
        }
    }
</script>
</body>

</html>
