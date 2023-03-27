package com.oracle.ssmphone.domain;

import lombok.Data;

import java.io.Serializable;

@Data
public class Labels implements Serializable {
    //    label_id	int
    private Integer labelId;
    //    label_name	varchar
    private String labelName;


}
