package com.oracle.ssmphone.service.impl;

import com.oracle.ssmphone.domain.User;
import com.oracle.ssmphone.mapper.UserMapper;
import com.oracle.ssmphone.service.UserService;
import com.oracle.ssmphone.utils.ImageUtil;
import com.oracle.ssmphone.utils.MD5Util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service//@Service("userService")根据"userService"查找，如果未指定名字，查找类名首字母小写userServiceImpl
public class UserServiceImpl implements UserService {
    @Autowired//自动注入
    private UserMapper userMapper;//业务中所有方法都可以使用

    @Override
    public User login(String name, String pwd) throws Exception {
        User user = null;
        try {
            user = userMapper.findByNameAndPwd(name, MD5Util.MD5ToString(pwd));
        } catch (Exception e) {
            throw e;
        }
        return user;
    }

    @Override
    public void reg(User user) throws Exception {
        try {
            user.setUserPass(MD5Util.MD5ToString(user.getUserPass()));//MD5加密
            userMapper.save(user);
        } catch (Exception e) {
            throw e;
        }
    }


    @Override
    public List<User> showUsers() {

        // 调用find方法
        List<User> list = userMapper.find();


        return list;
    }

    @Override
    public void updateUser(User user) {
        user.setUserPass(MD5Util.MD5ToString(user.getUserPass()));
        userMapper.update(user);
    }
}
