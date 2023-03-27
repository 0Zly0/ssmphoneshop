<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>手机商场</title>
    <base href="${pageContext.request.contextPath}/static/">
    <link type="text/css" href="css/css.css" rel="stylesheet"/>
    <script type="text/javascript" src="js/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
</head>

<body>
<%@include file="../nav.jsp" %>
<div class="mid">
    <h1 class="logo" style="text-align:left;">
        <a href="${pageContext.request.contextPath}/goods/toIndex"><img src="images/logo.png" width="304" height="74"/></a>
    </h1>
    <form action="#" method="get" class="subBox">
        <div class="subBox2">
            <input type="text" class="subText"/>
            <input type="image" src="images/sub.jpg" width="95" height="32" class="subImg"/>
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
            <a href="${pageContext.request.contextPath}/to/vip/vipOrder"><img src="images/dingdan.jpg" width="106"
                                                                              height="32"/></a>
        </div><!--ding/-->
        <div class="gou">
            <a href="${pageContext.request.contextPath}/cart/showItem"><img src="images/gouwuche.jpg" width="126"
                                                                            height="32"/></a>
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
        <div class="carImg"><img src="images/car1.jpg" width="951" height="27"/></div>
        <h4 class="orderTitle">收货地址</h4>
        <form name="saveForm" action="${pageContext.request.contextPath}/userOrder/save" method="post">

            <input type="hidden" name="orderPrice" value="${sumPrice}"/>
            <table class="ord">
                <c:forEach items="${requestScope.reciList}" var="reci" varStatus="vs">
                    <tr>
                        <td width="30%" align="left">
                            <input type="radio" name="reciId"
                                    <c:if test="${vs.index eq 0}">
                                        checked
                                    </c:if>

                                   value="${reci.reciId}"/> ${reci.reciName}
                        </td>
                        <td width="50%">
                                ${reci.reciAddr},${reci.reciPhone}
                        </td>
                        <td>
                            <span class="green upd">[修改]</span> | <span class="green add">[添加]</span>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </form><!--ord/-->
        <div class="address">
            <div class="addList">
                <label><span class="red">* </span>选择地区:</label>
                <select>
                    <option>请选择省</option>
                </select>
                <select>
                    <option>请选择市</option>
                </select>
                <select>
                    <option>请选择地区</option>
                </select>
            </div><!--addList-->
            <div class="addList">
                <label><span class="red">* </span>详细地址:</label>
                <input type="text"/>
            </div><!--addList-->
            <div class="addList">
                <label><span class="red">* </span>邮政编码:</label>
                <input type="text"/>
            </div><!--addList-->
            <div class="addList">
                <label><span class="red">* </span>收件人:</label>
                <input type="text"/>
            </div><!--addList-->
            <div class="addList">
                <label><span class="red">* </span>手机号码:</label>
                <input type="text"/> 或者固定电话 <input type="text"/>
            </div><!--addList-->
            <div class="addList2">
                <input type="image" src="images/queren.jpg" width="100" height="32"/>
            </div><!--addList2/-->
        </div><!--address/-->
        <table class="orderList">
            <tr>
                <th width="20"></th>
                <th width="450">商品</th>
                <th width="130">单价</th>
                <th width="130">数量</th>
                <th width="130">总金额</th>
                <th width="105">操作</th>
            </tr>
            <form name="ajaxItemForm" id="ajaxItemForm" method="post" action="#">
                <c:forEach items="${itemList}" var="item">
                    <tr>
                        <td><input type="checkbox" name="itemIds" value="${item.itemId}"/></td>
                        <td>
                            <dl>
                                <dt><a href="#"><img src="images/${item.itemGoodsDetail.gdGoods.goodsImg}" width="50"
                                                     height="85"/></a></dt>
                                <dd>${item.itemGoodsDetail.gdGoods.goodsName}<br/>
                                    <span class="red">规格：</span>
                                        ${item.itemGoodsDetail.gdColor.colorName}|${item.itemGoodsDetail.gdMemory.memoryName}
                                </dd>
                                <div class="clears"></div>
                            </dl>
                        </td>
                        <td><strong class="red">
                            <fmt:formatNumber value="${item.itemGoodsDetail.gdPrice}" pattern=".00"/>
                        </strong></td>
                        <td>
                            <div class="jia_jian">${item.itemNum}</div>
                        </td>
                        <td><strong class="red">
                            <fmt:formatNumber value="${item.itemGoodsDetail.gdPrice*item.itemNum}" pattern=".00"/>
                        </strong></td>
                        <td><a href="javascript:removeItems(${item.itemId});" id="del_${item.itemId}" class="green">删除</a></td>
                    </tr>
                </c:forEach>
            </form>
            <script type="text/javascript">
                function removeItems(v_itemId) {
                    //发 ajax请求删除
                    $.post('${pageContext.request.contextPath}/cart/remove', {
                        itemIds: v_itemId,
                        r: Math.random()
                    }, function (data) {
                        if (data == 1)//删除成功
                        {
                            alert('删除成功!');
                            $('#del_'+v_itemId).parent().parent().remove();//移出该行
                        } else {
                            alert('删除失败!');
                        }
                    });
                }

                function removeItemsByChoose() {

                    var formData = $("#ajaxItemForm").serializeArray();
                    $.post('${pageContext.request.contextPath}/cart/remove', formData, function (data) {
                        if (data == 1)//删除成功
                        {
                            alert('删除成功!');
                            $("[name='itemIds']").each(function(index,e) {

                                if (e.checked) {//e:dom对象
                                    $(e).parent().parent().remove();//移出该行
                                }

                            })
                        } else {
                            alert('删除失败!');
                        }
                    });
                }
            </script>
            <tr>
                <td colspan="6">
                    <div class="shanchu"><img src="images/lajio.jpg" onclick="jacascript:removeItemsByChoose();"/> <a
                            href="javascript:removeItemsByChoose();">删除所选</a></div>
                </td>
            </tr>
        </table><!--orderList/-->
        <div class="zongji">
            <strong>所需运费：</strong>￥0.00 &nbsp;&nbsp;
            <strong>总计(不含运费)：</strong>
            <strong class="red">
                ￥<fmt:formatNumber value="${sumPrice}" pattern=".00"/>
            </strong>
        </div><!--zongji/-->
        <div class="jiesuan">
            <a href="${pageContext.request.contextPath}/goods/toIndex" class="jie_1">继续购物&gt;&gt;</a>
            <a href="javascript:document.saveForm.submit()" class="jie_2">立即结算&gt;&gt;</a>
            <div class="clears"></div>
        </div><!--jiesuan/-->
        <div class="clears"></div>
    </div><!--cont/-->
</div><!--car/-->
<div class="footBox">
    <div class="footers">
        <div class="footersLeft">
            <a href="${pageContext.request.contextPath}/goods/toIndex"><img src="images/ftlogo.jpg" width="240"
                                                                            height="64"/></a>
            <h3 class="ftphone">400 000 0000 </h3>
            <div class="ftKe">
                客服 7x24小时(全年无休)<br/>
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
    <br/>
    <span>&copy; 2014 Unqezi 使用前必读 沪ICP备 12007626号-1</span>
</div><!--footer/-->
</body>
</html>

