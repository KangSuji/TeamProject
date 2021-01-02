package com.spboot.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spboot.shop.dto.QnaVO;

@Mapper
public interface IQnaDao {
	
	public List<QnaVO> listQna(String mid);
	public void insertQna(QnaVO qvo);
	public QnaVO getQna(int qseq);

}
