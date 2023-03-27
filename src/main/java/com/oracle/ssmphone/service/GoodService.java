package com.oracle.ssmphone.service;

import com.oracle.ssmphone.domain.Goods;
import com.oracle.ssmphone.vo.SearchVo;

import java.util.List;

public interface GoodService {
    public List<Goods> showGoods(SearchVo searchVo);
    public Goods detailsGoods(Integer goodsId);
    public void saveGoods(Goods good);
    public void deleteGoods(Integer goodId);
    public void updateGoods(Goods good);
    public void takeDownGoods(Integer goodsId);//下架
}
