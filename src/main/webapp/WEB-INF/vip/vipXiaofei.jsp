
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <base href="${pageContext.request.contextPath}/static/">
    <title>unique</title>
    <link type="text/css" href="css/css.css" rel="stylesheet" />
    <script type="text/javascript" src="js/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/js.js"></script>

</head>

<body>
<%@include file="../nav.jsp"%>
<div class="mid">
    <h1 class="logo" style="text-align:left;">
        <a href="${pageContext.request.contextPath}/goods/toIndex"><img src="images/logo.png" width="304" height="74" /></a>
    </h1>
    <div class="ding-gou">
        <div class="ding">
            <a href="${pageContext.request.contextPath}/to/vip/vipOrder"><img src="images/dingdan.jpg" width="106" height="32" /></a>
        </div><!--ding/-->
        <div class="gou">
            <a href="${pageContext.request.contextPath}/cart/showItem"><img src="images/gouwuche.jpg" width="126" height="32" /></a>
        </div><!--gou/-->
        <div class="clears"></div>
    </div><!--ding-gou/-->
</div><!--mid-->
<div class="navBox navBg3">
    <ul class="nav">
        <li><a href="${pageContext.request.contextPath}/goods/toIndex">首页</a></li>

        <li><a href="${pageContext.request.contextPath}/to/vip/vip">会员中心</a></li>

        <li class="navCur"><a href="${pageContext.request.contextPath}/to/help">帮助</a></li>
        <div class="clears"></div>
    </ul><!--nav/-->
</div><!--navBox/-->

<div class="vipBox">
<%@include file="vipLeft.jsp"%>
    <div class="vipRight">
        <h2 class="vipTitle">订单详情</h2>

        <table class="orderDeatils">
            <tr>
                <th>订单编号</th>
                <td>${orders.orderId}</td>
            </tr>

            <tr>
                <th>订单价钱</th>
                <td>￥${orders.orderPrice}</td>
            </tr>
            <tr>
                <th>订单信息</th>
                <td>
                   ${orders.orderName},${orders.orderPhone},${orders.orderAddr}
                </td>
            </tr>
            <tr>
                <th>商品详情</th>
                <td>
                    ${good.gdGoods.goodsName}+${good.gdColor.colorName}+${good.gdMemory.memoryName}
                </td>
            </tr>

            <tr>
                <th>支付方式</th>
                <td>支付宝支付</td>
            </tr>
            <tr>
                <th>支付状态</th>
                <td>${orders.orderStatus.statusName}</td>
            </tr>
        </table>

    </div><!--vipRight/-->
    <div class="clears"></div>
</div><!--vipBox/-->
<div class="footBox">
    <div class="footers">
        <div class="footersLeft">
            <a href="index.html"><img src="images/ftlogo.jpg" width="240" height="64" /></a>
            <h3 class="ftphone">400 000 0000 </h3>
            <div class="ftKe">
                客服 7x24小时(全年无休)<br />
                <span>客服邮箱：kefu@webqin.net </span>
            </div><!--ftKe/-->
        </div><!--footersLeft/-->
        <div class="footersRight">
            <ul>
                <li class="ftTitle">新手指南</li>
                <li><a href="#">购物流程</a></li>
                <li><a href="#">会员计划及划分</a></li>
                <li><a href="#">优惠券规则</a></li>
                <li><a href="#">联系客服</a></li>
                <li><a href="#">常见问题</a></li>
            </ul>
            <ul>
                <li class="ftTitle">付款方式</li>
                <li><a href="#">在线支付</a></li>
                <li><a href="#">礼品卡支付</a></li>
                <li><a href="#">货到付款</a></li>
                <li><a href="#">银行付款</a></li>
            </ul>
            <ul>
                <li class="ftTitle">配送服务</li>
                <li><a href="#">配送时效及运费</a></li>
                <li><a href="#">超时赔付</a></li>
                <li><a href="#">验货与签收</a></li>
                <li><a href="#">配货信息跟踪</a></li>
            </ul>
            <ul>
                <li class="ftTitle">售后服务</li>
                <li><a href="#">退换货政策</a></li>
                <li><a href="#">退换货区域</a></li>
                <li><a href="#">退款时限</a></li>
                <li><a href="#">先行赔付</a></li>
                <li><a href="#">发票说明</a></li>
            </ul>
            <ul>
                <li class="ftTitle">特色服务</li>
                <li><a href="#">礼品卡</a></li>
                <li><a href="#">产品试用</a></li>
                <li><a href="#">花粉中心</a></li>
                <li><a href="#">快速购物</a></li>
                <li><a href="#">推荐好友</a></li>
            </ul>

            <div class="clears"></div>
        </div><!--footersRight/-->
        <div class="clears"></div>
    </div><!--footers/-->
</div><!--footBox/-->
<div class="footer" style="text-align:left;">
    <a href="#">关于我们</a>
    <a href="#">友情链接</a>
    <a href="#">版权声明</a>
    <a href="#">网站地图</a>
    <br />
    <span>&copy; 2014 Unqezi 使用前必读 沪ICP备 12007626号-1</span>
</div><!--footer/-->
</body>
</html>

