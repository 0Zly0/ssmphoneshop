package com.oracle.ssmphone.service.impl;

import com.oracle.ssmphone.domain.GoodsDetail;
import com.oracle.ssmphone.domain.OrderDetail;
import com.oracle.ssmphone.domain.Orders;
import com.oracle.ssmphone.domain.User;
import com.oracle.ssmphone.mapper.GoodsDetailMapper;
import com.oracle.ssmphone.mapper.ItemsMapper;
import com.oracle.ssmphone.mapper.OrderDetailMapper;
import com.oracle.ssmphone.mapper.OrderMapper;
import com.oracle.ssmphone.service.GoodService;
import com.oracle.ssmphone.service.GoodsDetailService;
import com.oracle.ssmphone.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderDetailMapper orderDetailMapper;
    @Autowired
    private ItemsMapper itemsMapper;
    @Autowired
    private GoodsDetailService goodsDetailService;
    @Autowired
    private GoodsDetailMapper goodsDetailMapper;
    @Override
    public List<Orders> showOrderByStatus(Integer statusId, Orders order) {
        return orderMapper.findOrderByStatusId(statusId, order);
    }

    @Override
    public Orders showOrderById(String orderid) {
        return orderMapper.get(orderid);
    }

    @Override
    public void saveOrder(Orders orders) throws Exception {
        try {
            //1.增加一条订单记录
            orderMapper.save(orders);
            //2.增加订单明细记录
            orderDetailMapper.save(orders.getOrderDetailList());
            //3.删除购物车
            itemsMapper.deleteByUser(orders.getOrderUser());
            //4.修改库存sku
            for (OrderDetail od : orders.getOrderDetailList()) {
                GoodsDetail gd = goodsDetailService.detailsGd(od.getDetailGoodsDetail().getGdId());
                goodsDetailService.updateSku(gd.getGdId(), gd.getGdNum() - od.getDetailNum());
            }

        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public void updateOrderStatus(String orderId, Integer status) throws Exception {
        try {
            orderMapper.updateStatus(orderId, status);
        } catch (Exception e) {
              throw e;
        }
    }

    @Override
    public List<Orders> showOrderByUser(User user) throws Exception {
        List<Orders> ordersList = null;
        try {
            ordersList = orderMapper.findOrderByUser(user);
        } catch (Exception e) {
            throw e;
        }
        return ordersList;
    }

    @Override
    public void delOrder(String orderId) throws Exception {
        try {
            //1.恢复sku库存  :遍历订单明细   ，找到商品详情id  ,修改库存
            Integer goodId = orderDetailMapper.getGoodsIdByOrderId(orderId);
            Integer num = goodsDetailMapper.getNum(goodId);
            goodsDetailMapper.updateGdNum(goodId,num);

            //2.删除 订单明细
            orderDetailMapper.delByOrderId(orderId);
            //3.删除订单
            orderMapper.delByOrderId(orderId);
        } catch (Exception e) {
            throw e;
        }

    }
}
