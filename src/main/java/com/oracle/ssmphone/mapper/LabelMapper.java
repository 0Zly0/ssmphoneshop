package com.oracle.ssmphone.mapper;

import com.oracle.ssmphone.domain.Color;
import com.oracle.ssmphone.domain.Labels;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface LabelMapper {
    public List<Labels> find();
    public List<Color> findByGoodsId(Integer goodsId);
}
