package com.spboot.shop.dto;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class CartVO {
	private Integer cseq;
	private String mid;  
	private Integer pseq;  
	private String mname;
	private String pname;
	private String image;
	private Integer quantity;
	private String pcolor;
	private String psize;
	private Integer price2;
	private Timestamp indate;
	private String result;
}
