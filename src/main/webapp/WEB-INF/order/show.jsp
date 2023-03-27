<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>手机商场</title>
    <base href="${pageContext.request.contextPath}/static/">
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
    <form action="#" method="get" class="subBox">
        <div class="subBox2">
            <input type="text" class="subText" />
            <input type="image" src="images/sub.jpg" width="95" height="32" class="subImg" />
            <div class="hotci">
                <a href="#">酷派大神</a>
                <a href="#">三星s5</a>
                <a href="#">诺基亚1020</a>
                <a href="#">Iphone 6</a>
                <a href="#">htc one</a>
            </div><!--hotci/-->
        </div><!--subBox2/-->
    </form><!--subBox/-->
    <div class="ding-gou">
        <div class="ding">
            <a href="${pageContext.request.contextPath}/vip/vipOrder"><img src="images/dingdan.jpg" width="106" height="32" /></a>
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
<div class="car">
    <div class="cont">
        <div class="carImg"><img src="images/car2.jpg" width="961" height="27" /></div>
        <h4 class="orderTitle">订单信息</h4>
        <table class="orderList">
            <tr>
                <th width="175">${order.orderId}</th>
                <th width="80">${order.orderName}</th>
                <th width="430">${order.orderAddr}</th>
                <th width="105">${order.orderPhone}</th>
                <th width="175"><strong class="red">
                    ￥<fmt:formatNumber value="${order.orderPrice}" pattern=".00" />
                </strong></th>
            </tr>
        </table>

        <h4 class="orderTitle">购物清单</h4>
        <table class="orderList">
            <tr>
                <th width="20"></th>
                <th width="430">商品</th>
                <th width="175">单价</th>
                <th width="175">数量</th>
                <th width="175">总金额</th>
            </tr>
            <c:forEach items="${order.orderDetailList}" var="orderDetail">
            <tr>
                <td><input type="checkbox" /></td>
                <td>
                    <dl>
                        <dt><a href="#">
                            <img src="images/${orderDetail.detailGoodsDetail.gdGoods.goodsImg}" width="85" height="85" />
                        </a></dt>
                        <dd>${orderDetail.detailGoodsDetail.gdGoods.goodsName}<br />
                            <span class="red">规格：</span>
                            ${orderDetail.detailGoodsDetail.gdColor.colorName}
                            &nbsp;|&nbsp;
                            ${orderDetail.detailGoodsDetail.gdMemory.memoryName}
                        </dd>
                        <div class="clears"></div>
                    </dl>
                </td>
                <td><strong class="red">
                    ￥<fmt:formatNumber value="${orderDetail.detailPrice}" pattern=".00" />
                </strong></td>
                <td><strong class="red">${orderDetail.detailNum}</strong></td>
                <td><strong class="red">
                    ￥<fmt:formatNumber value="${orderDetail.detailPrice * orderDetail.detailNum}" pattern=".00" />
                </strong></td>
            </tr>
            </c:forEach>
        </table><!--orderList/-->

        <h4 class="orderTitle">支付方式</h4>
        <ul class="zhiList">
            <li>网银支付-借记卡</li>
            <li>网银支付-信用卡</li>
            <li>支付宝-余额支付</li>
            <div class="clears"></div>
        </ul><!--zhiList/-->
        <div class="zhifufangshi">
            <ul class="yinhang">
                <li><input type="radio" /><img src="images/yin1.gif" /></li>
                <li><input type="radio" /><img src="images/yin2.gif" /></li>
                <li><input type="radio" /><img src="images/yin3.gif" /></li>
                <li><input type="radio" /><img src="images/yin4.gif" /></li>
                <li><input type="radio" /><img src="images/yin5.gif" /></li>
                <li><input type="radio" /><img src="images/yin6.gif" /></li>
                <li><input type="radio" /><img src="images/yin7.gif" /></li>
                <li><input type="radio" /><img src="images/yin8.gif" /></li>
                <li><input type="radio" /><img src="images/yin9.gif" /></li>
                <li><input type="radio" /><img src="images/yin1.gif" /></li>
                <li><input type="radio" /><img src="images/yin2.gif" /></li>
                <li><input type="radio" /><img src="images/yin3.gif" /></li>
                <li><input type="radio" /><img src="images/yin4.gif" /></li>
                <li><input type="radio" /><img src="images/yin5.gif" /></li>
                <li><input type="radio" /><img src="images/yin6.gif" /></li>
                <li><input type="radio" /><img src="images/yin7.gif" /></li>
                <li><input type="radio" /><img src="images/yin8.gif" /></li>
                <div class="clears"></div>
            </ul>
        </div><!--zhzhifufangshii/-->
        <div class="zhifufangshi">
            <ul class="yinhang">
                <li><input type="radio" /><img src="images/yin7.gif" /></li>
                <li><input type="radio" /><img src="images/yin8.gif" /></li>
                <li><input type="radio" /><img src="images/yin9.gif" /></li>
                <li><input type="radio" /><img src="images/yin1.gif" /></li>
                <li><input type="radio" /><img src="images/yin2.gif" /></li>
                <li><input type="radio" /><img src="images/yin3.gif" /></li>
                <li><input type="radio" /><img src="images/yin4.gif" /></li>
                <li><input type="radio" /><img src="images/yin5.gif" /></li>
                <li><input type="radio" /><img src="images/yin6.gif" /></li>
                <li><input type="radio" /><img src="images/yin7.gif" /></li>
                <li><input type="radio" /><img src="images/yin8.gif" /></li>
                <div class="clears"></div>
            </ul>
        </div><!--zhzhifufangshii/-->
        <div class="zhifufangshi">
            <ul class="yinhang">
                <li><input type="radio" /><img src="images/zhifubao.jpg" /></li>
                <div class="clear"></div>
            </ul>
        </div><!--zhzhifufangshii/-->
        <table class="zongjia" align="right">
            <tr>
                <td width="120" align="left">商品总价：</td>
                <td width="160"><strong class="red">
                    ￥<fmt:formatNumber value="${order.orderPrice}" pattern=".00" />
                </strong></td>
            </tr>
            <tr>
                <td width="120" align="left">运费总额：</td>
                <td><strong class="red">+0.00</strong></td>
            </tr>
            <tr>
                <td width="120" align="left">促销优惠：</td>
                <td><strong class="red">-0.00</strong></td>
            </tr>
            <tr>
                <td width="120" align="left">合计：</td>
                <td><strong class="red">
                    ￥<fmt:formatNumber value="${order.orderPrice}" pattern=".00" />
                </strong></td>
            </tr>
            <tr>
                <td colspan="2" style="height:50px;">
                    <form method="post" action="${pageContext.request.contextPath}/userOrder/pay" name="payForm">
                        <input name="orderId" type="hidden" value="${order.orderId}">
                        <input name="orderPrice" type="hidden" value="${order.orderPrice}">
                        <input name="orderName" type="hidden" value="${order.orderName}">
                        <input name="orderAddr" type="hidden" value="${order.orderAddr}">
                    </form>
                    <a href="javascript:document.payForm.submit();"><img src="images/tijao.png" width="142" height="32" /></a>
                </td>
            </tr>
        </table><!--zongjia/-->
        <div class="clears"></div>
    </div><!--cont/-->
</div><!--car/-->
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