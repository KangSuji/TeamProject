package com.spboot.shop.service;

import java.util.List;

import com.spboot.shop.dto.MemberVO;
import com.spboot.shop.dto.OrderVO;
import com.spboot.shop.dto.ProductVO;
import com.spboot.shop.dto.Product_QnaVO;
import com.spboot.shop.dto.QnaVO;
import com.spboot.shop.dto.WorkerVO;

public interface IAdminService {
	
	public WorkerVO adminCheck(String id);
	public int getAllCountProduct(String key);
	public List<ProductVO>listProduct(int startNum, int endNum, String key);
	public ProductVO getProduct(int pseq); 
	public List<String> getColor(int pseq);
	public List<String> getSize(int pseq);
	public void insertProduct(ProductVO pvo);
	public int getPseq();
	public void insertColor(int pseq,String color1);
	public void insertSize(int pseq,String size1);
	public void editProduct(ProductVO pvo);
	public void deleteColor(int pseq);
	public void deleteSize(int pseq);
	public void deleteProduct(int pseq);
	
	public int getAllCountMember(String key);
	public List<MemberVO> getMember(int startNum, int endNum,String  key);
	
	public int getAllCountOrder(String key);
	public List<OrderVO>listOrder(int startNum, int endNum,String  key);
	public void updateOrderResult(String oseq);
	
	
	public int getAllCount_qna();
	public List<QnaVO> listQna(int startNum, int endNum);
	public QnaVO getQna(int qseq);
	public void updateQna(QnaVO qvo);
	public int getAllCount_product_qna();
	public List<Product_QnaVO> listProductQna(int startNum, int endNum);
	public Product_QnaVO getProdcutQna(int pq_seq);
	public void updateProuctQna(Product_QnaVO pqvo);
	
}
