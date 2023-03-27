
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>手机商场</title>
    <base href="${pageContext.request.contextPath}/static/">
    <link type="text/css" href="css/css.css" rel="stylesheet"/>
    <link type="text/css" href="admin/css/css.css" rel="stylesheet"/>
    <script type="text/javascript" src="js/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
    <style type="text/css">
        .checked{ background:#2384F1;color:#fff;}
    </style>
        <script type="text/javascript">
            function toSubmit(page){
                document.searchForm.pageNum.value=page;
                document.searchForm.submit();
            }
        </script>
    <script type="text/javascript">
        $(function () {
            $(".xuan li").click(function () {
                $(this).addClass("checked").siblings("li").removeClass("checked");
            });
            $("#brandUL li").click(function () {
                $("#brandId").val($(this).attr("brandId"));
                $("#searchForm").submit();
            });
            $("#labelUL li").click(function () {
                $("#labelId").val($(this).attr("labelId"));
                $("#searchForm").submit();
            });
            $("#prUL li").click(function () {
                $("#prMin").val($(this).attr("prMin"));
                $("#prMax").val($(this).attr("prMax"));
                $("#searchForm").submit();
            });

            $("#brandUL li[brandId=${searchVo.brandId}]").addClass("checked").siblings("li").removeClass("checked");
            $("#labelUL li[labelId=${searchVo.labelId}]").addClass("checked").siblings("li").removeClass("checked");
            $("#prUL li[prMin='${searchVo.prMin}']").addClass("checked").siblings("li").removeClass("checked");

        });

    </script>
</head>

<body>
<%@include file="../nav.jsp"%>
<div class="mid">
    <h1 class="logo" style="text-align:left;">
        <a href="${pageContext.request.contextPath}/goods/toIndex"><img src="images/logo.png" width="304" height="74"/></a>
    </h1>
    <form action="${pageContext.request.contextPath}/goods/toIndex" method="post" class="subBox">
        <div class="subBox2">
            <input type="text" class="subText" name="goodsName" value="${searchVo.goodsName}"/>
            <input type="image" src="images/sub.jpg" width="95" height="32" class="subImg"/>
            <div class="hotci">
            </div><!--hotci/-->
        </div><!--subBox2/-->
    </form><!--subBox/-->
    <div class="ding-gou">
        <div class="ding">
            <a href="${pageContext.request.contextPath}/to/vip/vipOrder"><img src="images/dingdan.jpg" width="106" height="32"/></a>
        </div><!--ding/-->
        <div class="gou">
            <a href="${pageContext.request.contextPath}/cart/showItem"><img src="images/gouwuche.jpg" width="126" height="32"/></a>
        </div><!--gou/-->
        <div class="clears"></div>
    </div><!--ding-gou/-->
</div><!--mid-->

<form id="searchForm" name="searchForm" action="${pageContext.request.contextPath}/goods/toIndex" method="post" class="proDingzhi">
    <input type="hidden" id="pageNum"  name="pageNum" value="1"/>
    <input type="hidden" id="brandId" name="brandId" value="${searchVo.brandId}"/>
    <input type="hidden" id="labelId" name="labelId" value="${searchVo.labelId}"/>
    <input type="hidden" id="prMin" name="prMin" value="${searchVo.prMin}"/>
    <input type="hidden" id="prMax" name="prMax" value="${searchVo.prMax}"/>
    <img src="images/dingzhi.jpg" width="972" height="167"/>
   
    <script>window._bd_share_config = {
        "common": {
            "bdSnsKey": {},
            "bdText": "",
            "bdMini": "2",
            "bdMiniList": false,
            "bdPic": "",
            "bdStyle": "0",
            "bdSize": "24"
        }, "share": {}
    };
    with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
    <table class="proDSel">
        <tr>
            <th>
                <h3>品牌</h3>
            </th>
            <td>
                <div class="proPosition">
                    <ul class="xuan" id="brandUL">
                        <li brandId="" class="checked">全部</li>
                        <c:forEach items="${brandsList}" var="brand">
                            <li brandId="${brand.brandId}">${brand.brandName}</li>
                        </c:forEach>
                    </ul><!--xuan/-->
                    <div class="more-shou">
                       <span class="more">
                        更多 &gt;
                       </span>
                        <span class="shou">
                        收起 &gt;
                       </span>
                    </div><!--more-shou/-->
                </div>
            </td>
        </tr>
        <tr>
            <th>
                <h3>大家都在选</h3>
            </th>
            <td>
                <div class="proPosition" >
                    <ul class="xuan moreHeight" id="labelUL">
                        <li labelId="" class="checked">全部</li>
                        <c:forEach items="${labellist}" var="label">
                            <li labelId="${label.labelId}">${label.labelName}</li>
                        </c:forEach>
                    </ul><!--xuan/-->
                    <div class="more-shou">
                       <span class="more">
                        更多 &gt;
                       </span>
                        <span class="shou">
                        收起 &gt;
                       </span>
                    </div><!--more-shou/-->
                </div>
            </td>
        </tr>
        <tr>
            <th>
                <h3>价格</h3>
            </th>
            <td>
                <div class="proPosition">
                    <ul class="xuan" id="prUL">
                        <li prMin="" prMax="" class="checked">全部</li>
                        <c:forEach items="${priceRangesList}" var="priceRange">
                            <li prMin="${priceRange.prMin}" prMax="${priceRange.prMax}">${priceRange.prText}</li>
                        </c:forEach>
                    </ul><!--xuan/-->
                </div>
            </td>
        </tr>
    </table><!--proDSel/-->
    <div style="height:15px;">&nbsp;</div>
    <ul class="proSelect">
        <li>综合</li>
        <div class="clears"></div>
    </ul><!--proSelect/-->
    <div class="phoneBox">
        <c:forEach items="${pv.list}" var="goods">
        <dl>
            <dt><a href="${pageContext.request.contextPath}/goods/show/${goods.goodsId}"><img src="images/${goods.goodsImg}"/></a></dt>
            <dd>
                <h3>￥<fmt:formatNumber value="${goods.goodsPrice}" pattern=".00" /></h3>
                <div class="phonePars" title="${goods.goodsName}">
                    ${goods.goodsName}
                </div><!--phonePar/-->
                <div class="xiaoliang">
                    <span class="blue">${goods.goodsEval}条评价</span>
                    <span class="pad">${goods.goodsBrand.brandName}</span>
                </div><!--xiaoliang/-->
                <div class="jiaru-shoucang">
                    <span class="jiaruCar">加入购物车</span>
                    <span class="shoucangCar"><a href="quanjing/index.html">选用此模型</a></span>
                    <div class="clears"></div>
                </div><!--jiaru-shoucang/-->
            </dd>
        </dl>
        </c:forEach>
                </div>
    <div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="STYLE4">&nbsp;&nbsp;共有${pv.total}条，当前第${pv.pageNum}/${pv.pages}页</td>
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
</form><!--proDingzhi/-->
<div class="footBox">
    <div class="footers">
        <div class="footersLeft">
            <a href="${pageContext.request.contextPath}/goods/toIndex"><img src="images/ftlogo.jpg" width="240" height="64"/></a>
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

