package com.oracle.ssmphone.controller;

import com.oracle.ssmphone.service.UserService;
import com.oracle.ssmphone.utils.ImageUtil;
import com.oracle.ssmphone.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.oracle.ssmphone.domain.User;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.OutputStream;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;//自动注入

    @RequestMapping("/logOut")
    public String logOut(HttpSession session) {
        session.removeAttribute("user");
        
        return "/userlogin";
    }

    @RequestMapping("/updatePass")
    public String updatePass(User user,HttpSession session){
        User user1 = (User) session.getAttribute("user");
        String userPass = user.getUserPass();
        user1.setUserPass(userPass);
        userService.updateUser(user1);
        return "/userlogin";
    }

    @RequestMapping("/reg")
    public ModelAndView reg(User user, String validateCode, HttpSession session) throws Exception {//加上验证码
        ModelAndView mv = new ModelAndView();
        //先验证验证码:验证码通过，则调用业务注册，否则转向注册页给出提示
        // 从 session中获取保存的验证码
        if (session.getAttribute("validateCode").toString().equals(validateCode)) {
            try {
                userService.reg(user);
                mv.setViewName("/userlogin");
            } catch (Exception e) {
                throw e;
            }
        } else {
            mv.setViewName("/reg");
            mv.getModel().put("error", "验证码错误!");
        }

        return mv;
    }

    //验证码
    @ResponseBody
    @RequestMapping(value = "/code", method = RequestMethod.GET)
    public void validateCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //第一个参数是生成的验证码，第二个参数是生成的图片
        Object[] objs = ImageUtil.createImage();
        //将验证码存入Session
        request.getSession(true).setAttribute("validateCode", objs[0]);
        //将图片输出给浏览器
        BufferedImage image = (BufferedImage) objs[1];
        // 禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        OutputStream os = response.getOutputStream();
        ImageIO.write(image, "jpeg", os);
        os.flush();
    }

    @RequestMapping("/login")
    public ModelAndView login(String name, String pwd, HttpSession session) throws Exception {
        User user = null;
        ModelAndView mv = new ModelAndView("/vip/vip");
        try {
            user = userService.login(name, pwd);

            if (user != null)//登陆成功
            {
                session.setAttribute("user", user);
                return mv;

            } else {//失败
                //登陆失败的错误提示
                mv.getModel().put("error", "登陆失败!");
                mv.setViewName("/userlogin");
                return mv;
            }

        } catch (Exception e) {
            throw e;
        }
    }
}