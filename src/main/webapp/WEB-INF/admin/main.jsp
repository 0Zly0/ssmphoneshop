<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="${pageContext.request.contextPath}/static/admin/">
	<title>后台管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
<frameset rows="98,*,8" frameborder="no" border="0" framespacing="0">
  <frame src="${pageContext.request.contextPath}/to/admin/top" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
  <frame src="${pageContext.request.contextPath}/to/admin/center" name="mainFrame" id="mainFrame" />
  <frame src="${pageContext.request.contextPath}/to/admin/down" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" />
</frameset>
<noframes><body>
</body>
</noframes>
</html>
