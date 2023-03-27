package com.oracle.ssmphone.domain;



import lombok.Data;

import java.io.Serializable;
//users表对应的实体类：实现序列化接口
@Data
public class User implements Serializable {
//属性要与user表中的字段对应(企业级做法(驼峰转换):表中user_name 属性:userName)
    //字段 int实体中建议使用Integer(可以为null)
    private Integer userId;
    private String userName;
    private String userPass;
    private String userPhone;


}
