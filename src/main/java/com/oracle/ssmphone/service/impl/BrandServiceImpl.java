package com.oracle.ssmphone.service.impl;

import com.oracle.ssmphone.domain.Brands;
import com.oracle.ssmphone.mapper.BrandMapper;
import com.oracle.ssmphone.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BrandServiceImpl implements BrandService {
    @Autowired
    private BrandMapper brandMapper;
    @Override
    public List<Brands> showBrand(Brands brands) {
        return brandMapper.find(brands);
    }

    @Override
    public void saveBrand(Brands brands) {
      brandMapper.save(brands);
    }

    @Override
    public void deleteBrand(Integer brandId) {
        brandMapper.delete(brandId);
    }

    @Override
    public void updateBrand(Brands brands) {
     brandMapper.update(brands);
    }

    @Override
    public Brands brandDetails(Integer brandId) {
      return  brandMapper.get(brandId);
    }
}
