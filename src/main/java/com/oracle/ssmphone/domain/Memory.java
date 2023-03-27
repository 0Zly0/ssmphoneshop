package com.oracle.ssmphone.domain;

import lombok.Data;

import java.io.Serializable;

@Data
public class Memory implements Serializable {
    //    memory_id	int
    private Integer memoryId;
    //    memory_name	varchar
    private String memoryName;


}
