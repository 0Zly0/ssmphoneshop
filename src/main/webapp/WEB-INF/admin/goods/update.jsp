<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
    body {
      margin-left: 0px;
      margin-top: 0px;
      margin-right: 0px;
      margin-bottom: 0px;
    }
    .STYLE1 {
      font-size: 12px;
      text-align: left;
    }
    .STYLE3 {font-size: 12px; font-weight: bold; }
    .STYLE4 {
      color: #03515d;
      font-size: 12px;
    }
    -->
  </style>
  <link rel="stylesheet" type="text/css" href="../kindeditor/themes/default/default.css">
  <link rel="stylesheet" type="text/css" href="../kindeditor/plugins/code/prettify.css">
  <script type="text/javascript" src="../kindeditor/kindeditor-all-min.js"></script>
  <script type="text/javascript" src="../kindeditor/lang/zh-CN.js"></script>
  <script type="text/javascript" src="../kindeditor/plugins/code/prettify.js"></script>
  <script>
    KindEditor.ready(function(K) {
      var editor1 = K.create('#goodsDesc', {
        cssPath : '${pageContext.request.contextPath}/static/kindeditor/css/prettify.css',
        uploadJson : '${pageContext.request.contextPath}/static/kindeditor/upload_json.jsp',
        fileManagerJson : '${pageContext.request.contextPath}/static/kindeditor/file_manager_json.jsp'
      });
      var editor2 = K.create('#goodsSpec', {
        cssPath : '${pageContext.request.contextPath}/static/kindeditor/css/prettify.css',
        uploadJson : '${pageContext.request.contextPath}/static/kindeditor/upload_json.jsp',
        fileManagerJson : '${pageContext.request.contextPath}/static/kindeditor/file_manager_json.jsp'
      });
      var editor3 = K.create('#goodsPack', {
        cssPath : '${pageContext.request.contextPath}/static/kindeditor/css/prettify.css',
        uploadJson : '${pageContext.request.contextPath}/static/kindeditor/upload_json.jsp',
        fileManagerJson : '${pageContext.request.contextPath}/static/kindeditor/file_manager_json.jsp'
      });
      var editor4 = K.create('#goodsServ', {
        cssPath : '${pageContext.request.contextPath}/static/kindeditor/css/prettify.css',
        uploadJson : '${pageContext.request.contextPath}/static/kindeditor/upload_json.jsp',
        fileManagerJson : '${pageContext.request.contextPath}/static/kindeditor/file_manager_json.jsp'
      });
    });
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[商品管理]-[商品编辑]</td>
              </tr>
            </table></td>
            <td width="54%">&nbsp;</td>
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
        <td><form action="${pageContext.request.contextPath}/goods/update"   method="post"  enctype="multipart/form-data">
           <input type="hidden" name="goodsId" value="${goods.goodsId}"/>
          <table width="600" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" >
            <tr>
              <td width="100%" colspan="2" height="19" align="right"  bgcolor="#FFFFFF"><div align="center"><span class="STYLE1" style="color:red;">${requestScope.error }</span></div></td>
            </tr>
            <tr>
              <td width="34%" height="19" align="right"  bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">名称：</span></div></td>
              <td width="66%" height="19" align="left"  bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">
                <input type="text" name="goodsName" value="${goods.goodsName}" />
              </span></div></td>
            </tr>
            <tr>
              <td width="34%" height="19" align="right"  bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">价格：</span></div></td>
              <td width="66%" height="19" align="left"  bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">
                <input type="text" name="goodsPrice" value="${goods.goodsPrice}" />
              </span></div></td>
            </tr>
            <tr>
              <td width="34%" height="19" align="right"  bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">外观：</span></div></td>
              <td width="66%" height="19" align="left"  bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">
                <img src="../images/${goods.goodsImg}" alt="">
               <input type="file" name="goodsImgFile" />
              </span></div></td>
            </tr>
            <tr>
              <td width="34%" height="19" align="right"  bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">品牌：</span></div></td>
              <td width="66%" height="19" align="left"  bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">
                <select name="goodsBrand.brandId" >
                 <option value="">请选择</option>
                  <c:forEach var="brand" items="${brandsList}">
                    <option value="${brand.brandId}"
                            <c:if test="${brand.brandId eq goods.goodsBrand.brandId}">
                              selected
                            </c:if>

                    >${brand.brandName}</option>
                  </c:forEach>
                </select>
              </span></div></td>
            </tr>
            <tr>
              <td width="34%" height="19" align="right"  bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">简介：</span></div></td>
              <td width="66%" height="19" align="left"  bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">
                <input type="text" name="goodsIntr"  value="${goods.goodsIntr}"/>
              </span></div></td>
            </tr>
            <tr>
              <td width="34%" height="19" align="right"  bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">EVEL：</span></div></td>
              <td width="66%" height="19" align="left"  bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">
                <input type="text" name="goodsEval"  value="${goods.goodsEval}"/>
              </span></div></td>
            </tr>
            <tr>
              <td width="34%" height="19" align="right"  bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">库存：</span></div></td>
              <td width="66%" height="19" align="left"  bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">
                <input type="text" name="goodsNum" value="${goods.goodsNum}"/>
              </span></div></td>
            </tr>
            <tr>
              <td width="34%" height="19" align="right"  bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">颜色：</span></div></td>
              <td width="66%" height="19" align="left"  bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">

                               <c:forEach var="color" items="${colorList}" varStatus="vs">
                                 <input type="checkbox"
                                        <c:forEach var="c" items="${goods.colorList}">
                                          <c:if test="${c.colorId eq color.colorId}">
                                            checked
                                          </c:if>

                                        </c:forEach>
                                        name="colorList[${vs.index}].colorId" value="${color.colorId}"/>${color.colorName}
                               </c:forEach>
              </span></div></td>
            </tr>
            <tr>
              <td width="34%" height="19" align="right"  bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">标签：</span></div></td>
              <td width="66%" height="19" align="left"  bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">
                  <c:forEach var="label" items="${labelsList}" varStatus="vs">
                    <input type="checkbox" name="labelsList[${vs.index}].labelId"
                            <c:forEach var="l" items="${goods.labelsList}">
                              <c:if test="${l.labelId eq label.labelId}">
                                checked
                              </c:if>

                            </c:forEach>

                           value="${label.labelId}"/>${label.labelName}
                  </c:forEach>
              </span></div></td>
            </tr>
            <tr>
              <td width="34%" height="19" align="right"  bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">内存：</span></div></td>
              <td width="66%" height="19" align="left"  bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">
             <c:forEach var="memory" items="${memoryList}" varStatus="vs">
               <input type="checkbox" name="memoryList[${vs.index}].memoryId"
               <c:forEach var="m" items="${goods.memoryList}">
                 <c:if test="${m.memoryId eq memory.memoryId}">
                   checked
                 </c:if>
               </c:forEach>
                      value="${memory.memoryId}"/>${memory.memoryName}
             </c:forEach>
              </span></div></td>
            </tr>
            <tr>
              <td width="34%" height="19" align="right"  bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">图片：</span></div></td>
              <td width="66%" height="19" align="left"  bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">
                <c:forEach var="gi" items="${goods.goodsImgList}">
                  <img src="../images/${gi.imgBig}" alt="">
                  <img src="../images/${gi.imgSmall}" alt="">
                </c:forEach>
                <input type="file" name="goodsImgListFile">
              </span></div></td>
            </tr>
            <tr>
              <td width="34%"  align="right"  bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">描述：</span></div></td>
              <td width="66%"  align="left"  bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">
               <textarea id="goodsDesc" name="goodsDesc" rows="6" cols="50">
                 ${goods.goodsDesc}
               </textarea>
              </span></div></td>
            </tr>
            <tr>
              <td width="34%"  align="right"  bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">规格：</span></div></td>
              <td width="66%"  align="left"  bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">
                <textarea id="goodsSpec" name="goodsSpec" rows="6" cols="50">
                  ${goods.goodsSpec}
                </textarea>
              </span></div></td>
            </tr>
            <tr>
              <td width="34%"  align="right"  bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">包装：</span></div></td>
              <td width="66%"  align="left"  bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">
                  <textarea id="goodsPack" name="goodsPack" rows="6" cols="50">
                    ${goods.goodsPack}
                  </textarea>
              </span></div></td>
            </tr>
            <tr>
              <td width="34%" height="19" align="right"  bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">售后：</span></div></td>
              <td width="66%" height="19" align="left"  bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">
                <textarea id="goodsServ" name="goodsServ" rows="6" cols="50">
                  ${goods.goodsServ}
                </textarea>
              </span></div></td>
            </tr>
            <tr>
              <td width="34%" height="19" align="right"  bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">&nbsp;</span></div></td>
              <td width="66%" height="19" align="left"  bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">
                <input type="submit" value="保存" >
                </span>
                <input type="reset" name="button" id="button" value="重置">
              </div></td>
            </tr>
          </table>
        </form></td>
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
            <td class="STYLE4">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
