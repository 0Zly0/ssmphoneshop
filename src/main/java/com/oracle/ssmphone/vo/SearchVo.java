package com.oracle.ssmphone.vo;

import lombok.Data;

@Data
public class SearchVo {
    private String goodsName;
    private Integer brandId;
    private Integer labelId;
    private Double prMin;
    private Double prMax;
    private Integer prId;

}
