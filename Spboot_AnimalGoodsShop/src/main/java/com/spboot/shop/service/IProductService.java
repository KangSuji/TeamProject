package com.spboot.shop.service;

import java.util.ArrayList;
import java.util.List;

import com.spboot.shop.dto.ProductVO;
import com.spboot.shop.dto.Product_QnaVO;

public interface IProductService {
	public ArrayList<ProductVO> getNewList();
	public ArrayList<ProductVO> getBestList();
	public int getAllCountProduct(String key,int kind,int subkind); 
	public List<ProductVO> listKindProduct(int startNum,int endNum,String key, int kind,int subkind);
	public ProductVO getProduct(int pseq);
	public List<String> getColor(int pseq);
	public List<String> getSize(int pseq);
	public List<Product_QnaVO> getProduct_QnaList(int pseq);
	public void getProductQnaWrite(Product_QnaVO pqvo);

}
