package com.oracle.ssmphone.mapper;

import com.oracle.ssmphone.domain.Funs;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
@MapperScan
public interface FunMapper {

    public List<Funs> showFuns(Funs fun);//追加参数:按条件查询
    public void delete(Integer funId);//删除
    public void save(Funs fun);//添加
    public List<Funs> findFunByLevel(Integer funLevel);//根据funLevel查询
    public List<Funs> findFunByPid(Integer funPid);//根据funPid查询
    public void deleteByPid(Integer pid);//根据pid删除
    public Funs get(Integer funId);//根据id查询
    public void update(Funs fun);//更新

}
