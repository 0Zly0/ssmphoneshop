package com.oracle.ssmphone.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;

import com.oracle.ssmphone.domain.*;
import com.oracle.ssmphone.service.ItemsService;
import com.oracle.ssmphone.service.OrderService;
import com.oracle.ssmphone.service.ReciService;
import com.oracle.ssmphone.utils.AlipayConfig;
import com.oracle.ssmphone.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/userOrder")
public class UserOrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private ReciService reciService;
    @Autowired
    private ItemsService itemsService;

    /**
     * 支付方法
     *
     * @param orderId    商户订单号，商户网站订单系统中唯一订单号，必填
     * @param orderPrice 付款金额，必填
     * @param orderName  订单名称，必填
     * @param orderAddr  商品描述，可空
     * @param model
     * @return
     */
    @RequestMapping("/pay")
    public String pay(String orderId, String orderPrice, String orderName, String orderAddr, Model model) throws AlipayApiException {
        // 获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
                AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key,
                AlipayConfig.sign_type);
        // 设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        try {
            alipayRequest.setBizContent("{\"out_trade_no\":\"" + orderId + "\"," + "\"total_amount\":\""
                    + orderPrice + "\"," + "\"subject\":\"" + orderName + "\"," + "\"body\":\"" + orderAddr + "\","
                    + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

            // 请求
            String result = alipayClient.pageExecute(alipayRequest).getBody();
            // 输出 pay页面取出
            model.addAttribute("result", result);
        } catch (Exception e) {
           throw e;
        }
        // 这个是渲染到视图中,在pay视图中使用el方式将 result对象数据展示,由result对象进行向阿里支付系统发送构建的请求
        return "/order/alipay";
    }

    /**
     * 支付宝回调方法
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/payresult")
    public String payResult(HttpServletRequest request, Model model) throws Exception {
        try {
            /*
             * * 功能：支付宝服务器同步通知页面 日期：2017-03-30 说明：
             * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
             * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。 页面功能说明*************************
             * 该页面仅做页面展示，业务逻辑处理请勿在该页面执行
             */
            // 获取支付宝GET过来反馈信息
            Map<String, String> params = new HashMap<String, String>();
            Map<String, String[]> requestParams = request.getParameterMap();
            for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
                String name = (String) iter.next();
                String[] values = (String[]) requestParams.get(name);
                String valueStr = "";
                for (int i = 0; i < values.length; i++) {
                    valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
                }
                // 乱码解决，这段代码在出现乱码时使用
                valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
                params.put(name, valueStr);
            }
            // 验签
//            boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key,
//                    AlipayConfig.charset, AlipayConfig.sign_type); // 调用SDK验证签名
            boolean signVerified = true;
            // ——请在这里编写您的程序（以下代码仅作参考）——
            if (signVerified) {
                // 商户订单号
                String out_trade_no = new String(
                        request.getParameter("out_trade_no").getBytes("ISO-8859-1")
                        , "UTF-8");
                // 支付宝交易号
                String trade_no = new String(
                        request.getParameter("trade_no").getBytes("ISO-8859-1")
                        , "UTF-8");
                // 付款金额
                String total_amount = new String(
                        request.getParameter("total_amount").getBytes("ISO-8859-1")
                        , "UTF-8");

                // 修改订单号的状态
                this.orderService.updateOrderStatus(out_trade_no, 2);//2:已付款

                // out.println("trade_no:"+trade_no+"<br/>out_trade_no:"+out_trade_no+"<br/>total_amount:"+total_amount);
                request.setAttribute("reuslt", "trade_no:" + trade_no + "<br/>out_trade_no:" + out_trade_no
                        + "<br/>total_amount:" + total_amount);
            } else {
                // out.println("验签失败");
                request.setAttribute("reuslt", "支付失败");
            }
        } catch (Exception e) {
           throw e;
        }
        return "/order/success";
    }


    @RequestMapping("/show")
    public String show(String orderId, Model model) {
        //  Orders order = this.orderService.queryById(orderId);
        // model.addAttribute("order", order);
        return "order/show";
    }

    @RequestMapping("/save")
    public String save(Integer reciId, Double orderPrice, HttpSession session, Model model) throws Exception {
        User user = (User) session.getAttribute("user");
        //构建订单对象   状态:1(sql指定) 时间:(sql指定)
        Orders orders = new Orders();
        orders.setOrderId(UUIDUtil.getUUID());//订单编号
        orders.setOrderUser(user);
        try {
            Reci reci = reciService.detailsReci(reciId);
            orders.setOrderAddr(reci.getReciAddr());
            orders.setOrderName(reci.getReciName());
            orders.setOrderPhone(reci.getReciPhone());
            orders.setOrderPrice(orderPrice);
            List<OrderDetail> orderDetailList = new ArrayList<>();
            //构建订单明细    思路:来自购物车
            List<Items> itemsList = itemsService.showItemsByUser(user);
            for (Items item : itemsList) {
                OrderDetail od = new OrderDetail();
                od.setDetailOrder(orders);
                od.setDetailGoodsDetail(item.getItemGoodsDetail());
                od.setDetailNum(item.getItemNum());
                od.setDetailPrice(item.getItemGoodsDetail().getGdPrice());
                //加入order的明细集合
                orderDetailList.add(od);
            }
            orders.setOrderDetailList(orderDetailList);
            orderService.saveOrder(orders);
            session.setAttribute("order", orders);//存入 session
        } catch (Exception e) {
           // e.printStackTrace();
            throw  e;
        }


        return "/order/show";
    }
}
