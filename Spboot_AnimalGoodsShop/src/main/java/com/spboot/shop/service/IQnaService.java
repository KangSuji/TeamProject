package com.spboot.shop.service;

import java.util.List;

import com.spboot.shop.dto.QnaVO;

public interface IQnaService {
	public List<QnaVO> listQna(String mid);
	public void insertQna(QnaVO qvo);
	public QnaVO getQna(int qseq);

}
