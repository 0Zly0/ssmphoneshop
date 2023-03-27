package com.oracle.ssmphone.service.impl;

import com.oracle.ssmphone.domain.PriceRanges;
import com.oracle.ssmphone.mapper.PriceRangesMapper;
import com.oracle.ssmphone.service.PriceRangesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PriceRangesServiceImpl implements PriceRangesService {
    @Autowired
    private PriceRangesMapper priceRangesMapper;
    @Override
    public List<PriceRanges> showPriceRanges() {
        return priceRangesMapper.find();
    }

    @Override
    public PriceRanges detailsPriceRanges(Integer prId) {
        return priceRangesMapper.get(prId);
    }
}
