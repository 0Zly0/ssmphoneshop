package com.oracle.ssmphone.service.impl;

import com.oracle.ssmphone.domain.*;
import com.oracle.ssmphone.mapper.GoodsMapper;
import com.oracle.ssmphone.service.GoodService;
import com.oracle.ssmphone.vo.SearchVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodServiceImpl implements GoodService {
    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public List<Goods> showGoods(SearchVo searchVo) {
        return goodsMapper.find(searchVo);
    }

    @Override
    public Goods detailsGoods(Integer goodsId) {
        return goodsMapper.getLazy(goodsId);
    }

    @Override
    public void saveGoods(Goods good) {
//        商品表:goods
        goodsMapper.saveWithKey(good);
        Integer goodsId = good.getGoodsId();
//        商品标签关系表:goods_labels
        if (good.getLabelsList() != null && good.getLabelsList().size() > 0) {
            for (Labels labels : good.getLabelsList()) {
                if (labels.getLabelId() != null) {
                    goodsMapper.saveGoodsLabel(labels.getLabelId(), goodsId);
                }
            }
        }
//        商品颜色关系表:goods_color
        if (good.getColorList() != null && good.getColorList().size() > 0) {
            for (Color color : good.getColorList()) {
                if (color.getColorId() != null) {
                    goodsMapper.saveGoodsColor(color.getColorId(), goodsId);
                }
            }
        }
//        商品内存关系表:goods_memory
        if (good.getMemoryList() != null && good.getMemoryList().size() > 0) {
            for (Memory memory : good.getMemoryList()) {
                if (memory.getMemoryId() != null) {
                    goodsMapper.saveGoodsMemory(memory.getMemoryId(), goodsId);
                }
            }
        }
//        商品图片表:goods_img
        if (good.getGoodsImgList() != null && good.getGoodsImgList().size() > 0) {
            for (GoodsImg img : good.getGoodsImgList()) {
                if (img != null) {
                    // img.setImgGoods(good);//封装goodId
                    goodsMapper.saveGoodsImg(img, goodsId);
                }
            }

        }

    }

    @Override
    public void deleteGoods(Integer goodId) {

    }

    @Override
    public void updateGoods(Goods good) {
        //1.更新goods表
        //2.删除goods_color表中该商品相关记录重新添加商品关联的颜色
        //3.删除goods_labels表中该商品相关记录重新添加商品关联的标签
        //4.删除goods_memory表中该商品相关记录重新添加商品关联的内存
        //5. 删除goods_img表中该商品相关记录重新添加商品关联的图片
    }

    @Override
    public void takeDownGoods(Integer goodsId) {
        goodsMapper.deleteWithLogic(goodsId);
    }


}
