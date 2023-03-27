package com.oracle.ssmphone.service;

import com.oracle.ssmphone.domain.Reci;
import com.oracle.ssmphone.domain.User;

import java.util.List;

public interface ReciService {
    public List<Reci> showReciOfUser(User user) throws Exception;
    public Reci detailsReci(Integer reciId) throws Exception;
    public void addReci(Reci reci) throws Exception;
    public void updateReci(Reci reci);
}
