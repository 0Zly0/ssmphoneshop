package com.oracle.ssmphone.service.impl;

import com.oracle.ssmphone.domain.Labels;
import com.oracle.ssmphone.mapper.LabelMapper;
import com.oracle.ssmphone.service.LabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class LabelServiceImpl implements LabelService {
    @Autowired
    private LabelMapper labelMapper;
    @Override
    public List<Labels> showLabel() {
        return labelMapper.find();
    }
}
