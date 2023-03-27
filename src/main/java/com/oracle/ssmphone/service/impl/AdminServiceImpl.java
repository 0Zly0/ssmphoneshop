package com.oracle.ssmphone.service.impl;

import com.oracle.ssmphone.domain.Admin;
import com.oracle.ssmphone.mapper.AdminMapper;
import com.oracle.ssmphone.service.AdminService;
import com.oracle.ssmphone.utils.MD5Util;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public Admin login(String name, String pwd) {
        return adminMapper.findByNameAndPwd(name, MD5Util.MD5ToString(pwd));
    }
}
