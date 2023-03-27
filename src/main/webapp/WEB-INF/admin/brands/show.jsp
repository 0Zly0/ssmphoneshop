
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
function dodel(brandId){//点击删除调用js函数,传入会员号
	if(confirm("是否删除？")){
		location.href="${pageContext.request.contextPath}/brands/delete?brandId="+brandId;
	}
}


</script>
  </head>
  
  <body>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[商品类型管理]-[商品类型查看]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center">
                      <input type="checkbox" name="cbox_all" id="cbox_all" value="checkbox" onclick="checkboxall(this)" />
                    </div></td>
                    <td class="STYLE1"><div align="center">全选</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/22.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><A href="${pageContext.request.contextPath}/to/admin/brands/save">新增</A></div></td>
                  </tr>
                </table></td>
                <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/11.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><A href="javascript:dodels()">删除</A></div></td>
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
        <td><span class="STYLE1">
        <form action="${pageContext.request.contextPath}/brands/list" name="searchForm" method="post">
        <!--带页号-->
         <input type="hidden" name="pageNum" value="1"/>
		类型：<input name="brandName" type="text" value="${keyBrand.brandName}" size="16">

		<input type="submit" name="button" id="button" value="查询">
		</form></span>
		<form action="admin/goods/deletes.do" name="deletesForm"  method="post">
		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="3%" height="19" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center">
            </div></td>
            <td width="5%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">类型</span></div></td>

            <td width="10%" height="19" background="images/bg.gif" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE1">基本操作</span></div></td>
          </tr>
          <c:choose>
          <c:when test="${empty pv.list}">
          <tr><td colspan="10" align="center" bgcolor="#FFFFFF"><div class="STYLE1" style="font-size:36px;color:red;">本次查询没有数据！</div></td></tr>
          </c:when>

          <c:otherwise>
		  <c:forEach items="${pv.list}" var="brand" varStatus="status">
          <tr>
            <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center">
              <input type="checkbox" name="goodsIds" value="${brand.brandId}" />
            </div></td>
            <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center" class="STYLE1">
              <div align="center">${brand.brandName}</div>
            </div></td>


            <td height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"><span class="STYLE4"><img src="images/edt.gif" width="16" height="16" />
              <A href=${pageContext.request.contextPath}/to/admin/brands/update?funId=${brand.brandId}>编辑</A>&nbsp; &nbsp;
              <img src="images/del.gif" width="16" height="16" /><A href="javascript:dodel(${brand.brandId})">删除</A>
            </span></div></td>
          </tr>
		  </c:forEach>
          </c:otherwise>
          </c:choose>
        </table></form></td>
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
