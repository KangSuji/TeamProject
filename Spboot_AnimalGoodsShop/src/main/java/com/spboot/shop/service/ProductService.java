package com.spboot.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spboot.shop.dao.IProductDao;
import com.spboot.shop.dto.ProductVO;
import com.spboot.shop.dto.Product_QnaVO;

@Service
public class ProductService implements IProductService{
	
	@Autowired
	IProductDao ipdao;

	@Override
	public ArrayList<ProductVO> getNewList() {
		return ipdao.getNewList();
	}

	@Override
	public ArrayList<ProductVO> getBestList() {
		return ipdao.getBestList();
	}

	
	@Override
	public int getAllCountProduct(String key, int kind, int subkind) {
		if(key!="") {
			//String sql = "select count(*) as count from product where pname like '%'||?||'%'";
			return ipdao.getAllCountProductBykey(key);
		}else {
			if(subkind==0) {
			//String sql = "select count(*) as count from product where kind=?";
			return ipdao.getAllCountProductBykind(kind);
			}else {
				//String sql = "select count(*) as count from product where kind=? and subkind=?";
				return ipdao.getAllCountProductBysubkind(kind,subkind);
			}
		}
	}

	@Override
	public List<ProductVO> listKindProduct(int startNum, int endNum, String key, int kind, int subkind) {
		 if(key!="") {
	    	 
	    	 /*String sql= "select * from "
						+ " (select * from "
						+ " (select rownum as row_num, product.* from product "
						+ "  where pname like '%'||?||'%' order by pseq desc) "
						+ " where row_num>=?)"
						+ " where row_num<=?";
						*/
				return ipdao.listKindProductBykey(key,startNum,endNum);
	    
	    }else {
			if(subkind==0) {
				/*
				String sql= "select * from "
						+ " (select * from "
						+ " (select rownum as row_num, product.* from product "
						+ "  where kind=? order by pseq desc) "
						+ " where row_num>=?)"
						+ " where row_num<=?";*/
				return ipdao.listKindProductBykind(kind,startNum,endNum);
				
			}else {
				/*
				String sql= "select * from "
						+ " (select * from "
						+ " (select rownum as row_num, product.* from product "
						+ "  where kind=? and subkind=? order by p seq desc) "
						+ " where row_num>=?)"
						+ " where row_num<=?";*/
			return ipdao.listKindProductBysubkind(kind,subkind,startNum,endNum);
			}
	    }
	}

	@Override
	public ProductVO getProduct(int pseq) {
		return ipdao.getProduct(pseq);
	}

	@Override
	public List<String> getColor(int pseq) {
		return ipdao.getColor(pseq);
	}

	@Override
	public List<String> getSize(int pseq) {
		return ipdao.getSize(pseq);
	}

	@Override
	public List<Product_QnaVO> getProduct_QnaList(int pseq) {
		return ipdao.getProduct_QnaList(pseq);
	}

	@Override
	public void getProductQnaWrite(Product_QnaVO pqvo) {
		ipdao.getProductQnaWrite(pqvo);
		
	}

}
