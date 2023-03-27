package com.oracle.ssmphone.service;

import com.oracle.ssmphone.domain.Admin;

public interface AdminService {
    //管理员登陆
    public Admin login(String name, String pwd);
}
