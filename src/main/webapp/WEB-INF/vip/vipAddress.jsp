<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <base href="${pageContext.request.contextPath}/static/">
    <title>收货地址</title>
    <link type="text/css" href="css/css.css" rel="stylesheet"/>
    <script type="text/javascript" src="js/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/js.js"></script>

</head>

<body>
<%@include file="../nav.jsp" %>
<script type="text/javascript">
    function toSubmit(page){
        document.searchForm.pageNum.value=page;
        document.searchForm.submit();
    }
</script>
<div class="mid">
    <h1 class="logo" style="text-align:left;">
        <a href="${pageContext.request.contextPath}/goods/toIndex"><img src="images/logo.png" width="304" height="74"/></a>
    </h1>
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

<div class="vipBox">
    <%@include file="vipLeft.jsp" %>
    <div class="vipRight">
        <h2 class="vipTitle">收货地址</h2>
        <form action="${pageContext.request.contextPath}/vip/vipAddAddress" method="post">
            <div class="address" style="display: block;">
                <div class="addList">
                    <label><span class="red">* </span>详细地址:</label>
                    <input type="text" name="reciAddr"/>
                </div><!--addList-->

                <div class="addList">
                    <label><span class="red">* </span>收件人:</label>
                    <input type="text" name="reciName"/>
                </div><!--addList-->
                <div class="addList">
                    <label><span class="red">* </span>手机号码:</label>
                    <input type="text" name="reciPhone"/>
                </div><!--addList-->
                <div class="addList2">
                    <input name="" value=" 确 认 " type="submit" class="submit"/>
                </div><!--addList2/-->
            </div><!--address/-->
        </form>
        <table class="vipAdress">
            <tr>
                <th>id</th>
                <th>收货人</th>

                <th>街道地址</th>

                <th>电话/手机</th>
                <th>操作</th>
            </tr>
            <c:choose>
                <c:when test="${not empty pv.list}">

                    <c:forEach var="reci" items="${pv.list}">
                        <tr>
                            <td>${reci.reciId}</td>
                            <td>${reci.reciName}</td>
                            <td>${reci.reciAddr}</td>
                            <td>${reci.reciPhone}</td>
                            <td><span class="green upd"><a href="${pageContext.request.contextPath}/vip/detailAddress/${reci.reciId}">[修改]</a> </span></td>
                        </tr>
                    </c:forEach>
                </c:when>


                <c:otherwise>
                    <tr>
                        <td colspan="4">暂无收货地址</td>
                    </tr>
                </c:otherwise>
            </c:choose>

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="STYLE4">&nbsp;&nbsp;共有${pv.total}条记录，当前第${pv.pageNum}/${pv.pages}页</td>
                    <div><table border="0" align="right" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="40"><A href="javascript:toSubmit(1)"><img src="admin/images/first.gif" width="37" height="15" /></A></td>
                            <td width="45"><c:choose>
                                <c:when test="${pv.hasNextPage}"><img src="admin/images/back.gif" width="43" height="15" /></c:when>
                                <c:otherwise><A href="javascript:toSubmit(${pv.prePage})"><img src="admin/images/back.gif" width="43" height="15" /></A></c:otherwise>
                            </c:choose></td>
                            <td width="45"><c:choose>
                                <c:when test="${pv.hasPreviousPage}"><img src="admin/images/next.gif" width="43" height="15" /></c:when>
                                <c:otherwise><A href="javascript:toSubmit(${pv.nextPage})"><img src="admin/images/next.gif" width="43" height="15" /></A></c:otherwise>

                            </c:choose></td>
                            <td width="40"><A href="javascript:toSubmit(${pv.pages})"><img src="admin/images/last.gif" width="37" height="15" /></A></td>
                            <td width="100"><div align="center"><span class="STYLE1">转到第<input name="textfield" type="text" size="4" style="height:12px; width:20px; border:1px solid #999999;" />
                    	页 </span></div></td>
                            <td width="40"><img src="admin/images/go.gif" width="37" height="15" /></td>
                        </tr>
                    </table>
                    </div>
                    <div class="clears"></div>
    </div><!--phoneBox/-->

        </table><!--vipAdress/-->

</div><!--vipRight/-->
    <div class="clears"></div>
</div><!--vipBox/-->
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

