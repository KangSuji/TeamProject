package com.spboot.shop.dto;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class Product_QnaVO {
	private Integer pq_seq;
	private Integer pseq;
	private String id;
	private String kind;
	private String subject;
	private String content;
	private String reply;
	private String rep;
	private Timestamp indate;
	

	
}
