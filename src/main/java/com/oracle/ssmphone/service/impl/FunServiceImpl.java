package com.oracle.ssmphone.service.impl;

import com.oracle.ssmphone.domain.Funs;
import com.oracle.ssmphone.mapper.FunMapper;
import com.oracle.ssmphone.service.FunService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FunServiceImpl implements FunService {
    @Autowired
    private FunMapper funMapper;

    @Override
    public List<Funs> showFuns(Funs fun) {

        return funMapper.showFuns(fun);
    }

    @Override
    public void deleteFuns(Integer funId) {
        funMapper.deleteByPid(funId);//先删除关联的记录(子记录)
        funMapper.delete(funId);
    }

    @Override
    public void saveFuns(Funs fun) {
        funMapper.save(fun);
    }

    @Override
    public List<Funs> showLevel1(Integer funLevel) {
        List<Funs> funOneList = funMapper.findFunByLevel(funLevel);
        for (Funs fun : funOneList) {//建议:foreach或者lambal表达式
            List<Funs> funTwoList = funMapper.findFunByPid(fun.getFunId());
            //封装
            fun.setTwoFunList(funTwoList);//指定该菜单的二级菜单列表
        }
        return funOneList;
    }

    @Override
    public Funs funDetails(Integer fundId) {
        return funMapper.get(fundId);
    }

    @Override
    public void updateFun(Funs fun) {
        funMapper.update(fun);
    }
}
