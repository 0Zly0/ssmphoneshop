package com.oracle.ssmphone.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.ssmphone.domain.Funs;
import com.oracle.ssmphone.domain.OrderDetail;
import com.oracle.ssmphone.domain.Orders;
import com.oracle.ssmphone.service.OrderDetailService;
import com.oracle.ssmphone.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderDetailService orderDetailService;
    @RequestMapping("/list")
    public String list(Integer statusId,Integer pageNum,Orders order, Map<String, Object> model) {
       //查询未实现
        if (pageNum == null) {
            pageNum = 1;//未带页号，默认为第1页
        }

        //查询之前
        PageHelper.startPage(pageNum, 10);//10:每页记录数
        List<Orders> list = orderService.showOrderByStatus(statusId,order);//order包含了查询条件
        PageInfo<Orders> pv = new PageInfo<>(list);//将查询结果封装到pv中
        model.put("statusId",statusId);//回传状态编号
        model.put("pv", pv);
        model.put("keyOrder",order);
        return "/admin/order/show";
    }
    @RequestMapping("/details/{orderId}")//restful风格
    public String details(@PathVariable("orderId") String orderId,Integer pageNum, Map<String, Object> model )
    {
        //查询未实现
        if (pageNum == null) {
            pageNum = 1;//未带页号，默认为第1页
        }
         Orders order=    orderService.showOrderById(orderId);//查询订单(关联users、状态)
         PageHelper.startPage(pageNum,10);
         List<OrderDetail> odList=orderDetailService.showOdByOrderId(orderId);//根据订单查询订单明细集合
         PageInfo<OrderDetail> pv=new PageInfo<>(odList);
         model.put("order",order);
         model.put("pv",pv);
        return "/admin/order/details";
    }
}
