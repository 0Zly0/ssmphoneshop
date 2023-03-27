package com.oracle.ssmphone.domain;

import lombok.Data;

import java.sql.Timestamp;
import java.util.List;
@Data
public class Orders {
    //    order_id	varchar
    private String orderId;
    //    order_user_id	int
    private User orderUser;//外键的处理:优势在于得到一个order对象，关联的user对象可以直接拿到  many to one多对一处理
    //    order_status_id	int
    private OrderStatus orderStatus;//多对一处理
    // 订单明细列表
    private List<OrderDetail> orderDetailList;//一对多处理(单独处理)
    //    order_address	varchar
    private String orderAddr;
    //    order_name	varchar
    private String orderName;
    //    order_phone	varchar
    private String orderPhone;

    //    order_price	double
    private Double orderPrice;
    //    order_time	timestamp
    private Timestamp orderTime;



}
