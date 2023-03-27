package com.oracle.ssmphone.controller;

import com.oracle.ssmphone.domain.*;
import com.oracle.ssmphone.service.GoodsDetailService;
import com.oracle.ssmphone.service.ItemsService;
import com.oracle.ssmphone.service.ReciService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/cart")
public class CarController {
    @Autowired
    private GoodsDetailService goodsDetailService;
    @Autowired
    private ItemsService itemsService;
    @Autowired
    private ReciService reciService;


    @RequestMapping("/showItem")
    public String show(HttpSession session, Map<String, Object> model) {

        try {
            //获取收货地址
            User user = (User) session.getAttribute("user");
            List<Reci> reciList = reciService.showReciOfUser(user);

            List<Items> list = itemsService.showItemsByUser(user);
            Double sumPrice = 0.0;
            for (Items item : list) {
                sumPrice += item.getItemNum() * item.getItemGoodsDetail().getGdPrice();
            }
            model.put("sumPrice", sumPrice);
            model.put("itemList", list);
            model.put("reciList", reciList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/cart/list";
    }

    @RequestMapping(value = "/addItem", method = RequestMethod.POST)
    public String addCart(Items items, HttpSession session) {
//思路:gd_goods_id、gd_color_id、gd_memory_id查询gd_id
        Integer gdId = goodsDetailService.showGdId(items.getItemGoodsDetail());
        //处理userid
        User user = (User) session.getAttribute("user");
        items.setItemUser(user);
        items.getItemGoodsDetail().setGdId(gdId);
        try {
            itemsService.addItems(items);
            //转到item显示页面
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:../cart/showItem";
    }

    @ResponseBody
    @RequestMapping(value = "/addItemAjax", method = RequestMethod.POST)
    public Integer addCartAjax(Items items, HttpSession session) {
        Integer gdId = goodsDetailService.showGdId(items.getItemGoodsDetail());
        //处理userid
        User user = (User) session.getAttribute("user");
        items.setItemUser(user);
        items.getItemGoodsDetail().setGdId(gdId);
        try {
            itemsService.addItems(items);
            //转到item显示页面
        } catch (Exception e) {
            return 0;
        }
        return 1;
    }

    @ResponseBody
    @RequestMapping(value = "/details/{goodId}/{cid}/{mid}", method = RequestMethod.GET)
    public Double details(@PathVariable("goodId") Integer goodId, @PathVariable("cid") Integer cid, @PathVariable("mid") Integer mid) {
        GoodsDetail gd = null;
        try {
            GoodsDetail gdTemp = new GoodsDetail();
            Color color = new Color();
            color.setColorId(cid);
            gdTemp.setGdColor(color);
            Memory memory = new Memory();
            memory.setMemoryId(mid);
            gdTemp.setGdMemory(memory);
            Goods goods = new Goods();
            goods.setGoodsId(goodId);
            gdTemp.setGdGoods(goods);
            Integer gdId = goodsDetailService.showGdId(gdTemp);
            gd = goodsDetailService.detailsGd(gdId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return gd.getGdPrice();
    }

    @ResponseBody
    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public Integer removeItemAjax(Integer[] itemIds)//考虑批量删除
    {
        try {
            itemsService.removeItem(itemIds);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }


}
