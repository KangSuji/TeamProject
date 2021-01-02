package com.spboot.shop.service;

import java.util.List;

import com.spboot.shop.dto.AddressVO;
import com.spboot.shop.dto.CuponVO;
import com.spboot.shop.dto.MemberVO;

public interface IMemberService {
	public MemberVO getMember(String mid);
	public void insertMember(MemberVO mvo);
	public MemberVO getMemberByemail(String memail); 
	public MemberVO getMemberByphone(String mphone); 
	public int resetPassword(String mid, String mpwd);
	public List<AddressVO> selectAddressByDong(String dong );
	public void updateMember(MemberVO mvo); 
	public CuponVO getCuponVO(String name);

	public void updateId(String id,String name);
	public void insertPoint(int point,String id);

}
