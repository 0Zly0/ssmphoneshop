package com.oracle.ssmphone.domain;

import lombok.Data;

import java.io.Serializable;

@Data
public class PriceRanges implements Serializable {
    //    pr_id	int
    private Integer prId;
    //    pr_min	double
    private Double prMin;
    //    pr_max	double
    private Double prMax;
    //    pr_text	varchar
    private String prText;


}
