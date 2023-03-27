package com.oracle.ssmphone.service;


import com.oracle.ssmphone.domain.Funs;

import java.util.List;

public interface FunService {
    //查询以show开头
    public List<Funs> showFuns(Funs fun);//根据条件查询
//删除
    public void deleteFuns(Integer funId);
    //添加
    public void saveFuns(Funs fun);
    //显示一级  show开头
    public List<Funs> showLevel1(Integer funLevel);
    //展示详情
    public Funs funDetails(Integer fundId);
    //更新
    public void updateFun(Funs fun);
}
