package com.spboot.shop.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spboot.shop.dao.ICartDao;
import com.spboot.shop.dto.CartVO;

@Service
public class CartService implements ICartService{
	@Autowired
	ICartDao icdao;

	@Override
	public void deleteCart(int cseq) {
		icdao.deleteCart(cseq);
	}

	@Override
	public int getAllCountCart() {
		return icdao.getAllCountCart();
	}

	@Override
	public ArrayList<CartVO> listCart(int startNum, int endNum, String id) {
		// TODO Auto-generated method stub
		return icdao.listCart(startNum,endNum,id);
	}

	@Override
	public ArrayList<CartVO> listAllCart(String id) {
		// TODO Auto-generated method stub
		return icdao.listAllCart(id);
	}

	@Override
	public void insertCart(CartVO cvo) {
		icdao.insertCart(cvo);
		
	}

}
