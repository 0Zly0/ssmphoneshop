package com.oracle.ssmphone.domain;

import lombok.Data;

import java.io.Serializable;

@Data
public class OrderDetail implements Serializable {
    //    detail_id	int
    private Integer detailId;
    //    detail_order_id	varchar
    private Orders detailOrder;
    //    detail_goods_detail_id	int
    private GoodsDetail detailGoodsDetail;
    //    detail_price	double
    private Double detailPrice;
    //    detail_num	int
    private Integer detailNum;


}
