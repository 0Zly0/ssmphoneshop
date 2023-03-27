package com.oracle.ssmphone.service;

import com.oracle.ssmphone.domain.OrderDetail;

import java.util.List;

public interface OrderDetailService {
    public List<OrderDetail> showOdByOrderId(String orderId);

    public Integer getGoodId(String orderId);
}
