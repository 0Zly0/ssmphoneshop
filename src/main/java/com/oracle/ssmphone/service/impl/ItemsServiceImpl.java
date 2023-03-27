package com.oracle.ssmphone.service.impl;

import com.oracle.ssmphone.domain.Items;
import com.oracle.ssmphone.domain.User;
import com.oracle.ssmphone.mapper.ItemsMapper;
import com.oracle.ssmphone.service.ItemsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemsServiceImpl implements ItemsService {
    @Autowired
    private ItemsMapper itemsMapper;

    @Override
    public void addItems(Items items) throws Exception {
        try {
            //item_user_id、item_goods_detail_id一致的，执行更新
            Items tempItem = itemsMapper.findItems(items);
            if (tempItem != null)//更新数量
            {
                items.setItemNum(items.getItemNum() + tempItem.getItemNum());
                itemsMapper.updateNum(items);//更新数量
            } else {
                itemsMapper.addItems(items);
            }
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<Items> showItemsByUser(User user) throws Exception {
        List<Items> list = null;
        try {
            list = itemsMapper.findByUser(user);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }

    @Override
    public void removeItem(Integer itemId) {
        try {
            itemsMapper.delete(itemId);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public void removeItem(Integer[] itemIds) throws Exception{
        try {
            itemsMapper.deleteDetach(itemIds);
        } catch (Exception e) {
            throw e;
        }
    }
}
