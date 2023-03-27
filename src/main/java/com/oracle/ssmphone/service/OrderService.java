package com.oracle.ssmphone.service;

import com.oracle.ssmphone.domain.Orders;
import com.oracle.ssmphone.domain.User;

import java.util.List;

public interface OrderService {
    public List<Orders> showOrderByStatus(Integer statusId,Orders order);
    public Orders showOrderById(String orderid);
    public void saveOrder(Orders orders) throws Exception;
    public void updateOrderStatus(String orderId,Integer status) throws Exception;//更改订单状态
    public List<Orders> showOrderByUser(User user) throws Exception;
    //取消订单
    public void delOrder(String orderId) throws Exception;
}
