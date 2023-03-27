package com.oracle.ssmphone.mapper;

import com.oracle.ssmphone.domain.Color;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface GoodsImgMapper {
    public List<Color> findByGoodsId(Integer goodsId);
}
