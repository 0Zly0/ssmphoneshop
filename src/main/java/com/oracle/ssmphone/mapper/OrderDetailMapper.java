package com.oracle.ssmphone.mapper;

import com.oracle.ssmphone.domain.OrderDetail;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface OrderDetailMapper {
    //根据订单编号查询订单明细集合(关联商品明细)
    public List<OrderDetail> findByOrderId(String orderId);
    //通过订单id获取商品id
    public Integer getGoodsIdByOrderId(String orderId);
    //添加订单明细:批处理
    public void save(@Param("orderDetailList") List<OrderDetail> orderDetailList);

    public void delByOrderId(String orderId);
}
