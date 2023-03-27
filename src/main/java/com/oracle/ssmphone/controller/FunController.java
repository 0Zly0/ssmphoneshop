package com.oracle.ssmphone.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.ssmphone.domain.Funs;
import com.oracle.ssmphone.service.FunService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/fun")
public class FunController {
    @Autowired
    private FunService funService;

    @RequestMapping("/list")
    public ModelAndView list(Funs fun, Integer pageNum) {//存查询条件  pageNum: 当前页号
        if (pageNum == null) {
            pageNum = 1;//未带页号，默认为第1页
        }
        //查询之前
        PageHelper.startPage(pageNum, 10);//10:每页记录数
        List<Funs> list = funService.showFuns(fun);
        PageInfo<Funs> pv = new PageInfo<>(list);//将查询结果封装到pv中
        //非登陆信息，建议存入request
        ModelAndView mv = new ModelAndView();
        //  mv.getModel().put("list", list);
        mv.getModel().put("pv", pv);
        mv.getModel().put("keyFun", fun);//回显查询条件
        mv.setViewName("/admin/funs/show");
        return mv;
    }

    @RequestMapping("/delete")
    public String delete(Integer funId) {
        funService.deleteFuns(funId);//手机商城最后优化环节处理失败情况
        return "redirect:../fun/list";//重新查看显示
    }

    @RequestMapping("/save")
    public String save(Funs fun)//使用实体做为参数:前端name对应实体中属性
    {
        fun.setFunLevel(fun.getFunPid() == null ? 1 : 2);//处理level
        funService.saveFuns(fun);
        //调用业务实现添加
        return "redirect:../fun/list";//重新查看显示
    }

    @RequestMapping("/update")
    public String update(Funs fun) {
        fun.setFunLevel(fun.getFunPid() == null ? 1 : 2);//处理level
        funService.updateFun(fun);
        return "redirect:../fun/list";//重新查看显示
    }
}
