package com.oracle.ssmphone.service.impl;

import com.oracle.ssmphone.domain.Reci;
import com.oracle.ssmphone.domain.User;
import com.oracle.ssmphone.mapper.ReciMapper;
import com.oracle.ssmphone.service.ReciService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReciServiceImpl implements ReciService {
    @Autowired
    private ReciMapper reciMapper;

    @Override
    public List<Reci> showReciOfUser(User user) throws Exception {
        List<Reci> list = null;
        try {
            list = reciMapper.findByUser(user);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }

    @Override
    public Reci detailsReci(Integer reciId) throws Exception {
        Reci reci = null;
        try {
            reci = reciMapper.get(reciId);
        } catch (Exception e) {
            throw e;
        }
        return reci;
    }

    @Override
    public void addReci(Reci reci) throws Exception {
        try {
            reciMapper.save(reci);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public void updateReci(Reci reci) {
        reciMapper.updateReciAddr(reci);
    }
}
