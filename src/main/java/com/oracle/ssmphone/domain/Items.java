package com.oracle.ssmphone.domain;

import lombok.Data;

@Data
public class Items {
    //    item_id	int
    private Integer itemId;
    //    item_goods_detail_id	int
    private GoodsDetail itemGoodsDetail;
    //    item_num	int
    private Integer itemNum;
    //    item_user_id	int
    private User itemUser;

}
