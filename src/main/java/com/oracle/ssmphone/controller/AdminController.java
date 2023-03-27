package com.oracle.ssmphone.controller;


import com.oracle.ssmphone.domain.Admin;
import com.oracle.ssmphone.domain.Funs;
import com.oracle.ssmphone.service.AdminService;
import com.oracle.ssmphone.service.FunService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;
    @Autowired
   private FunService funService;
    @RequestMapping("/login")
    public String login(String adminName, String adminPass, HttpSession session, Map<String, Object> model) {
        Admin admin = adminService.login(adminName, adminPass);
        if (admin != null)//登陆成功
        {
            session.setAttribute("admin", admin);
            List<Funs> funList=funService.showLevel1(1);//查询一级菜单，对应的二级菜单已封装
            session.setAttribute("funList",funList);
            return "/admin/main";
        }
        model.put("error", "失败!");
        return "/adminlogin";//登陆失败
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session)//退出
    {
        session.removeAttribute("admin");
        return "/adminlogin";
    }
}
