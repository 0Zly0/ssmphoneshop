package com.oracle.ssmphone.controller;

import com.oracle.ssmphone.domain.*;
import com.oracle.ssmphone.mapper.LabelMapper;
import com.oracle.ssmphone.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/to")
public class ToController {
    @Autowired
    private FunService funService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private ColorService colorService;
    @Autowired
    private MemoryService memoryService;
    @Autowired
    private LabelService labelService;
    @Autowired
    private GoodService goodService;

    @RequestMapping("/{path}/{file}")
    public String path(
            @PathVariable("path") String path,
            @PathVariable("file") String file) {
        return path + File.separator + file;
    }

    @RequestMapping("/{path1}/{path2}/{file}")
    public String path2(
            @PathVariable("path1") String path1,
            @PathVariable("path2") String path2,
            @PathVariable("file") String file, Integer funId, Map<String, Object> model) {
        if ("funs".equals(path2) && "save".equals(file))//admin/funs/save
        {
            //查询一级菜单
            List<Funs> funsList = funService.showLevel1(1);
            model.put("funsList", funsList);
        }
        if ("funs".equals(path2) && "update".equals(file))//admin/funs/save
        {
            //查询一级菜单
            List<Funs> funsList = funService.showLevel1(1);
            model.put("funsList", funsList);
            Funs fun = funService.funDetails(funId);
            model.put("fun", fun);
        }
        if ("brands".equals(path2) && "update".equals(file))//admin/funs/save
        {
            Brands brands = brandService.brandDetails(funId);
            model.put("brand", brands);
        }
        if ("goods".equals(path2) && "save".equals(file))//admin/goods/save
        {
            List<Brands> brandsList = brandService.showBrand(null);
            List<Color> colorList = colorService.showColor();
            List<Memory> memoryList = memoryService.showMemory();
            List<Labels> labelsList = labelService.showLabel();
            model.put("brandsList", brandsList);
            model.put("colorList", colorList);
            model.put("memoryList", memoryList);
            model.put("labelsList", labelsList);
        }
        if ("goods".equals(path2) && "update".equals(file))//admin/goods/save
        {
            List<Brands> brandsList = brandService.showBrand(null);
            List<Color> colorList = colorService.showColor();
            List<Memory> memoryList = memoryService.showMemory();
            List<Labels> labelsList = labelService.showLabel();
            Goods goods = goodService.detailsGoods(funId);
            model.put("brandsList", brandsList);
            model.put("colorList", colorList);
            model.put("memoryList", memoryList);
            model.put("labelsList", labelsList);
            model.put("goods", goods);
        }
        return path1 + File.separator + path2 + File.separator + file;
    }

    @RequestMapping("/{file}")
    public String file(@PathVariable("file") String file) {
        return file;
    }
}
