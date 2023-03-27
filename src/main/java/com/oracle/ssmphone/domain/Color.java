package com.oracle.ssmphone.domain;

import lombok.Data;

import java.io.Serializable;

@Data
public class Color implements Serializable {
    //    color_id	int
    private Integer colorId;
    //    color_name	varchar
    private String colorName;


}
