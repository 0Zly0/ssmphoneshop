package com.oracle.ssmphone.mapper;

import com.oracle.ssmphone.domain.PriceRanges;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface PriceRangesMapper {
    public List<PriceRanges> find();
    public PriceRanges get(Integer prId);
}
