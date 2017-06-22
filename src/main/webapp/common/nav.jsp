<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default" role="navigation" id="demo-navbar">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <div class="navbar-brand" href="<%=basePath%>/Seckill/main">
                <span class="glyphicon glyphicon-fire" style="color: #ed4649"></span>
            </div>
            <!-- button是屏幕小时，显示的三条杆 -->
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">秒杀网站</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="<%=basePath%>Seckill/main">主页 </a></li>
                <li><a href="<%=basePath%>Seckill/list">全部</a></li>
                <li class="dropdown">
                    <a href="##" class="dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">分类<span
                            class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                        <li class="dropdown-header">商品分类</li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="<%=basePath%>Seckill/category/1001">电脑办公</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="<%=basePath%>Seckill/category/1002">生活电器</a></li>
                        <!--<li class="nav-divider"></li> 分隔符-->
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="<%=basePath%>Seckill/category/1003">手机通讯</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="<%=basePath%>Seckill/category/1004">家居家装</a></li>

                    </ul>
                </li>
                <li><a data-toggle="modal" href="#mymodal-data">关于</a></li>

            </ul>

            <form class="navbar-form navbar-left" action="<%=basePath%>Seckill/search">
                <div class="form-group">
                    <input type="text" name="sname" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <!--判断是否登录，显示登录或者欢迎-->

            <ul class="nav navbar-nav">
                <c:choose>
                    <c:when test="${empty sessionScope.sessionuser}">
                        <li><a data-toggle="modal" href="<%=basePath%>User/tologin">请登录</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a data-toggle="modal" href="#">欢迎 ${sessionScope.sessionuser.loginname}</a></li>
                        <li><a data-toggle="modal" href="<%=basePath%>Order/list">我的订单</a></li>
                        <li><a data-toggle="modal" href="<%=basePath%>User/mymsg">我的信息</a></li>
                        <li><a data-toggle="modal" href="<%=basePath%>User/exit">退出登录</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!--关于-->
<div class="modal fade" id="mymodal-data" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span
                        aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">关于</h4>
            </div>
            <div class="modal-body">
                <p>“让每个人都能享受科技的乐趣”是小米公司的愿景。小米公司应用了互联网开发模式开发产品的模式，用极客精神做产品，
                    用互联网模式干掉中间环节，致力于让全球每个人，都能享用来自中国的优质科技产品。</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">了解</button>

            </div>
        </div>
    </div>
</div>