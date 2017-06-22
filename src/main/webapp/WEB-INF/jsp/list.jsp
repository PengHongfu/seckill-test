<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/tab.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>商品列表页</title>
    <%@include file="/common/head.jsp" %>
    <!-- 个人之定义Custom styles for this template -->
    <!-- <link href="carousel.css" rel="stylesheet">-->
    <style type="text/css">
        body {
            padding-bottom: 40px;
            color: #666;
            background: #F1F1F1;
        }

        .thumbnail {
            padding: 20px 10px 0;
        }

        .thumbnail img {
            width: auto;
            height: 250px;
            -webkit-transition: -webkit-transform .3s;
            transition: -webkit-transform .3s;
            -moz-transition: transform .3s, -moz-transform .3s;
            transition: transform .3s;
            transition: transform .3s, -webkit-transform .3s, -moz-transform .3s;
        }

        /*商品列表的外包div*/
        .grid {
            padding: 0 30px;
            margin: 0 auto;
        }

        .thumbnail img:hover {
            transform: translate(0, -10px);
            -webkit-transform: translate(0, -10px);
            -moz-transform: translate(0, -10px);
            -o-transform: translate(0, -10px);
            -ms-transform: translate(0, -10px);
        }

        .col-md-3 {
            padding-left: 5px;
            padding-right: 5px;
        }

        .row {
            margin: 0;
        }

        .well {
            margin-left: 35px;
            margin-right: 35px;
        }

        .breadcrumb {
            margin-top: 0;
            margin-bottom: 0;
        }

        .navbar {
            margin: 0 35px;
        }

        .goods_link:hover {
            text-decoration: none;
        }

        .seckill-sname {
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
        .progress{
            margin-bottom: 0;
        }
        .navbar-brand img {
            margin-top: -8px;
        }
    </style>
</head>
<body>
<!--导航条-->
<%@include file="/common/nav.jsp" %>

<div class="well">
    <ol class="breadcrumb">
        <li><a href="<%=basePath%>/Seckill/main">主页</a></li>
        <li class="active">商品列表</li>
        <%--<li class="active">Data</li>--%>
    </ol>
</div>
<c:choose >
    <c:when test="${empty seckillList}">
        <h3 style="text-align: center">抱歉!没有搜索到结果...</h3>
    </c:when>
    <c:otherwise>
        <div class="grid">
            <div class="row">
                <c:forEach items="${seckillList}" var="seckill">
                    <div class="col-sm-6 col-md-3">
                        <div class="thumbnail text-center">
                            <a href="<%=basePath%>Seckill/${seckill.seckillId}/detail" class="goods_link">
                                <img src="<%=basePath%>image/${seckill.image}"
                                     alt="...">
                                <div class="caption">
                                    <p class="seckill-sname">${seckill.sname}</p>
                                    <fmt:parseNumber var="p" integerOnly="true"
                                                     type="number" value="${seckill.price}" />
                                    <h3 style="color: #d2322d;">¥${p}</h3>
                                    <div class="progress progress-striped active">
                                        <fmt:formatNumber var="i" type="percent">${(350-seckill.numbers)/350}</fmt:formatNumber>
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="30"
                                             aria-valuemin="0" aria-valuemax="100" style="width:${i}">${i}
                                        </div>
                                    </div>
                                </div>
                                <p><a class="btn btn-danger" href="<%=basePath%>Seckill/${seckill.seckillId}/detail" role="button">立即抢购 &raquo;</a></p>
                            </a>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
        <div class="text-center" style="background: #fff">
            <ul id="example"></ul>
        </div>
        <hr>
        <footer style="margin-right: 60px">
            <p class="pull-right"><a href="#">
            <span class="glyphicon glyphicon-menu-up"
                  aria-hidden="true"></span> 返回顶部</a></p>

        </footer>
    </c:otherwise>
</c:choose>

<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
<%--<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>--%>
<script src="<%=basePath%>jquery/jquery.min.js"></script>
<!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath%>bootstrap-paginator-1.0.2/bootstrap-paginator.js"></script>
<script type='text/javascript'>
    $(function () {
        var options = {
            bootstrapMajorVersion: 3,
            alignment: "center", /*居中显示*/
            size: "normal", /*格式大小*/
            currentPage: ${currentPage}, /*当前页码*/
            totalPages:${totalPages}, /*总页数*/
            numberOfPages: 5, /*显示page数量*/
            shouldShowPage: true,
            /* 是否显示特定操作按钮shouldShowPage:function (type, page, current) {
             switch(type)
             {
             case "first":
             case "last":
             return false;
             default:
             return true;
             }
             },*/
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
                    return "<%=basePath%>Seckill/list?currentPage=" + page;
                }

            }
        }


        $('#example').bootstrapPaginator(options);
    })

</script>
</body>
</html>
