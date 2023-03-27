package com.oracle.ssmphone.service;

import com.oracle.ssmphone.domain.User;

import java.util.List;

//业务接口：对应功能需求
public interface UserService {
    //项目中有登陆功能，业务方法名叫login
    public User login(String name,String pwd) throws Exception;
    //项目中有注册功能,业务方法名叫reg
    public void reg(User user) throws Exception;
    //查询所有用户
    public List<User> showUsers();

    public void updateUser(User user);
}
