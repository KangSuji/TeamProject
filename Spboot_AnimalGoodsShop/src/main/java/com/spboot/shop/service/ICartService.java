package com.spboot.shop.service;

import java.util.ArrayList;

import com.spboot.shop.dto.CartVO;

public interface ICartService {
	public void deleteCart(int cseq);
	public int getAllCountCart(); 
	public ArrayList<CartVO> listCart(int startNum,int endNum, String id); 
	public ArrayList<CartVO> listAllCart(String id);
	public void insertCart(CartVO cvo);  

}
