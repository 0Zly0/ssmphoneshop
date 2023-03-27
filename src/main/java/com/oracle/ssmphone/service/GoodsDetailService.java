package com.oracle.ssmphone.service;

import com.oracle.ssmphone.domain.GoodsDetail;

public interface GoodsDetailService {
    public Integer showGdId(GoodsDetail gd);
    public GoodsDetail detailsGd(Integer gdId) throws Exception;
    public void updateSku(Integer gdId,Integer num) throws Exception;//修改sku库存
}
