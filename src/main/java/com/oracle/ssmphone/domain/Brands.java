package com.oracle.ssmphone.domain;

import lombok.Data;

import java.io.Serializable;

@Data
public class Brands implements Serializable {
    //    brand_id	int
    private Integer brandId;
    //    brand_name	varchar
    private String brandName;


}
