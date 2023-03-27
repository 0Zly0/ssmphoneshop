package com.oracle.ssmphone.service.impl;

import com.oracle.ssmphone.domain.Memory;
import com.oracle.ssmphone.mapper.MemoryMapper;
import com.oracle.ssmphone.service.MemoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MemoryServiceImpl implements MemoryService {
    @Autowired
    private MemoryMapper memoryMapper;
    @Override
    public List<Memory> showMemory() {
        return memoryMapper.find();
    }
}
