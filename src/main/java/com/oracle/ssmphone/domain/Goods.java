package com.oracle.ssmphone.domain;

import lombok.Data;

import java.util.List;
@Data
public class Goods {
    //    goods_id	int
    private Integer goodsId;
    //    goods_name	varchar
    private String goodsName;
    //    goods_price	double
    private Double goodsPrice;
    //    goods_img	varchar
    private String goodsImg;
    //    goods_intr	varchar
    private String goodsIntr;

    //    goods_desc	varchar
    private String goodsDesc;
    //    goods_spec	varchar
    private String goodsSpec;
    //    goods_pack	varchar
    private String goodsPack;
    //    goods_serv	varchar
    private String goodsServ;
    //    goods_eval	int
    private Integer goodsEval;
    //    goods_num     int
    private Integer goodsNum;
    //    goods_brand_id	int
    private Brands goodsBrand;
    //  商品图片集合
    private List<GoodsImg> goodsImgList;
    //  商品的内存集合
    private List<Memory> memoryList;
    //  商品的颜色集合
    private List<Color> colorList;
    //商品标签
    private List<Labels> labelsList;

}
