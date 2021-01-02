package com.spboot.shop.dto;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class ProductVO {
	private Integer pseq;
    private String pname;
    private String kind;
    private String subkind;
    private Integer price1;
    private Integer price2;
    private Integer price3;
    private String content;
    private String image1;
    private String image2;
    private String useyn;
    private String bestyn;
    private Timestamp indate;
}
