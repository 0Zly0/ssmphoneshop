
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <base href="${pageContext.request.contextPath}/static/admin/">

  <title>My JSP 'show.jsp' starting page</title>

  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
  <!--
  <link rel="stylesheet" type="text/css" href="styles.css">
  -->
  <style type="text/css">
    <!--
    a:link {
      text-decoration: none;
    }
    a:visited {
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
    }
    a:active {
      text-decoration: none;
    }
    body {
      margin-left: 0px;
      margin-top: 0px;
      margin-right: 0px;
      margin-bottom: 0px;
    }
    .STYLE1 {font-size: 12px}
    .STYLE3 {font-size: 12px; font-weight: bold; }
    .STYLE4 {
      color: #03515d;
      font-size: 12px;
    }
    -->
  </style>
  <script>
    var  highlightcolor='#c1ebff';
    //此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
    var  clickcolor='#51b2f6';
    function  changeto(){
      source=event.srcElement;
      if  (source.tagName=="TR"||source.tagName=="TABLE")
        return;
      while(source.tagName!="TD")
        source=source.parentElement;
      source=source.parentElement;
      cs  =  source.children;
//alert(cs.length);
      if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
        for(i=0;i<cs.length;i++){
          cs[i].style.backgroundColor=highlightcolor;
        }
    }

    function  changeback(){
      if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
        return
      if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
        for(i=0;i<cs.length;i++){
          cs[i].style.backgroundColor="";
        }
    }

    function  clickto(){
      source=event.srcElement;
      if  (source.tagName=="TR"||source.tagName=="TABLE")
        return;
      while(source.tagName!="TD")
        source=source.parentElement;
      source=source.parentElement;
      cs  =  source.children;
//alert(cs.length);
      if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
        for(i=0;i<cs.length;i++){
          cs[i].style.backgroundColor=clickcolor;
        }
      else
        for(i=0;i<cs.length;i++){
          cs[i].style.backgroundColor="";
        }
    }
  </script>
  <script type="text/javascript">
    function toSubmit(page){
      document.searchForm.pageNum.value=page;
      document.searchForm.submit();
    }



  </script>
</head>

<body>
<form action="${pageContext.request.contextPath}/order/details/${order.orderId}" method="post" name="searchForm">
<input type="hidden" name="pageNum" value="1"/>
</form>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[订单管理]-[订单详情]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center">

                    </div></td>
                    <td class="STYLE1"><div align="center"></div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"></div></td>
                    <td class="STYLE1"><div align="center"></div></td>
                  </tr>
                </table></td>
                <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"></div></td>
                    <td class="STYLE1"><div align="center"></div></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td>

            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
              <tr>
                <td width="3%" height="19" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center">
                </div></td>
                <td width="5%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">订单编号</span></div></td>
                <td width="5%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">会员名</span></div></td>
                <td width="5%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">订单日期</span></div></td>
                <td width="10%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">收货人</span></div></td>
                <td width="10%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">电话</span></div></td>
                <td width="30%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">收货地址</span></div></td>
                <td width="10%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">总价</span></div></td>
                <td width="10%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">状态</span></div></td>

              </tr>
              <tr>
                <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center">
                </div></td>
                <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center" class="STYLE1">
                  <div align="center">${order.orderId}</div>
                </div></td>
                <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">${order.orderUser.userName}</span></div></td>
                <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">
               <fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
            </span></div></td>
                <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">${order.orderName}</span></div></td>
                <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">${order.orderPhone}</span></div></td>
                <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">${order.orderAddr}</span></div></td>
                <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">${order.orderPrice}</span></div></td>
                <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">${order.orderStatus.statusName}</span></div></td>

              </tr>
            </table>

        </td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
<tr>
  <td width="8" background="images/tab_12.gif">&nbsp;</td>
  <td colspan="2">订单明细</td>

</tr>
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td>

          <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
            <tr>
              <td width="3%" height="19" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center">
              </div></td>
              <td width="5%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">编号</span></div></td>
              <td width="5%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">手机</span></div></td>
              <td width="5%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">颜色</span></div></td>
              <td width="10%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">内存</span></div></td>
              <td width="10%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">价格</span></div></td>
              <td width="10%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">数量</span></div></td>
              <td width="10%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">总价</span></div></td>

            </tr>

<c:forEach var="od" items="${pv.list}">
            <tr>
              <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center">
              </div></td>
              <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center" class="STYLE1">
                <div align="center">${od.detailId}</div>
              </div></td>
              <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">${od.detailGoodsDetail.gdGoods.goodsName}</span></div></td>
              <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">
               ${od.detailGoodsDetail.gdColor.colorName}
            </span></div></td>
              <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">${od.detailGoodsDetail.gdMemory.memoryName}</span></div></td>
              <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">${od.detailPrice}</span></div></td>
              <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">${od.detailNum}</span></div></td>
              <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">${od.detailPrice*od.detailNum}</span></div></td>
            </tr>
</c:forEach>


          </table>

        </td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>

    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;共有${pv.total}条记录，当前第${pv.pageNum}/${pv.pages}页</td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="40"><A href="javascript:toSubmit(1)"><img src="images/first.gif" width="37" height="15" /></A></td>
                <td width="45"><c:choose>
                  <c:when test="${pv.hasNextPage}"><img src="images/back.gif" width="43" height="15" /></c:when>
                  <c:otherwise><A href="javascript:toSubmit(${pv.prePage})"><img src="images/back.gif" width="43" height="15" /></A></c:otherwise>
                </c:choose></td>
                <td width="45"><c:choose>
                  <c:when test="${pv.hasPreviousPage}"><img src="images/next.gif" width="43" height="15" /></c:when>
                  <c:otherwise><A href="javascript:toSubmit(${pv.nextPage})"><img src="images/next.gif" width="43" height="15" /></A></c:otherwise>

                </c:choose></td>
                <td width="40"><A href="javascript:toSubmit(${pv.pages})"><img src="images/last.gif" width="37" height="15" /></A></td>
                <td width="100"><div align="center"><span class="STYLE1">转到第<input name="textfield" type="text" size="4" style="height:12px; width:20px; border:1px solid #999999;" />
                    	页 </span></div></td>
                <td width="40"><img src="images/go.gif" width="37" height="15" /></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
