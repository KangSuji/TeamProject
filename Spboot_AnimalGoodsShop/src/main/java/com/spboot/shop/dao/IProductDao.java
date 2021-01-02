package com.spboot.shop.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spboot.shop.dto.ProductVO;
import com.spboot.shop.dto.Product_QnaVO;

@Mapper
public interface IProductDao {
	public ArrayList<ProductVO> getNewList();
	public ArrayList<ProductVO> getBestList();
	public int getAllCountProductBykey(String key);
	public int getAllCountProductBykind(int kind);
	public int getAllCountProductBysubkind(int kind,int subkind);
	public List<ProductVO> listKindProductBykey(String key,int startNum, int endNum);
	public List<ProductVO> listKindProductBykind(int kind,int startNum, int endNum);
	public List<ProductVO> listKindProductBysubkind(int kind,int subkind,int startNum, int endNum);
	public ProductVO getProduct(int pseq);
	public List<String> getColor(int pseq);
	public List<String> getSize(int pseq);
	public List<Product_QnaVO> getProduct_QnaList(int pseq);
	public void getProductQnaWrite(Product_QnaVO pqvo);
}
