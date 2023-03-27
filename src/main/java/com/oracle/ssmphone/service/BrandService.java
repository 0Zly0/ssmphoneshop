package com.oracle.ssmphone.service;

import com.oracle.ssmphone.domain.Brands;

import java.util.List;

public interface BrandService {
    public List<Brands> showBrand(Brands brands);
    public void saveBrand(Brands brands);
    public void deleteBrand(Integer brandId);
    public void updateBrand(Brands brands);
    public Brands brandDetails(Integer brandId);
}
