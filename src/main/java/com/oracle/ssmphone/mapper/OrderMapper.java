package com.oracle.ssmphone.mapper;

import com.oracle.ssmphone.domain.Orders;
import com.oracle.ssmphone.domain.User;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface OrderMapper {
    //根据订单状态查询订单
    public List<Orders> findOrderByStatusId(@Param("statusId") Integer statusId, @Param("order") Orders order);
    //根据订单号查询订单(关联用户和状态)
    public Orders get(String orderId);
    //增加订单
    public void save(Orders order);
    //修改订单状态(由于订单的修改一般只涉及状态，所以设计参数为两个)
    public void updateStatus(@Param("orderId") String orderId,
                             @Param("statusId") Integer statusId);
    //根据用户查找订单
    public List<Orders> findOrderByUser(User user);

    public void delByOrderId(String orderId);
}
