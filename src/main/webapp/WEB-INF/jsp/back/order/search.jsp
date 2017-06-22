<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/tab.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/common/back/head.jsp"%>
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
                            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend<%=basePath%>bootstrap/back.</div>
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
                            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend<%=basePath%>bootstrap/back.</div>
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
                            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend<%=basePath%>bootstrap/back.</div>
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
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
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
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
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
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
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
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
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
                    <li>
                        <a href="##"><i class="fa fa-bar-chart-o fa-fw"></i> 商品管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=basePath%>Admin/seckillAlllist">商品列表</a>
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
                                <a href="<%=basePath%>/Admin/categoryAllList">分类列表</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/Admin/toaddCategory">编辑分类</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li class="active">
                        <a href="#"><i class="fa fa-files-o fa-fw"></i>订单管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a  href="<%=basePath%>Admin/orderAlllist">订单列表</a>
                            </li>
                            <li>
                                <a class="active" href="<%=basePath%>Admin/toorderSearch">订单查询</a>
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
                    <h1 class="page-header">订单查询</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            请输入查询条件
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <%--加position是为了定位到下方 tr id="position">--%>
                                    <form action="<%=basePath%>Admin/orderSearch#position" method="post">
                                        <div class="form-group">
                                            <label>订单号</label>
                                            <input class="form-control" value="${orderId}" name="orderId">
                                        </div>
                                        <div class="form-group">
                                            <label>商品名</label>
                                            <input class="form-control" value="${sname}" name="sname" >
                                        </div>
                                        <div class="form-group">
                                            <label>用户名</label>
                                            <input class="form-control" value="${loginname}" name="loginname"  >
                                        </div>
                                        <div class="form-group">
                                            <label>订单创建时间</label>
                                            <input class="form-control" value="${createTime}" name="createTime" >
                                        </div>
                                        <button type="submit" class="btn btn-default">查询</button>
                                        <button type="reset" class="btn btn-default">重置</button>
                                    </form>
                                </div>

                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
            </div>
            <hr>
           <c:choose>
               <c:when test="${empty orderAllList}">
                   <h3 style="text-align: center">请搜索/没有查询到结果...</h3>
               </c:when>
               <c:otherwise>
                   <div class="row">
                       <div class="col-lg-12">
                           <table class="table  table-hover">
                               <thead>
                               <tr id="position">
                                   <th>#</th>
                                   <th>订单号</th>
                                   <th>订单时间</th>
                                   <th>订单状态</th>
                                   <th>商品id/用户id</th>
                                   <th>操作</th>
                               </tr>
                               </thead>
                               <tbody>

                               <c:forEach var="order" items="${orderAllList}" varStatus="sort">
                                   <tr>
                                       <td scope="row">${sort.count}</td>

                                       <td>
                                           <c:if test="${fn:length(order.orderId)>20}">
                                               ${ fn:substring( order.orderId ,0,20)}...
                                           </c:if>
                                           <c:if test="${fn:length(order.orderId)<=20}">
                                               ${order.orderId}
                                           </c:if>
                                       </td>
                                       <td>
                                           <fmt:formatDate   value="${order.createTime}" pattern="yyyy年MM月dd日 HH:mm:ss" />
                                       </td>
                                       <td>
                                           <c:choose>
                                               <c:when test="${order.state eq 0 }">(等待付款)</c:when>
                                               <c:when test="${order.state eq 1 }">(准备发货)</c:when>
                                               <c:when test="${order.state eq 2 }">(已发货)</c:when>
                                               <c:when test="${order.state eq 3 }">(交易成功)</c:when>
                                               <c:when test="${order.state eq 4 }">(已取消)</c:when>
                                           </c:choose>
                                       </td>
                                       <td><c:if test="${fn:length(order.seckillId.sname)>10}">
                                           ${ fn:substring( order.seckillId.sname,0,10)}...
                                       </c:if>
                                           <c:if test="${fn:length(order.seckillId.sname)<=10}">
                                               ${order.seckillId.sname}
                                           </c:if>/
                                           ${order.userId.loginname}

                                       </td>
                                       <td>
                                           <a href="<%=basePath%>Seckill/${order.seckillId.seckillId}/detail" role="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-info-sign"></span> 查看</a>
                                           <c:choose>
                                               <c:when test="${order.state eq 1 }">
                                                   <a id="<%=basePath%>Admin/order/${order.orderId}/2" onclick="updateBtn(this)" role="button" class="btn btn-warning btn-sm"><span class="glyphicon  glyphicon-ok"></span>  发货</a>

                                               </c:when>
                                               <c:when test="${order.state ne 4 }">
                                                   <a  id="<%=basePath%>Admin/order/${order.orderId}/4" onclick="updateBtn(this)" role="button" class="btn btn-danger btn-sm">
                                                       <span class="glyphicon  glyphicon-remove"></span>  取消</a>
                                               </c:when>
                                           </c:choose>

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
               </c:otherwise>
           </c:choose>
            <!-- /.row -->
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
                    return "<%=basePath%>Admin/orderSearch?currentPage=" + page+"#position";
                }

            }
        };
        $('#pager').bootstrapPaginator(options);

    });
    function updateBtn(node) {
        if(confirm("确认修改吗?")) {
            var url = node.id;
            /*请求的url*/
            $.ajax({
                url: url,
                type: 'PUT',
                success: function (result) {
                    if (result) {
                        window.location.reload();
                    } else {
                        alert("修改失败");
                    }
                }
            })
        }
    }
</script>
</body>

</html>
