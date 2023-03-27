
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="vipLeft">
    <h2 class="headImg"><img src="images/d5.jpg" width="183" height="169" /></h2>
    <h3 class="vipName">${user.userName}</h3>
    <dl class="vipNav">
        <dd><a href="${pageContext.request.contextPath}/vip/vipOrder">我的订单</a></dd>
        <dd ><a href="${pageContext.request.contextPath}/to/vip/vip">个人信息</a></dd>
        <dd><a href="${pageContext.request.contextPath}/to/vip/vipPwd">密码修改</a></dd>
        <dd><a href="${pageContext.request.contextPath}/vip/vipAddress">收货地址</a></dd>


    </dl><!--vipNav/-->
</div><!--vipLeft/-->
