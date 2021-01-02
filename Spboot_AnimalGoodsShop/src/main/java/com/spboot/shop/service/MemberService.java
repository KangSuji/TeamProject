package com.spboot.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spboot.shop.dao.IMemberDao;
import com.spboot.shop.dto.AddressVO;
import com.spboot.shop.dto.CuponVO;
import com.spboot.shop.dto.MemberVO;

@Service
public class MemberService implements IMemberService{
	
	@Autowired
	IMemberDao imdao;

	@Override
	public MemberVO getMember(String mid) {
		return imdao.getMember(mid);
	}

	@Override
	public void insertMember(MemberVO mvo) {
		imdao.insertMember(mvo);
		
	}

	@Override
	public MemberVO getMemberByemail(String memail) {
		return imdao.getMemberByemail(memail);
	}

	@Override
	public MemberVO getMemberByphone(String mphone) {
		return imdao.getMemberByphone(mphone);
	}

	@Override
	public int resetPassword(String mid, String mpwd) {
		return imdao.resetPassword(mid,mpwd);
	}

	@Override
	public List<AddressVO> selectAddressByDong(String dong) {
		return imdao.selectAddressByDong(dong);
	}

	@Override
	public void updateMember(MemberVO mvo) {
		imdao.updateMember(mvo);
	}

	@Override
	public CuponVO getCuponVO(String name) {
		// TODO Auto-generated method stub
		return imdao.getCuponVO(name);
	}

	@Override
	public void updateId(String id,String name) {
		imdao.updateId(id,name);
		
	}

	@Override
	public void insertPoint(int point,String id) {
		// TODO Auto-generated method stub
		imdao.insertPoint(point,id);
	}

}
