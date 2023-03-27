package com.oracle.ssmphone.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.ssmphone.domain.*;
import com.oracle.ssmphone.service.BrandService;
import com.oracle.ssmphone.service.GoodService;
import com.oracle.ssmphone.service.LabelService;
import com.oracle.ssmphone.service.PriceRangesService;
import com.oracle.ssmphone.utils.FileUtil;
import com.oracle.ssmphone.utils.UploadFileUtil;
import com.oracle.ssmphone.vo.SearchVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/goods")
public class GoodsController {
    @Autowired
    private GoodService goodService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private PriceRangesService priceRangesService;
    @Autowired
    private LabelService labelService;

    @RequestMapping("/list")
    public String list(Integer pageNum, SearchVo searchVo, Map<String, Object> model) {
        if (pageNum == null) {
            pageNum = 1;//未带页号，默认为第1页
        }
        //封装最大和最小价格
        if (searchVo != null) {
            if (searchVo.getPrId() != null) {
                PriceRanges pr = priceRangesService.detailsPriceRanges(searchVo.getPrId());
                searchVo.setPrMin(pr.getPrMin());
                searchVo.setPrMax(pr.getPrMax());
            }
        }
        model.put("searchVo", searchVo);
        List<Brands> brandsList = brandService.showBrand(null);//类型列表
        List<PriceRanges> priceRangesList = priceRangesService.showPriceRanges();//价格区间
        List<Labels> labellist = labelService.showLabel();
        model.put("brandsList", brandsList);
        model.put("priceRangesList", priceRangesList);
        model.put("labellist", labellist);
        PageHelper.startPage(pageNum, 10);
        List<Goods> list = goodService.showGoods(searchVo);
        PageInfo<Goods> pv = new PageInfo<>(list);
        model.put("pv", pv);
        return "/admin/goods/show";
    }

    @RequestMapping("/details/{goodsId}")
    public String details(@PathVariable("goodsId") Integer goodsId, Map<String, Object> model) {
        Goods good = goodService.detailsGoods(goodsId);
        model.put("good", good);
        return "/admin/goods/details";
    }

    @RequestMapping("/delete/{goodsId}")
    public String delete(@PathVariable("goodsId") Integer goodsId) {
        // System.out.println(goodsId);
        goodService.takeDownGoods(goodsId);
        return "redirect:../../goods/list";//重新查看显示
    }

    @RequestMapping("/save")
    public String save(Goods good, MultipartFile goodsImgListFile, MultipartFile goodsImgFile, HttpSession session) throws IOException {
        //1.获取新的文件名2.将文件已新文件名转存
        String goodsImgName = UploadFileUtil.doUpload(goodsImgFile, "/static/images/", session);
        good.setGoodsImg(goodsImgName);//指定新文件名字
        String newFileListName = UploadFileUtil.doUpload(goodsImgListFile, "/static/images/", session);
        //处理商品图片集合:注意，本次只上传一张图片做为imgSmall imgBig
        List<GoodsImg> goodsImgList = new ArrayList<>();
        GoodsImg goodsImg = new GoodsImg();
        goodsImg.setImgSmall(newFileListName);
        goodsImg.setImgBig(newFileListName);
        goodsImgList.add(goodsImg);
        good.setGoodsImgList(goodsImgList);
        goodService.saveGoods(good);

        return "redirect:../goods/list";//重新查看显示
    }

    @RequestMapping("/update")
    public String update(Goods good, MultipartFile goodsImgListFile, MultipartFile goodsImgFile, HttpSession session) throws IOException {
        String goodsImgName = UploadFileUtil.doUpload(goodsImgFile, "/static/images/", session);
        if (goodsImgName != null) {
            good.setGoodsImg(goodsImgName);//指定新文件名字
        }

        String newFileListName = UploadFileUtil.doUpload(goodsImgListFile, "/static/images/", session);
        if (newFileListName != null) {
            //处理商品图片集合:注意，本次只上传一张图片做为imgSmall imgBig
            List<GoodsImg> goodsImgList = new ArrayList<>();
            GoodsImg goodsImg = new GoodsImg();
            goodsImg.setImgSmall(newFileListName);
            goodsImg.setImgBig(newFileListName);
            goodsImgList.add(goodsImg);
            good.setGoodsImgList(goodsImgList);
        }
        //更新
        goodService.updateGoods(good);
        return "redirect:../goods/list";//重新查看显示
    }

    @RequestMapping("/toIndex")
    public String toIndex(Integer pageNum, SearchVo searchVo, Map<String, Object> model) {
        if (pageNum == null) {
            pageNum = 1;//未带页号，默认为第1页
        }
        //封装最大和最小价格
        if (searchVo != null) {
            if (searchVo.getPrId() != null) {
                PriceRanges pr = priceRangesService.detailsPriceRanges(searchVo.getPrId());
                searchVo.setPrMin(pr.getPrMin());
                searchVo.setPrMax(pr.getPrMax());
            }
        }
        model.put("searchVo", searchVo);
        List<Brands> brandsList = brandService.showBrand(null);//类型列表
        List<PriceRanges> priceRangesList = priceRangesService.showPriceRanges();//价格区间
        List<Labels> labellist = labelService.showLabel();
        model.put("brandsList", brandsList);
        model.put("priceRangesList", priceRangesList);
        model.put("labellist", labellist);
        PageHelper.startPage(pageNum, 8);
        List<Goods> list = goodService.showGoods(searchVo);
        PageInfo<Goods> pv = new PageInfo<>(list);
        model.put("pv", pv);
        return "/goods/list";
    }

    @RequestMapping("/show/{goodsId}")
    public String show(@PathVariable("goodsId") Integer goodsId, Map<String, Object> model) {
        Goods goods = goodService.detailsGoods(goodsId);
        model.put("goods", goods);
        return "/goods/show";
    }

}
