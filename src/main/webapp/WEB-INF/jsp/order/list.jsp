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
        span.glyphicon{
            top:2px;
        }
        .panel{
            margin: 0 30px;
        }
        #orderimg{
            height:50px;
            width: auto;
        }
        .goods_link:hover{
            text-decoration: none;
        }

        .table tbody tr td{
            /*垂直居中*/
            vertical-align: middle;
        }

    </style>
</head>
<body>
<!--导航条-->
<%@include file="/common/nav.jsp" %>
<div class="panel panel-info">
    <div class="panel-heading">${sessionScope.sessionuser.loginname}的订单 </div>
    <span id="returnMessage" class="glyphicon" style="position: absolute;top: 45%;left: 45%"> </span>
    <table class="table  table-hover">
        <thead>
        <tr >
            <th>#</th>
            <th>商品信息</th>
            <th>订单时间</th>
            <th>金额</th>
            <th>订单状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="order" items="${orderList}" varStatus="sort">
            <tr>
                <td scope="row">${sort.count}</td>
                <td>
                    <a href="<%=basePath%>Seckill/${order.seckillId.seckillId}/detail" class="goods_link">
                        <img id="orderimg" src="<%=basePath%>image/${order.seckillId.image}"
                             alt="...">
                    </a>
                    <c:if test="${fn:length(order.seckillId.sname)>25}">
                        ${ fn:substring( order.seckillId.sname ,0,25)}...
                    </c:if>
                    <c:if test="${fn:length(order.seckillId.sname)<=25}">
                        ${ order.seckillId.sname}
                    </c:if>
                </td>
                <td>
                    <fmt:formatDate   value="${order.createTime}" pattern="yyyy年MM月dd日 HH:mm:ss" />
                </td>
                <fmt:parseNumber var="p" integerOnly="true"
                                 type="number" value="${order.seckillId.price}" />
                <td>¥${p}</td>
                <td>
                    <c:choose>
                        <c:when test="${order.state eq 0 }">(等待付款)</c:when>
                        <c:when test="${order.state eq 1 }">(准备发货)</c:when>
                        <c:when test="${order.state eq 2 }">(已发货)</c:when>
                        <c:when test="${order.state eq 3 }">(交易成功)</c:when>
                        <c:when test="${order.state eq 4 }">(已取消)</c:when>
                    </c:choose>
                </td>
                <td>
                    <a href="<%=basePath%>Seckill/${order.seckillId.seckillId}/detail" role="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-info-sign"></span> 查看</a>
                    <c:choose>
                        <c:when test="${order.state eq 0 }">
                            <a href="<%=basePath%>Order/topay/${order.orderId}" role="button" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-credit-card"></span>  支付</a>
                            <a  id="<%=basePath%>Order/order/${order.orderId}/4" onclick="updateBtn(this)" role="button" class="btn btn-danger btn-sm">
                                <span class="glyphicon  glyphicon-remove"></span>  取消</a>
                        </c:when>
                        <c:when test="${order.state eq 2 }">
                            <a id="<%=basePath%>Order/order/${order.orderId}/3" onclick="updateBtn(this)" role="button" class="btn btn-warning btn-sm"><span class="glyphicon  glyphicon-ok"></span>  确认收货</a>
                        </c:when>
                    </c:choose>

                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
<div class="text-center" style="background: #fff">
    <ul id="pager"></ul>
</div>
<hr>
<footer style="margin-right: 60px">
    <p class="pull-right"><a href="#">
            <span class="glyphicon glyphicon-menu-up"
                  aria-hidden="true"></span> 返回顶部</a></p>

</footer>
<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
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
            currentPage:${currentPage}, /*当前页码*/
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
                    return "<%=basePath%>Order/list?currentPage=" + page;
                }

            }
        };
        $('#pager').bootstrapPaginator(options);

    });
    function updateBtn(node) {
        var url = node.id;/*请求的url*/
        $.ajax({
            url:url,
            type:'PUT',
            success:function (result) {
                if(result){
                    window.location.reload();
                }else{
                    $("#returnMessage").html('<label class="label label-danger">修改失败</label>').show(400).delay(800).hide(500);
                }
            }
        })
    }
</script>
</body>
</html>