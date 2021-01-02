package com.spboot.shop.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spboot.shop.dto.CartVO;
import com.spboot.shop.dto.MemberVO;
import com.spboot.shop.dto.Paging_Cart;
import com.spboot.shop.service.ICartService;

@Controller
public class CartController {
	
	@Autowired
	ICartService ics;

	@RequestMapping("/cart_insert")
	public String cart_insert( HttpServletRequest request,Model model) {
		String url = "cart_list";
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
		if(mvo == null) {
			url = "login_form";
		} else {
			CartVO  cvo = new CartVO();   
			cvo.setMid(mvo.getId());  
			cvo.setPseq(Integer.parseInt(request.getParameter("pseq")));
			cvo.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			System.out.println(request.getParameter("color"));
			System.out.println(request.getParameter("size"));
			if(request.getParameter("color").equals("noneValue")) {
				
			}else {
				cvo.setPcolor(request.getParameter("color"));
			}
			if(request.getParameter("size").equals("noneValue")) {
				
			}else {
				cvo.setPsize(request.getParameter("size"));
			}
			
			ics.insertCart(cvo);  
		}
		return "redirect:/"+url;
	}
	
	
	@RequestMapping("/cart_list")
	public String cart_list(HttpServletRequest request,Model model) {
		String url = "mypage/cartList";
		HttpSession session = request.getSession();
	    MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
	    if(mvo == null) {
			url = "login_form";
		}else {
			int page=0; // 최초 화면에 보여질 페이지 번호
			
			if( request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
				session.setAttribute("page", page);				
			} else if( session.getAttribute("page")!= null ) {
				page = (int) session.getAttribute("page");
			} else {
				page = 1;
				session.removeAttribute("page");
			}
			Paging_Cart paging = new Paging_Cart(); // 페이지 객체 생성
			paging.setPage(page);  // 현재 페이지 세팅
	
			int count = ics.getAllCountCart(); 
			paging.setTotalCount(count);
			paging.paging();
			ArrayList<CartVO> list = ics.listCart(paging.getStartNum(),paging.getEndNum(),mvo.getId()); 
			ArrayList<CartVO> list2=ics.listAllCart(mvo.getId());
			//아이디로 검색한 장바구니 물건들을 검색하여 리스트로 받음
			int totalPrice = 0;
			for(CartVO cvo : list2) totalPrice += cvo.getPrice2() * cvo.getQuantity(); 
			//총결재금액 계산 
			request.setAttribute("cartList", list);
			request.setAttribute("totalPrice", totalPrice);
			request.setAttribute("paging",paging);
		}
		return url;
	}
	
	@RequestMapping("/cart_delete")
	public String cart_delete(HttpServletRequest request,Model model) {
		int cseq=Integer.parseInt(request.getParameter("cseq"));
	
		// 배열에 있는 카드 번호들을 cseq 변수에 하나씩 전달하며 cdao.deleteCart(cseq); 를 반복 실행
		 ics.deleteCart(cseq);
		
		return "redirect:/cart_list";
	}

}
