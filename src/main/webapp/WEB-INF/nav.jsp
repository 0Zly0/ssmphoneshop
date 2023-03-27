<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="hrader" id="header">
    <c:if test="${sessionScope.user==null}">
        <a href="${pageContext.request.contextPath}/to/userlogin" style="color:#FD7306;margin-left:20px;">请登录</a>
    </c:if>
    <c:if test="${sessionScope.user==null}">
        <a href="${pageContext.request.contextPath}/to/reg">注册</a>
    </c:if>

    <div class="topNav">
        <a href="${pageContext.request.contextPath}/goods/toIndex" style="color:#FD7306;">首页</a>
        <a href="${pageContext.request.contextPath}/to/vip/vip">会员中心</a>
        <a href="${pageContext.request.contextPath}/to/help">帮助</a>
        <c:if test="${sessionScope.user!=null}">
            <a href="${pageContext.request.contextPath}/user/logOut">退出</a>
        </c:if>
    </div><!--topNav/-->
</div>
<!--hrader/-->
