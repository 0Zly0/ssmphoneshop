package com.oracle.ssmphone.service.impl;

import com.oracle.ssmphone.domain.OrderDetail;
import com.oracle.ssmphone.mapper.OrderDetailMapper;
import com.oracle.ssmphone.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrderDetailServiceImpl implements OrderDetailService {
    @Autowired
    private OrderDetailMapper orderDetailMapper;
    @Override
    public List<OrderDetail> showOdByOrderId(String orderId) {
        return orderDetailMapper.findByOrderId(orderId);
    }

    @Override
    public Integer getGoodId(String orderId) {
        return orderDetailMapper.getGoodsIdByOrderId(orderId);
    }
}
