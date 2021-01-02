package com.spboot.shop.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class CuponVO {
	private int cupon_num;
	@NotNull(message="쿠폰번호를 입력해주세요")
	@NotEmpty(message="쿠폰번호를 입력해주세요")
	private String name;
	private String id;
	private int point;
	private String useyn;
	private Timestamp indate;
}
