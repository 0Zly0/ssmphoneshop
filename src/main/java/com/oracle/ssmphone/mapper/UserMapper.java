package com.oracle.ssmphone.mapper;

import com.oracle.ssmphone.domain.User;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
@MapperScan
public interface UserMapper {//Users表对应的Mapper接口
//查询所有用户
    public List<User> find();
    //根据账号和密码查询(多个参数)
    public User findByNameAndPwd(@Param("name") String name,@Param("pwd") String pwd);
    //根据id查询用户的方法(单个参数)
    public User get(Integer userId);
    //添加用户 参数: 对象
    public void save(User user);
    //删除用户 根据主键
    public void delete(Integer userId);
    //更新用户
    public void update(User user);

}
