<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/tab.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>秒杀主页</title>
    <%@include file="/common/head.jsp" %>
    <style>

        body {
            font-family: -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", Roboto,
            "Helvetica Neue", Arial, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", sans-serif;
            padding-top: 50px;
            padding-bottom: 40px;
        }
        /* 轮播广告 */

        .carousel {
            height: 450px;
            background-color: #000;
            margin-bottom: 60px;

        }

        .carousel .item {
            height: 450px;
            background-color: #000;
        }

        .carousel-caption p {
            margin-bottom: 20px;
            font-size: 20px;
            line-height: 1.8;
        }

        .carousel-caption {
            z-index: 10;
        }

        /* 简介*/

        .summary {

            padding-right: 15px;
            padding-left: 15px;
        }

        .container .col-md-3 {
            padding-left: 20px;
            padding-right: 20px;
        }

        /*hr*/
        .mydivider {
            margin: 40px;

        }

        /* 特性*/
        .feature {
            padding: 30px 0;
        }

        /*标签页*/
        .feature-heading { /*h2标签*/
            font-size: 50px;
            color: #276596;

        }

        .feature-heading .text-muted { /*副标题*/
            font-size: 28px;
            color: #999;
        }

        .navbar-brand img {
            margin-top: -8px; /*图标居中*/
        }
        .seckill-sname {/*商品名称最多两行*/
            font-size: 14px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            font-weight: 400;
            line-height: 20px;
            height: 40px;
            overflow: hidden;
            white-space: pre-wrap;
            text-overflow: ellipsis;
        }
    </style>
</head>
<body>
<!--导航条-->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="demo-navbar">
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
                <li class="active"><a href="#slidershow">主页 </a></li>
                <li><a href="<%=basePath%>Seckill/list">全部</a></li>
                <li class="dropdown">
                    <a href="##" class="dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">分类<span
                            class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
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

<!--图片轮播-->
<div id="slidershow" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#slidershow" data-slide-to="0" class="active"></li>
        <li data-target="#slidershow" data-slide-to="1"></li>
        <li data-target="#slidershow" data-slide-to="2"></li>
        <li data-target="#slidershow" data-slide-to="3"></li>
    </ol>
    <!-- 设置轮播图片 -->
    <div class="carousel-inner">
        <div class="item active">
            <a href="##"><img class="img-responsive" src="<%=basePath%>image/mainpage/TB2ZqjWjhRDOuFjSZFzXXcIipXa.jpg" alt="1 slide"></a>
            <%--<div class="carousel-caption">
                <h1>Chrome</h1>
                <p>Google Chrome，又称Google浏览器，是一个由Google（谷歌）公司开发的网页浏览器。</p>
                <p><a class="btn btn-lg btn-primary" href="http://www.google.cn/intl/zh-CN/chrome/browser/"
                      role="button" target="_blank">点我下载</a></p>
            </div>--%>
        </div>
        <div class="item ">
            <a href="##"><img  class="img-responsive" src="<%=basePath%>image/mainpage/xmad_14890540384283_nQsCx.jpg" alt="1 slide"></a>

        </div>
        <div class="item ">
            <a href="##"><img  class="img-responsive" src="<%=basePath%>image/mainpage/xmad_14931177925231_aMKNm.jpg" alt="1 slide"></a>
        </div>
        <div class="item ">
            <a href="##"><img  class="img-responsive" src="<%=basePath%>image/mainpage/xmad_14931996220958_VTSRL.jpg" alt="1 slide"></a>
        </div>

        <!-- 设置轮播图片控制器 -->
        <a class="left carousel-control" href="#slidershow" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="right carousel-control" href="#slidershow" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>
</div><!--图片轮播结束-->

<div class="container summary">
    <!-- 简介-->
    <div class="container text-center" id="sumary-container">
        <div class="row">
            <c:forEach items="${fourseckill}" var="seckill">
            <div class="col-md-3">
                <img style="height: 140px;width:auto" src="<%=basePath%>image/${seckill.image}" alt="">
                <h3>
                    <c:if test="${fn:length(seckill.sname)>10}">
                        ${ fn:substring( seckill.sname ,0,10)}...
                    </c:if>
                    <c:if test="${fn:length(seckill.sname)<=10}">
                        ${ seckill.sname}
                    </c:if>
                </h3>
                <p class="seckill-sname">${seckill.sname}</p>
                <p><a class="btn btn-default" href="<%=basePath%>Seckill/${seckill.seckillId}/detail" role="button">查看详情</a></p>
            </div>
            </c:forEach>
        </div>
    </div>
    <hr class="mydivider">
    <div>
        <!-- 标签页 -->
        <ul class="nav nav-tabs" role="tablist" id="tab-list">
            <li class="active"><a href="#1" role="tab" data-toggle="tab">1</a></li>
            <li><a href="#2" role="tab" data-toggle="tab">2</a></li>
            <li><a href="#3" role="tab" data-toggle="tab">3</a></li>
            <li><a href="#4" role="tab" data-toggle="tab">4</a></li>
            <li><a href="#5" role="tab" data-toggle="tab">5</a></li>
        </ul>
        <div class="tab-content">
        <c:forEach items="${fiveseckill}" var="seckill2" varStatus="index">

                <div class="tab-pane ${index.count==1? "active":""}" id="${index.count}">
                    <div class="row feature">
                        <div class="col-md-7">
                            <h3 class="feature-heading">
                                <c:if test="${fn:length(seckill2.sname)>20}">
                                    ${ fn:substring( seckill2.sname ,0,20)}...
                                </c:if>
                                <c:if test="${fn:length(seckill2.sname)<=20}">
                                    ${ seckill2.sname}
                                </c:if>
                                <span class="text-muted">最多参与</span></h3>
                            <p class="lead">${seckill2.seckillDesc}</p>
                        </div>
                        <div class="col-md-5">
                            <img class="feature-image img-responsive" src="<%=basePath%>image/${seckill2.image}"
                                 alt="Chrome">
                        </div>
                    </div>
                </div>

        </c:forEach>
        </div>
    </div>

    <hr class="mydivider">

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

    <footer>
        <p class="pull-right"><a href="#">
            <span class="glyphicon glyphicon-menu-up"
                  aria-hidden="true"></span> 返回顶部</a></p>

    </footer>


</div>

<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
<script src="../../jquery/jquery.min.js"></script>
<!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        $("#demo-navbar .dropdown-menu li a").click(function () {
            var href = $(this).attr("href");
            /* alert("#tab-list a[href='" + href + "']");*/
            $("#tab-list a[href='" + href + "']").tab("show")
        });
        //关闭click.bs.dropdown.data-api事件，使顶级菜单可点击
        $(document).off('click.bs.dropdown.data-api');
        //自动展开
        $(' li.dropdown').mouseenter(function () {
            $(this).addClass('open');
        });
        //自动关闭
        $(' li.dropdown').mouseleave(function () {
            $(this).removeClass('open');
        });

    });


</script>
</body>
</html>
