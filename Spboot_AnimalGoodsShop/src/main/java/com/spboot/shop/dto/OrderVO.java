package com.spboot.shop.dto;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class OrderVO {
	private	int odseq;
	private int oseq;
	private String id;
	private Timestamp indate;
	private int pseq;
	private int quantity;
	private String mname;
	private String zip_num;
	private String address;
	private String phone;
	private String pname;
	private int price2;
	private String result;
	private String pcolor;
	private String psize;
	
	
}
