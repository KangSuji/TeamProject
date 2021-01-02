package com.spboot.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spboot.shop.dao.IAdminDao;
import com.spboot.shop.dto.Admin_Paging;
import com.spboot.shop.dto.MemberVO;
import com.spboot.shop.dto.OrderVO;
import com.spboot.shop.dto.ProductVO;
import com.spboot.shop.dto.Product_QnaVO;
import com.spboot.shop.dto.QnaVO;
import com.spboot.shop.dto.WorkerVO;

@Service
public class AdminService implements IAdminService{

	@Autowired
	IAdminDao iadao;

	@Override
	public WorkerVO adminCheck(String id) {
		return iadao.adminCheck(id);
	}

	@Override
	public int getAllCountProduct(String key) {
		
		return iadao.getAllCountProduct(key);
	}

	@Override
	public List<ProductVO> listProduct(int startNum, int endNum, String key) {
		return iadao.listProduct(startNum,endNum, key);
	}

	@Override
	public ProductVO getProduct(int pseq) {
		return iadao.getProduct(pseq);
	}

	@Override
	public List<String> getColor(int pseq) {
		return iadao.getColor(pseq);
	}

	@Override
	public List<String> getSize(int pseq) {
		return iadao.getSize(pseq);
	}

	@Override
	public void insertProduct(ProductVO pvo) {
		iadao.insertProduct(pvo);
		
	}

	@Override
	public int getPseq() {
		return iadao.getPseq();
	}

	@Override
	public void insertColor(int pseq, String color1) {
		iadao.insertColor(pseq, color1);
		
	}

	@Override
	public void insertSize(int pseq, String size1) {
		iadao.insertSize(pseq, size1);
		
	}

	@Override
	public int getAllCountMember(String key) {
		return iadao.getAllCountMember(key);
		
	}

	@Override
	public List<MemberVO> getMember(int startNum, int endNum, String key) {
		return iadao.getMember(startNum,endNum,key);
		
	}

	@Override
	public int getAllCountOrder(String key) {
		return iadao.getAllCountOrder(key);
	}

	@Override
	public List<OrderVO> listOrder(int startNum, int endNum, String key) {
		return iadao.listOrder(startNum, endNum, key);
	}

	@Override
	public void editProduct(ProductVO pvo) {
		iadao. editProduct(pvo);
		
	}

	@Override
	public void deleteColor(int pseq) {
		iadao.deleteColor(pseq);
		
	}

	@Override
	public void deleteSize(int pseq) {
		iadao.deleteSize(pseq);
		
	}

	@Override
	public void deleteProduct(int pseq) {
		iadao.deleteProduct(pseq);
		
	}

	@Override
	public void updateOrderResult(String oseq) {
		iadao.updateOrderResult(Integer.parseInt(oseq));
		
	}

	@Override
	public int getAllCount_qna() {
		return iadao.getAllCount_qna();
		
	}

	@Override
	public List<QnaVO> listQna(int startNum, int endNum) {
		return iadao.listQna(startNum, endNum);
	}

	@Override
	public QnaVO getQna(int qseq) {
		return iadao.getQna(qseq);
	}

	@Override
	public void updateQna(QnaVO qvo) {
		iadao.updateQna(qvo);
		
	}

	@Override
	public int getAllCount_product_qna() {
		return iadao.getAllCount_product_qna();
	}

	@Override
	public List<Product_QnaVO> listProductQna(int startNum, int endNum) {
		return iadao.listProductQna(startNum, endNum);
	}

	@Override
	public Product_QnaVO getProdcutQna(int pq_seq) {
		return iadao.getProdcutQna(pq_seq);
	}

	@Override
	public void updateProuctQna(Product_QnaVO pqvo) {
		 iadao.updateProuctQna(pqvo);
		
	}

	
	
	
	
}
