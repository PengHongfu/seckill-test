<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>页面载入失败</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <!-- Bootstrap -->
    <link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        html,body{
            height: 100%;
        }
        .bs-docs-header {
            font-size: 20px;
            height: 100%;
            position: relative;
            text-align: center;
            color: #cdbfe3;
            text-shadow: 0 1px 0 rgba(0,0,0,.1);
            background-color: #6f5499;
            background-image: -webkit-gradient(linear,left top,left bottom,from(#563d7c),to(#6f5499));
            background-image: -webkit-linear-gradient(top,#563d7c 0,#6f5499 100%);
            background-image: -o-linear-gradient(top,#563d7c 0,#6f5499 100%);
            background-image: linear-gradient(to bottom,#563d7c 0,#6f5499 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#563d7c', endColorstr='#6F5499', GradientType=0);
            background-repeat: repeat-x;
        }
        .bs-docs-header h1 {
            font-size: 130px;
            margin-top: 0;
            color: #fff;
        }
        .bs-docs-header p {
            margin-bottom: 0;
            font-weight: 300;
            line-height: 1.4;
        }
    </style>
</head>
<body>
<div class="bs-docs-header" id="content" tabindex="-1">
    <div class="container" style="position: absolute;top: 40%;width: 100%">
        <h1 >${code eq 'success'?'成功':'出错了'}</h1>
        <p>${msg}...</p>
        <p><a target="_top"style="color: #fff" href="<%=basePath%>/index.jsp">主页</a></p>
    </div>
</div>
</body>
</html>
