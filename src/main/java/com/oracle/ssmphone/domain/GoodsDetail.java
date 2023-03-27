package com.oracle.ssmphone.domain;

import lombok.Data;

import java.io.Serializable;

@Data
public class GoodsDetail implements Serializable {
    //    gd_id	int
    private Integer gdId;
    //    gd_goods_id	int
    private Goods gdGoods;
    //    gd_color_id	int
    private Color gdColor;
    //    gd_memory_id	int
    private Memory gdMemory;
    //    gd_price	double
    private Double gdPrice;
    //    gd_num	int
    private Integer gdNum;


}
