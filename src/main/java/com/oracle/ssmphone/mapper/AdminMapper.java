package com.oracle.ssmphone.mapper;

import com.oracle.ssmphone.domain.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
    public Admin findByNameAndPwd(@Param("name") String name, @Param("pwd") String pwd);
}
