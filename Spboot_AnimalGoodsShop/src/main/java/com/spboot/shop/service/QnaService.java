package com.spboot.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spboot.shop.dao.IQnaDao;
import com.spboot.shop.dto.QnaVO;

@Service
public class QnaService implements IQnaService{
	
	@Autowired
	IQnaDao iqdao;

	@Override
	public List<QnaVO> listQna(String mid) {
		return iqdao.listQna(mid);
	}

	@Override
	public void insertQna(QnaVO qvo) {
		iqdao.insertQna(qvo);
		
	}

	@Override
	public QnaVO getQna(int qseq) {
		return iqdao.getQna(qseq);
	}

}
