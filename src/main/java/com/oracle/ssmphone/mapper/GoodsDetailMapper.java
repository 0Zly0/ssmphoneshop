package com.oracle.ssmphone.mapper;

import com.oracle.ssmphone.domain.GoodsDetail;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface GoodsDetailMapper {
//根据明细编号查询商品明细(关联内存和颜色)
    public GoodsDetail get(Integer gdId);
    public Integer getGdId(GoodsDetail gd);//根据商品id、颜色id、内存id获取商品明细id
    public void update(GoodsDetail gd);
    public void updateGdNum(@Param("gdId") Integer gdId,
                            @Param("num") Integer num);
    public Integer getNum(Integer gdId);
}
