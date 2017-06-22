<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/tab.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>准备支付</title>
<%@include file="/common/head.jsp" %>
    <style type="text/css">
        .bs-callout {
            padding: 10px 20px;
            margin: 20px 0;
            border: 1px solid #eee;
            border-left-width: 5px;
            border-radius: 3px;
        }
        label{
            margin-right: 10px;
        }
    </style>
</head>
<body>
<!--导航条-->
<%@include file="/common/nav.jsp" %>
<div class="container">
    <div class="row">
        <img class="col-sm-4" style="height: 60px;width: auto" id="orderimg" src="<%=basePath%>image/${payOrder.seckillId.image}"
             alt="...">
        <div class=" col-sm-8 ">
            <h4 style="line-height: 40px">支付金额:<span style="color: #ed242e;font-size: larger">&yen;${payOrder.seckillId.price}</span> <small style="margin-left: 30px">订单编号:${payOrder.orderId}</small></h4>
        </div>

    </div>
    <hr>
    <form action="<%=basePath%>Order/pay" method="post">
        <input type="hidden" name="orderId" value="${payOrder.orderId }"/>
        <input type="hidden" name="payprice" value="${payOrder.seckillId.price }"/>
        <div class="bs-callout" style="border-left-color: #1b809e">
            <h3>选择网上银行</h3>
            <hr>
            <p>
                <label>
                    <input id="ICBC-NET-B2C" type="radio" name="yh" value="ICBC-NET-B2C" checked="checked"/>
                    <img name="ICBC-NET-B2C" align="middle" src="../../../image/bank_img/gongShang.bmp"/>
                </label>
                <label >
                    <input id="CMBCHINA-NET-B2C" type="radio" name="yh" value="CMBCHINA-NET-B2C"/>
                    <img name="CMBCHINA-NET-B2C" align="middle" src="../../../image/bank_img/cmb.bmp"/>
                </label>
                <label >
                    <input id="ABC-NET-B2C" type="radio" name="yh" value="ABC-NET-B2C"/>
                    <img name="ABC-NET-B2C" align="middle" src="../../../image/bank_img/abc.bmp"/>
                </label>

                <label >
                    <input id="CCB-NET-B2C" type="radio" name="yh" value="CCB-NET-B2C"/>
                    <img name="CCB-NET-B2C" align="middle" src="../../../image/bank_img/ccb.bmp"/>
                </label>
            </p>
            <p>
                <label>
                    <input id="BCCB-NET-B2C" type="radio" name="yh" value="BCCB-NET-B2C"/>
                    <img name="BCCB-NET-B2C" align="middle" src="../../../image/bank_img/bj.bmp"/>
                </label>
                <label >
                    <input id="BOCO-NET-B2C" type="radio" name="yh" value="BOCO-NET-B2C"/>
                    <img name="BOCO-NET-B2C" align="middle" src="../../../image/bank_img/bcc.bmp"/>
                </label>
                <label >
                    <input id="CIB-NET-B2C" type="radio" name="yh" value="CIB-NET-B2C"/>
                    <img name="CIB-NET-B2C" align="middle" src="../../../image/bank_img/cib.bmp"/>
                </label>

                <label >
                    <input id="NJCB-NET-B2C" type="radio" name="yh" value="NJCB-NET-B2C"/>
                    <img name="NJCB-NET-B2C" align="middle" src="../../../image/bank_img/nanjing.bmp"/>
                </label>
            </p>
            <p>
                <label>
                    <input id="CMBC-NET-B2C" type="radio" name="yh" value="CMBC-NET-B2C"/>
                    <img name="CMBC-NET-B2C" align="middle" src="../../../image/bank_img/cmbc.bmp"/>
                </label>
                <label >
                    <input id="CEB-NET-B2C" type="radio" name="yh" value="CEB-NET-B2C"/>
                    <img name="CEB-NET-B2C" align="middle" src="../../../image/bank_img/guangda.bmp"/>
                </label>
                <label >
                    <input id="BOC-NET-B2C" type="radio" name="yh" value="BOC-NET-B2C"/>
                    <img name="BOC-NET-B2C" align="middle" src="../../../image/bank_img/bc.bmp"/>
                </label>

                <label >
                    <input id="PINGANBANK-NET" type="radio" name="yh" value="PINGANBANK-NET"/>
                    <img name="PINGANBANK-NET" align="middle" src="../../../image/bank_img/pingan.bmp"/>
                </label>
            </p>
            <p>
                <label>
                    <input id="CBHB-NET-B2C" type="radio" name="yh" value="CBHB-NET-B2C"/>
                    <img name="CBHB-NET-B2C" align="middle" src="../../../image/bank_img/bh2.bmp"/>
                </label>
                <label >
                    <input id="HKBEA-NET-B2C" type="radio" name="yh" value="HKBEA-NET-B2C"/>
                    <img name="HKBEA-NET-B2C" align="middle" src="../../../image/bank_img/dy.bmp"/>
                </label>
                <label >
                    <input id="NBCB-NET-B2C" type="radio" name="yh" value="NBCB-NET-B2C"/>
                    <img name="NBCB-NET-B2C" align="middle" src="../../../image/bank_img/ningbo.bmp"/>
                </label>

                <label >
                    <input id="ECITIC-NET-B2C" type="radio" name="yh" value="ECITIC-NET-B2C"/>
                    <img name="ECITIC-NET-B2C" align="middle" src="../../../image/bank_img/zx.bmp"/>
                </label>
            </p>
            <p>
                <label>
                    <input id="SDB-NET-B2C" type="radio" name="yh" value="SDB-NET-B2C"/>
                    <img name="SDB-NET-B2C" align="middle" src="../../../image/bank_img/sfz.bmp"/>
                </label>
                <label >
                    <input id="GDB-NET-B2C" type="radio" name="yh" value="GDB-NET-B2C"/>
                    <img name="GDB-NET-B2C" align="middle" src="../../../image/bank_img/gf.bmp"/>
                </label>
                <label >
                    <input id="SHB-NET-B2C" type="radio" name="yh" value="SHB-NET-B2C"/>
                    <img name="SHB-NET-B2C" align="middle" src="../../../image/bank_img/sh.bmp"/>
                </label>

                <label >
                    <input id="SPDB-NET-B2C" type="radio" name="yh" value="SPDB-NET-B2C"/>
                    <img name="SPDB-NET-B2C" align="middle" src="../../../image/bank_img/shpd.bmp"/>
                </label>
            </p>
            <p>
                <label>
                    <input id="POST-NET-B2C" type="radio" name="yh" value="POST-NET-B2C"/>
                    <img name="POST-NET-B2C" align="middle" src="../../../image/bank_img/post.bmp"/>
                </label>
                <label >
                    <input id="BJRCB-NET-B2C" type="radio" name="yh" value="BJRCB-NET-B2C"/>
                    <img name="BJRCB-NET-B2C" align="middle" src="../../../image/bank_img/beijingnongshang.bmp"/>
                </label>
                <label >
                    <input id="HXB-NET-B2C" type="radio" name="yh" value="HXB-NET-B2C"/>
                    <img name="HXB-NET-B2C" align="middle" src="../../../image/bank_img/hx.bmp"/>
                </label>

                <label >
                    <input id="CZ-NET-B2C" type="radio" name="yh" value="CZ-NET-B2C"/>
                    <img name="CZ-NET-B2C" align="middle" src="../../../image/bank_img/zx.bmp"/>
                </label>
            </p>
            <div class="form-group">
                <label for="phone" class="control-label">电话:</label>
                <input type="text" class="form-control"id="phone" value="${ payOrder.userId.phone}" placeholder="${empty payOrder.userId.phone ? "您还没有保存过":null}" id="phone" name="phone">
            </div>
            <div class="form-group">
                <label for="address" class="control-label">收货地址:</label>
                <textarea class="form-control" id="address" placeholder="${empty payOrder.userId.address ? "您还没有保存过":null}" name="address">${ payOrder.userId.address}</textarea>
            </div>
        </div>
        <button type="submit" style="width: 150px" le=""class="btn btn-primary">下一步</button>
    </form>

    <hr>
    <footer style="margin-right: 60px">
        <p class="pull-right"><a href="#">
            <span class="glyphicon glyphicon-menu-up"
                  aria-hidden="true"></span> 返回顶部</a></p>

    </footer>
</div>
<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
<script src="<%=basePath%>jquery/jquery.min.js"></script>
<!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

</body>
</html>