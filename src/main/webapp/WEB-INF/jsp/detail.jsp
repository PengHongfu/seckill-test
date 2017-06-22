<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/tab.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>商品详情页</title>
<%@include file="/common/head.jsp" %>
    <style type="text/css">
        .content-image {
            max-height: 400px;
            width: auto;
        }

        .content {
            padding-top: 5%;
        }

        .lead {
            margin-bottom: 0;
        }
        .countdowntime{
            margin: 0;
        }
        .form-inline button{
            margin-left: 30px;
        }
        .dt{
            padding-left: 10px;
            font-family: simsun;
            color: #999;
        }
        .alert{
            margin-bottom: 0;
        }
        .navbar-brand img {
            margin-top: -8px;
        }
        .dt{
            padding-left: 10px;
            font-family: simsun;
            color: #999;
        }
            /*loading*/
        #loading {
            background-color: #FFFFFF;
            height: 100%;
            width: 100%;
            position: fixed;
            z-index: 1;
            margin-top: 0px;
            top: 0px;
        }

        #loading-center {
            width: 100%;
            height: 100%;
            position: relative;
        }

        #loading-center-absolute {
            position: absolute;
            left: 50%;
            top: 50%;
            height: 200px;
            width: 200px;
            margin-top: -100px;
            margin-left: -100px;

        }

        .object {
            -moz-border-radius: 50% 50% 50% 50%;
            -webkit-border-radius: 50% 50% 50% 50%;
            border-radius: 50% 50% 50% 50%;
            position: absolute;
            border: 5px solid transparent;
            border-right-color:rgba(239,74,74,1);
            border-left-color: rgba(239,74,74,1);
            -webkit-animation: animate 2s infinite;
            animation: animate 2s infinite;
        }

        #object_one {
            left: 75px;
            top: 75px;
            width: 50px;
            height: 50px;
        }

        #object_two {
            left: 65px;
            top: 65px;
            width: 70px;
            height: 70px;
            -webkit-animation-delay: 0.1s;
            animation-delay: 0.1s;
        }

        #object_three {
            left: 55px;
            top: 55px;
            width: 90px;
            height: 90px;
            -webkit-animation-delay: 0.2s;
            animation-delay: 0.2s;
        }

        #object_four {
            left: 45px;
            top: 45px;
            width: 110px;
            height: 110px;
            -webkit-animation-delay: 0.3s;
            animation-delay: 0.3s;

        }

        @-webkit-keyframes animate {

            50% {
                -ms-transform: rotate(180deg);
                -webkit-transform: rotate(180deg);
                transform: rotate(180deg);
            }

            100% {
                -ms-transform: rotate(0deg);
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }

        }

        @keyframes animate {

            50% {
                -ms-transform: rotate(180deg);
                -webkit-transform: rotate(180deg);
                transform: rotate(180deg);
            }

            100% {
                -ms-transform: rotate(0deg);
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }

        }
    </style>
</head>
<!--导航条-->
<%@include file="/common/nav.jsp" %>

<div class="container">

    <div class="row feature">
        <p>
        <div class=" col-sm-5 col-md-5">
            <img class="content-image img-responsive" src="<%=basePath%>image/${seckill.image}"
                 alt="Chrome">
        </div>
        <div class="col-sm-5 col-md-7 content">
            <p class="lead">${seckill.sname}<span class="text-muted"></span>
            </p>
            <p class="small" style="color: #d2322d;overflow: hidden;text-overflow: ellipsis;white-space: nowrap">
                ${seckill.seckillDesc}
            </p>
            <div class="alert alert-danger  text-center" role="alert">
                <h4 class="countdowntime">
                    <span class="glyphicon" id="seckill-box"></span>
                </h4>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div> <span class="dt">价格: </span>  <span style="color: #E4393C;">¥</span><span style="font-size: 22px;color: #E4393C;">${seckill.price}</span></div>
                    <span class="dt"> 秒杀商品,限购一件</span>
                </div>
            </div>

            <%--<form class="form-inline">
                <div class="form-group ">
                    <input type="text" class="form-control text-center" id="exampleInputEmail2" value="1" placeholder=" "><span>件</span>
                </div>
                <button id="addCart" class="btn  btn-danger ">立即抢购</button>
            </form>--%>
            <div class="text-center"><button id="seckillBtn" class="btn  btn-danger ">立即抢购</button></div>

        </div>
    </div>

    <!-- Modal弹出层 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--右上角关闭按钮--%>
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>--%>
                    <h4 class="modal-title" id="myModalLabel">提示信息</h4>
                </div>
                <div class="modal-body text-center" >
                    <span style="font-size: 20px">您还没有登录呢</span>
                </div>
                <div class="modal-footer" style="margin-top: 0">
                    <!--验证信息-->
                    <span id="killPhoneMessage" class="glyphicon"> </span>
                    <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
                    <a type="button" href="<%=basePath%>User/tologin?backseckillId=${seckill.seckillId}" class="btn btn-default" role="button">登录</a>
                </div>
            </div>
        </div>
    </div>

    <%--<hr>
    <footer style="margin-right: 60px">
        <p class="pull-right"><a href="#">
            <span class="glyphicon glyphicon-menu-up"
                  aria-hidden="true"></span> 返回顶部</a></p>

    </footer>--%>
</div>

<div id="loading">
    <div id="loading-center">
        <div id="loading-center-absolute">
            <div class="object" id="object_four"></div>
            <div class="object" id="object_three"></div>
            <div class="object" id="object_two"></div>
            <div class="object" id="object_one"></div>

        </div>
    </div>
</div>

<body>
<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
<%--<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>--%>
<script src="../../jquery/jquery.min.js"></script>
<!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<%--jQuery countDown倒计时插件--%>
<%--<script src="http://cdn.bootcss.com/jquery.countdown/2.1.0/jquery.countdown.min.js"></script>--%>
<script src="../../jquery/jquery.countdown.min.js"></script>
<script src="../../common/js/detail.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").hide();

        //使用EL表达式传入参数
        detail.init({
            seckillId:${seckill.seckillId},
            startTime:${seckill.startTime.time},//毫秒
            endTime:${seckill.endTime.time},
            nowtimeUrl:"<%=basePath%>Seckill/time/now",
            loginisTrue:${ empty sessionScope.sessionuser},
            exposerUrl:"<%=basePath%>Seckill/${seckill.seckillId}/exposer",
            /*格式为Seckill/{seckillId}/{md5}/execution*/
            killUrl:"<%=basePath%>Seckill/${seckill.seckillId}/"
        });
    });

    $("#seckillBtn").click(function () {
        if(!$(this).hasClass("disabled")){
            $("#loading").show();
            $("#loading").delay(3000).fadeOut(500);
        }
    })
</script>
</body>
</html>
