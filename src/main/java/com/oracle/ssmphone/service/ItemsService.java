package com.oracle.ssmphone.service;

import com.oracle.ssmphone.domain.Items;
import com.oracle.ssmphone.domain.User;

import java.util.List;

public interface ItemsService {
    public void addItems(Items items) throws Exception;
    public List<Items> showItemsByUser(User user) throws Exception;
    public void removeItem(Integer itemId);
    public void removeItem(Integer[] itemIds) throws Exception;
}
