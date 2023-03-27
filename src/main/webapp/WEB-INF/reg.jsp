
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <base href="${pageContext.request.contextPath}/static/">
    <title>unique</title>
    <link type="text/css" href="css/css.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
</head>

<body>
<%@include file="nav.jsp"%>

<script type="text/javascript">

    // 验证账号及密码
    function subForm(){
        var account = document.getElementById("name").value;
        var telephone = document.getElementById("tel").value;
        var password = document.getElementById("pwd").value;
        var password1 = document.getElementById("pwd1").value;

        if(account.length === 0){
            document.getElementById("spId1").textContent="用户名不应该为空!";
            return false;
        }else if (telephone.length === 0){
            document.getElementById("spId1").innerHTML="电话号码不应该为空!";
            return false;
        }else if (password.length === 0){
            document.getElementById("spId1").innerHTML="密码不应该为空!";
            return false;
        }else if(password !== password1){
            document.getElementById("spId1").innerHTML="两次密码不一致!";
            return false;
        }
        return true;
    }

</script>
<div class="mainCont">
    <h1 class="logo" style="text-align:left;">
        <a href="${pageContext.request.contextPath}/goods/toIndex"><img src="images/logo.png" width="304" height="74" /></a>
    </h1>
    <div class="loginBuy">
        <div class="loginBuyLeft">
            <ul class="regEq">
                              <li class="regEqBg2">采购商</li>
                <div class="clears"></div>
            </ul><!--regEq/-->


            <form action="${pageContext.request.contextPath}/user/reg" method="post" class="regForm" onsubmit="return subForm()">
                <div class="loginBuyList">
                    <label for="name">用户名:</label>
                    <input type="text" id="name" name="userName" />
                </div><!--loginBuyList/-->

                <div class="loginBuyList">
                    <label for="tel">手机号码：</label>
                    <input type="text" id="tel" name="userPhone" />

                </div><!--loginBuyList/-->
                <span id="spId2"></span>

                <div class="loginBuyList">
                    <label for="pwd">设置密码：</label>
                    <input type="password" id="pwd"  name="userPass"/>

                </div><!--loginBuyList/-->

                <div class="loginBuyList" style="border:#DEDEDE 1px solid;">
                    <label for="pwd1">确认密码：</label>
                    <input type="password" id="pwd1" />

                </div><!--loginBuyList/-->

                <div class="loginBuyyan">
                    <label for="yanzheng">验证码：</label>
                    <input type="text" id="yanzheng" name="validateCode"/>
                    <div class="yanzhengma">
                        <img id="codeId" src="${pageContext.request.contextPath}/user/code" width="124" height="52" />
                        <span onclick="javascript:document.getElementById('codeId').src='${pageContext.request.contextPath}/user/code?r='+Math.random()">换一张</span>
                    </div>


                </div><!--loginBuyList/-->
                <div class="falv">
                    <input type="checkbox" /> <span>我已阅读并同意<a href="xieyi.html" target="_blank">《uniqueZi协议》</a></span>
                </div><!--falv/-->
                <div>
                    <span id="spId1" style="color: red; font-size: 11px"></span><br>
                </div>
                <div class="regSubs">
                    <input type="submit" value=" 注 册 " /><span style="color: red; font-size: 11px">${error}</span>
                </div><!--regSub/-->
            </form><!--/-->
        </div><!--loginBuyLeft-->
        <div class="loginBuyRight">

            <div class="regDl">
                <a href="login.html"><img src="images/dl.jpg" width="180" height="60" /></a>
                <p>已有<a href="${pageContext.request.contextPath}/to/userlogin">采购商</a>账号点击登录！</p>
            </div><!--regDl/-->
        </div><!--loginBuyRight/-->
        <div class="clears"></div>
    </div><!--loginBuy/-->
</div><!--mainCont/-->
<div class="footBox">
    <div class="footers">
        <div class="footersLeft">
            <a href="${pageContext.request.contextPath}/goods/toIndex"><img src="images/ftlogo.jpg" width="240" height="64" /></a>
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
