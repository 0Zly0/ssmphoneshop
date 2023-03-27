package com.oracle.ssmphone.domain;

import lombok.Data;

import java.io.Serializable;

/**
 * 管理员实体类
 */
@Data
public class Admin implements Serializable {
    //    admin_id	int
    private Integer adminId;
    //    admin_name	varchar
    private String adminName;
    //    admin_pass	varchar
    private String adminPass;
    //    admin_role_id	int
    private Role adminRole;//管理员的角色




}
