package com.oracle.ssmphone.service.impl;

import com.oracle.ssmphone.domain.GoodsDetail;
import com.oracle.ssmphone.mapper.GoodsDetailMapper;
import com.oracle.ssmphone.service.GoodsDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GoodsDetailServiceImpl implements GoodsDetailService {
    @Autowired
    private GoodsDetailMapper goodsDetailMapper;

    @Override
    public Integer showGdId(GoodsDetail gd) {
        return goodsDetailMapper.getGdId(gd);
    }

    @Override
    public GoodsDetail detailsGd(Integer gdId) throws Exception {
        GoodsDetail gd = null;
        try {
            gd = goodsDetailMapper.get(gdId);
        } catch (Exception e) {
            throw e;
        }
        return gd;
    }

    @Override
    public void updateSku(Integer gdId, Integer num) throws Exception {
        try {
            GoodsDetail gd = new GoodsDetail();
            gd.setGdId(gdId);
            gd.setGdNum(num);
            goodsDetailMapper.update(gd);
        } catch (Exception e) {
            throw e;
        }
    }
}
