package com.oracle.ssmphone.service;

import com.oracle.ssmphone.domain.PriceRanges;

import java.util.List;

public interface PriceRangesService {
    public List<PriceRanges> showPriceRanges();
    public PriceRanges detailsPriceRanges(Integer prId);
}
