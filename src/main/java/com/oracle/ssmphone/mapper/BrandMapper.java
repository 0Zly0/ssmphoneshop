package com.oracle.ssmphone.mapper;

import com.oracle.ssmphone.domain.Brands;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface BrandMapper {
public List<Brands> find(Brands brands);//条件查询
public Brands get(Integer brandId);//根据id查询
public void save(Brands brands);
public void delete(Integer brandId);
public void update(Brands brands);
}
