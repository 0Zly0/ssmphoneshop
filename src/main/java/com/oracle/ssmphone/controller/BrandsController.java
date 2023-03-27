package com.oracle.ssmphone.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.ssmphone.domain.Brands;
import com.oracle.ssmphone.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;
@Controller
@RequestMapping("/brands")
public class BrandsController {
    @Autowired
    private BrandService brandService;
    @RequestMapping("/list")
    public String list(Brands brands, Integer pageNum, Map<String, Object> model) {
        if (pageNum == null) {
            pageNum = 1;//未带页号，默认为第1页
        }        //查询之前
        PageHelper.startPage(pageNum, 10);//10:每页记录数
        List<Brands> list = brandService.showBrand(brands);
        PageInfo<Brands> pv = new PageInfo<>(list);
        model.put("pv", pv);
        model.put("keyBrand", brands);//回显
        return "/admin/brands/show";
    }
    @RequestMapping("/delete")
    public String delete(Integer brandId) {
        brandService.deleteBrand(brandId);
        return "redirect:../brands/list";//重新查看显示
    }
    @RequestMapping("/save")
    public String save(Brands brands)//使用实体做为参数:前端name对应实体中属性
    {     brandService.saveBrand(brands);
        //调用业务实现添加
        return "redirect:../brands/list";//重新查看显示
    }
    @RequestMapping("/update")
    public String update(Brands brands) {

        brandService.updateBrand(brands);
        return "redirect:../brands/list";//重新查看显示
    }
}
