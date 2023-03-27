package com.oracle.ssmphone.mapper;

import com.oracle.ssmphone.domain.Goods;
import com.oracle.ssmphone.domain.GoodsImg;
import com.oracle.ssmphone.vo.SearchVo;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface GoodsMapper {
 public List<Goods> find(SearchVo searchVo);
 public Goods get(Integer goodsId);
 public Goods getLazy(Integer goodsId);
 //添加商品:主键回填
 public void saveWithKey(Goods good);
 //添加商品关联的颜色
 public void saveGoodsColor(@Param("colorId")Integer colorId, @Param("goodId")Integer goodId);
 //添加商品关联的标签
 public void saveGoodsLabel(@Param("labelId")Integer colorId, @Param("goodId")Integer goodId);
 //添加商品关联内存
 public void saveGoodsMemory(@Param("memoryId")Integer colorId, @Param("goodId")Integer goodId);
//添加商品关联图片
 public void saveGoodsImg(@Param("goodsImg") GoodsImg goodsImg,@Param("goodsId")Integer goodsId);
//逻辑删除
 public void deleteWithLogic(Integer goodsId);
}
