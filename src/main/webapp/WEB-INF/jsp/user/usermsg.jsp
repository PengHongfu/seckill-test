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

            font-family: -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", sans-serif;
            padding-bottom: 40px;
        }
        .bs-callout {
            padding:10px 20px;
            margin: 20px 0;
            border: 1px solid #eee;
            border-left-width: 5px;
            border-radius: 3px;
        }
        .bs-callout p{
            line-height: 1.75;
        }
    </style>
</head>
<body>

<!--导航条-->
<%@include file="/common/nav.jsp" %>
<div class="container">
    <h2 class="text-muted">用户信息</h2>
    <div class="bs-callout" style="border-left-color: #1b809e">
        <h3>用户名</h3>
        <p>${usermsg.loginname} </p>
    </div>
    <div class="bs-callout" style="border-left-color: #1b809e">
        <h3 >Email</h3>
        <p>${usermsg.email}</p>
    </div>
    <div class="bs-callout" style="border-left-color: #1b809e">
        <h3>电话</h3>
        <p>
            <c:choose >
                <c:when test="${empty usermsg.phone}">
                    您还没有填写您的电话呢！
                </c:when>
                <c:otherwise>
                    ${ usermsg.phone}
                </c:otherwise>
            </c:choose>
        </p>
    </div>
    <div class="bs-callout" style="border-left-color: #1b809e">
        <h3>收货地址</h3>
        <p>
            <c:choose >
                <c:when test="${empty usermsg.address}">
                    您还没有填写您的收获地址呢！
                </c:when>
                <c:otherwise>
                    ${ usermsg.address}
                </c:otherwise>
            </c:choose>
        </p>
    </div>
    <div class="btn-group btn-group-justified" role="group" aria-label="...">
        <div class="btn-group" role="group">
            <a href="<%=basePath%>Order/list" type="button" class="btn btn-primary">我的订单</a>
        </div>
        <div class="btn-group" role="group">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#msgModal">修改信息</button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#pwdModal">修改密码</button>
        </div>
    </div>
</div>

<div class="modal fade " id="msgModal" tabindex="-1" role="dialog" aria-labelledby="msgModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="msgModalLabel">用户信息修改</h4>
            </div>

            <div class="modal-body">
                <form id="updateform">
                    <div class="form-group">
                        <input type="hidden" class="form-control"  value="${usermsg.uid}" name="uid">
                    </div>
                    <div class="form-group">
                        <label for="loginname" class="control-label">用户名:</label>
                        <input type="text" class="form-control" id="loginname" value="${usermsg.loginname}" name="loginname">
                    </div>
                    <div class="form-group">
                        <label for="email" class="control-label">Email:</label>
                        <input type="text" class="form-control"  value="${usermsg.email}" id="email" name="email">
                    </div>
                    <div class="form-group">
                        <label for="phone" class="control-label">电话:</label>
                        <input type="text" class="form-control"id="phone" value="${ usermsg.phone}" placeholder="${empty usermsg.phone ? "您还没有保存过":null}" id="phone" name="phone">
                    </div>
                    <div class="form-group">
                        <label for="address" class="control-label">收货地址:</label>
                        <textarea class="form-control" id="address" placeholder="${empty usermsg.address ? "您还没有保存过":null}" name="address">${ usermsg.address}</textarea>
                    </div>
                    <div class="text-right">
                        <span id="returnMessage" class="glyphicon"> </span>
                        <button type="button" class="btn btn-default right" data-dismiss="modal">关闭</button>
                        <button id="updateBtn" type="button" class="btn btn-primary">修改</button>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade " id="pwdModal" tabindex="-1" role="dialog" aria-labelledby="pwdModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="pwdModalLabel">用户密码修改</h4>
            </div>

            <div class="modal-body">
                <form id="pwdform">
                    <div class="form-group">
                        <input type="hidden" class="form-control"  value="${usermsg.uid}" name="uid">
                    </div>
                    <div class="form-group">
                        <label for="旧密码" class="control-label">旧密码:</label>
                        <input type="text" class="form-control" id="旧密码" name="oldloginpass">
                    </div>
                    <div class="form-group">
                        <label for="新密码" class="control-label">新密码:</label>
                        <input type="password" class="form-control" id="新密码" name="newloginpass">
                    </div>
                    <div class="form-group">
                        <label for="确认密码" class="control-label">确认密码:</label>
                        <input type="password" class="form-control" id="确认密码" name="repeatloginpass">

                    </div>

                    <div class="text-right">
                        <span id="returnpwdMessage" class="glyphicon"> </span>
                        <button type="button" class="btn btn-default right" data-dismiss="modal">关闭</button>
                        <button id="modifyPwdBtn" type="button" class="btn btn-primary">修改</button>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>bootstrapvalidator/vendor/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>bootstrapvalidator/vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>bootstrapvalidator/dist/js/bootstrapValidator.js"></script>
<script src="<%=basePath%>common/js/user/usermsg.js" type="text/javascript"></script>
<script type='text/javascript'>
   $(document).ready(function () {
       usermsg.init({
           basePath:'<%=basePath%>'
       });
   })
</script>
</body>
</html>