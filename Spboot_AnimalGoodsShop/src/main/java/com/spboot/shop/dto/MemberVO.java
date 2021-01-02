package com.spboot.shop.dto;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String gender;
	private String  birth;
	private String zip_num;
	private String address;
	private int point;
	private String phone;
	private String useyn;
	private Timestamp indate;
}
