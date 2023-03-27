package com.oracle.ssmphone.domain;


import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 功能实体类
 */
@Data
public class Funs implements Serializable {
    //    fun_id	int
    private Integer funId;
    //    fun_name	varchar
    private String funName;
    //    fun_url	varchar
    private String funUrl;
    //    fun_pid	int
    private Integer funPid;
    //    fun_target	varchar
    private String funTarget;
    //    fun_sort	int
    private Integer funSort;
    //一级菜单的二级菜单列表
    private List<Funs> twoFunList;
    //增加funLevel
    private Integer funLevel;


}
