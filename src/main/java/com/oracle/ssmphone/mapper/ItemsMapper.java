package com.oracle.ssmphone.mapper;

import com.oracle.ssmphone.domain.Items;
import com.oracle.ssmphone.domain.User;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface ItemsMapper {
public void addItems(Items items);
public void updateNum(Items items);
public Items findItems(Items key);
public List<Items> findByUser(User user);
public void delete(Integer itemId);
public void deleteByUser(User user);
public void deleteDetach(@Param("ids") Integer[] ids);
}
