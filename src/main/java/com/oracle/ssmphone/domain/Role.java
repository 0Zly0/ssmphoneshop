package com.oracle.ssmphone.domain;

import lombok.Data;

import java.util.List;

@Data
public class Role {
    //    role_id	int
    private Integer roleId;
    //    role_name	varchar
    private String roleName;
    //角色的一级菜单列表
    private List<Funs> oneFunList;


}
