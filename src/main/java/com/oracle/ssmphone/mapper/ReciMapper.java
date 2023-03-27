package com.oracle.ssmphone.mapper;

import com.oracle.ssmphone.domain.Reci;
import com.oracle.ssmphone.domain.User;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface ReciMapper {
    public List<Reci> findByUser(User user);
    public Reci get(Integer reciId);
    public void save(Reci reci);
    public void updateReciAddr(Reci reci);
}
