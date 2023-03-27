package com.oracle.ssmphone.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.ssmphone.domain.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

import com.oracle.ssmphone.service.*;

import java.util.List;

@Controller
@RequestMapping("/vip")
public class UserVipController {
    @Autowired
    private ReciService reciService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderDetailService orderDetailService;
    @Autowired
    private GoodsDetailService goodsDetailService;

    @RequestMapping("/vipAddress")
    public String toAddress(HttpSession session, Model model,Integer pageNum) throws Exception {
//获取用户收货地址
        if(pageNum == null){
            pageNum = 1;
        }
        User user = (User) session.getAttribute("user");
        try {
            PageHelper.startPage(pageNum,10);
            List<Reci> reciList = reciService.showReciOfUser(user);
            PageInfo<Reci> pv = new PageInfo<>(reciList);
            model.addAttribute("pv", pv);
        } catch (Exception e) {
            throw e;
        }
        return "/vip/vipAddress";
    }

    @RequestMapping("/vipOrder")
    public String vipOrder(HttpSession session, Model model,Integer pageNum) throws Exception {
        if(pageNum == null){
            pageNum = 1;
        }
        int[] num = new int[2];

        User user = (User) session.getAttribute("user");
        try {
            List<Orders> ordersList1 = orderService.showOrderByUser(user);
            for (Orders orders : ordersList1) {
                if(orders.getOrderStatus().getStatusId() == 1){
                    num[0] ++;
                }else {
                    num[1] ++;
                }
            }

            PageHelper.startPage(pageNum,10);
            List<Orders> ordersList = orderService.showOrderByUser(user);

            PageInfo<Orders> pv = new PageInfo<>(ordersList);
            model.addAttribute("pv", pv);
            model.addAttribute("num",num);
        } catch (Exception e) {
            throw e;
        }
        return "/vip/vipOrder";
    }

    @RequestMapping("/vipAddAddress")
    public String vipAddAddress(Reci reci, HttpSession session) throws Exception {
//获取用户收货地址
        User user = (User) session.getAttribute("user");
        reci.setReciUser(user);
        try {
            reciService.addReci(reci);
        } catch (Exception e) {
            throw e;
        }
        return "redirect:../vip/vipAddress";
    }

    @RequestMapping("/toPay/{orderId}")
    public String toPay(@PathVariable("orderId") String orderId, HttpSession session) {
        Orders orders = orderService.showOrderById(orderId);
        List<OrderDetail> odList = orderDetailService.showOdByOrderId(orderId);
        orders.setOrderDetailList(odList);
        session.setAttribute("order", orders);
        return "/order/show";
    }

    @RequestMapping("/vipOrderDetails/{orderId}")
    public String details(@PathVariable("orderId") String orderId, Model model) throws Exception {
        Orders orders = orderService.showOrderById(orderId);
        List<OrderDetail> odList = orderDetailService.showOdByOrderId(orderId);
        Integer goodId = orderDetailService.getGoodId(orderId);
        GoodsDetail goodsDetail = goodsDetailService.detailsGd(goodId);
        System.out.println("good:-----------------" + goodsDetail);
        model.addAttribute("good",goodsDetail);
        orders.setOrderDetailList(odList);
        model.addAttribute("orders", orders);
        return "/vip/vipXiaofei";
    }

    @RequestMapping("/vipDelOrder/{orderId}")
    public String vipDelOrder(@PathVariable("orderId") String orderId) throws Exception {
        try {
            orderService.delOrder(orderId);

        } catch (Exception e) {
            throw e;
        }
        return "redirect:../vipOrder";
    }

    @RequestMapping("/detailAddress/{reciId}")
    public String detailAddress(@PathVariable("reciId") Integer reciId, Model model) throws Exception {
        try {
            System.out.println("reciId:----" + reciId);
            Reci reci = reciService.detailsReci(reciId);
            model.addAttribute("reci",reci);

        }catch (Exception e){
            throw e;
        }
        return "/vip/vipUpdateAddress";
    }
    @RequestMapping("/updateAddress")
    public String updateAddress(Reci reci){

        System.out.println("reci:--" + reci);
        reciService.updateReci(reci);
        return "redirect:../vip/vipAddress";
    }
}
