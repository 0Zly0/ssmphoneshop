package com.oracle.ssmphone.domain;

import lombok.Data;

@Data
public class Reci {
    //    recipients_id	int
    private Integer reciId;
    //    recipients_name	varchar
    private String reciName;
    //    recipients_address	varchar
    private String reciAddr;
    //    recipients_phone	varchar
    private String reciPhone;
    //    recipients_user_id	int
    private User reciUser;
    //    recipients_checked	int
    private Integer reciChecked;


}
