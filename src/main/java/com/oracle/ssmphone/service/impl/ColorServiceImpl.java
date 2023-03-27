package com.oracle.ssmphone.service.impl;

import com.oracle.ssmphone.domain.Color;
import com.oracle.ssmphone.mapper.ColorMapper;
import com.oracle.ssmphone.service.ColorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ColorServiceImpl implements ColorService {
    @Autowired
    private ColorMapper colorMapper;
    @Override
    public List<Color> showColor() {
        return colorMapper.find();
    }
}
