package com.oracle.ssmphone.domain;

import lombok.Data;

@Data
public class GoodsImg {
    //    img_id	int
    private Integer imgId;
    //    img_big	varchar
    private String imgBig;
    //    img_small	varchar
    private String imgSmall;
    //    img_goods_id	int
    private Goods imgGoods;

}
