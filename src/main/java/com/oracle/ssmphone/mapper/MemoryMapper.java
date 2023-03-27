package com.oracle.ssmphone.mapper;

import com.oracle.ssmphone.domain.Color;
import com.oracle.ssmphone.domain.Memory;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface MemoryMapper {
    public List<Memory> find();
    public List<Color> findByGoodsId(Integer goodsId);
}
