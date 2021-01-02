package com.spboot.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spboot.shop.dto.MemberVO;
import com.spboot.shop.dto.QnaVO;
import com.spboot.shop.service.IQnaService;

@Controller
public class QnaController {
	
	@Autowired
	IQnaService iqs;
	
	@RequestMapping("/qna_view")
	public String qna_view(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    MemberVO mvo = (MemberVO) session.getAttribute("loginUser"); 
	    if (mvo == null) {
	    	return "redirect:/login_form";
	    }else{
	    	int qseq = Integer.parseInt(request.getParameter("qseq"));
	    	QnaVO qvo = iqs.getQna(qseq);
	    	request.setAttribute("qnaVO", qvo);
	    }
		return "qna/qnaView";
	}
	
	@RequestMapping("/qna_write")
	public String qna_write(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    MemberVO mvo = (MemberVO) session.getAttribute("loginUser"); 
	    if (mvo == null) {
	    	return "redirect:/login_form";
	    }else{
	    	QnaVO qvo = new QnaVO();
	    	qvo.setQtype(request.getParameter("qtype"));
	    	qvo.setQsubject(request.getParameter("qsubject"));
	    	qvo.setQcontent(request.getParameter("qcontent"));
	    	qvo.setMid(mvo.getId());

	    	iqs.insertQna(qvo);
	    }
		return "redirect:/qna_list";
	}
	
	
	@RequestMapping("/qna_write_form")
	public String qna_write_form(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
	    if (mvo == null) {
	    	return "redirect:/login_form";
	    } else {
	    	List<QnaVO> list = iqs.listQna(mvo.getId());
	    	request.setAttribute("qnaList", list);
	    }
		
		return "qna/qnaWrite";
	}
	
	@RequestMapping("/qna_list")
	public String qna_list(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
	    if (mvo == null) {
	    	return "redirect:/login_form";
	    } else {
	    	List<QnaVO> list = iqs.listQna(mvo.getId());
	    	request.setAttribute("qnaList", list);
	    }
		return "qna/qnaList";
	}

}
