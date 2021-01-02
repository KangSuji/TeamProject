package com.spboot.shop.dto;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class QnaVO {
	private Integer qseq;
	private String qsubject;
	private String qcontent;
	private String qreply;
	private String mid;
	private String qrep;
	private Timestamp qindate;
	private String qtype;
}
