package com.spboot.shop.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.spboot.shop.dto.CartVO;

@Mapper
public interface ICartDao {
	public void deleteCart(int cseq);
	public int getAllCountCart(); 
	public ArrayList<CartVO> listCart(int startNum,int endNum, String id); 
	public ArrayList<CartVO> listAllCart(String id);
	public void insertCart(CartVO cvo);  
}
