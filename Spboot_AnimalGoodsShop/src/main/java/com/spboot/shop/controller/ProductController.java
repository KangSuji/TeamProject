package com.spboot.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spboot.shop.dto.Paging;
import com.spboot.shop.dto.ProductVO;
import com.spboot.shop.dto.Product_QnaVO;
import com.spboot.shop.service.IProductService;

@Controller
public class ProductController {
	
	@Autowired
	IProductService ips;
	

	@RequestMapping("/product_detail")
	public String product_detail(HttpServletRequest request,Model model) {
		String url="product/productDetail";
		int pseq = Integer.parseInt(request.getParameter("pseq"));
		System.out.println(pseq);
		ProductVO pvo = new ProductVO();
		pvo = ips.getProduct(pseq);
		List<String> colorlist=ips.getColor(pseq);
		List<String> sizelist=ips.getSize(pseq);
		List<Product_QnaVO> list =ips.getProduct_QnaList(pseq);


		request.setAttribute("Product_Qna_List", list);
		request.setAttribute("productVo", pvo);
		request.setAttribute("ColorList", colorlist);
		request.setAttribute("SizeList", sizelist);
		return url;
		
	}
	
	@RequestMapping("/product_qna_write")
	public String product_qna_write(HttpServletRequest request,Model model) {
		String pseq=request.getParameter("pseq");
		String kind=request.getParameter("qna_kind");
		String id=request.getParameter("qna_id");
		String subject=request.getParameter("qna_subject");
		String content=request.getParameter("qna_content");
		Product_QnaVO pqvo=new Product_QnaVO();
		pqvo.setId(id);
		pqvo.setPseq(Integer.parseInt(pseq));
		pqvo.setContent(content);
		pqvo.setKind(kind);
		pqvo.setSubject(subject);
		ips.getProductQnaWrite(pqvo);
		return "redirect:/product_detail?pseq="+pseq;
		
	}
	
	@RequestMapping("/product_list")
	public String product_list(HttpServletRequest request,Model model) {
		String url="product/productList";
		HttpSession session = request.getSession();
		if( request.getParameter("first")!=null ) {
			session.removeAttribute("kind");
			session.removeAttribute("subkind");
			session.removeAttribute("page");
			session.removeAttribute("key");
		}
		int kind=0;
		if(request.getParameter("kind")!=null) {
			kind=Integer.parseInt(request.getParameter("kind"));
			session.setAttribute("kind", kind);
		}else if(session.getAttribute("kind")!=null) {
			kind=(int) session.getAttribute("kind");
		}else {
			session.removeAttribute("kind");
			kind = 1;
		}
		String[] kindList1=  {"","야외용품","패션","리빙","장난감","훈련용품","푸드","문구·도서"};

		int subkind = 0;
		if(request.getParameter("subkind")!=null) {
			subkind=Integer.parseInt(request.getParameter("subkind"))-1;
			session.setAttribute("subkind", subkind);
		}else if(session.getAttribute("subkind")!=null) {
			subkind=(int) session.getAttribute("subkind");
		}else {
			session.removeAttribute("subkind");
			subkind = 0;
		}
		if(subkind!=0) {
			if(request.getParameter("subkind")!=null) {
				subkind=Integer.parseInt(request.getParameter("subkind"))-1;
				session.setAttribute("subkind", subkind);
			}else if(session.getAttribute("subkind")!=null) {
				subkind=(int) session.getAttribute("subkind");
			}else {
				session.removeAttribute("subkind");
				subkind = 1;
			}
			String[] subkindList;
			 if(kind==1) {
		            subkindList= new String[] {"","가슴줄","리드줄","목줄","안전용품","산책용품"};
		         }else if(kind==2) {
		            subkindList=  new String[] {"","SUMMER","아우터","티셔츠","악세서리"};
		         }else if(kind==3) {
		            subkindList=new String[] {"","이동장","안전문","방석·매트","식기·보관","목욕·위생","탈취·소독","디지털·가전"};
		         }else if(kind==4) {
		            subkindList=new String[] {"","노즈워크","터그","공","삑삑이","소프트토이"};
		         }else if(kind==5) {
		            subkindList=new String[] {"","트릿백·가방","클리커","어질리티·피트니스","트레이너 의류"};
		         }else if(kind==6) {
		            subkindList=new String[] {"","자연식·습식","사료·건식","간식","파우더","영양제"};
		         }else{
		            subkindList=new String[] {"","도서","문구"};
		         }      
		         request.setAttribute("subkindword", subkindList[subkind]);
		      }else {
		         
		      }
		int page=0; // ���� ȭ�鿡 ������ ������ ��ȣ
		
		if( request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			session.setAttribute("page", page);				
		} else if( session.getAttribute("page")!= null ) {
			page = (int) session.getAttribute("page");
		} else {
			page = 1;
			session.removeAttribute("page");
		}
		
		String key=null;
		if( request.getParameter("key") != null ) {
			key = request.getParameter("key");
			session.setAttribute("key", key);
		} else if( session.getAttribute("key")!= null ) {
			key = (String)session.getAttribute("key");
		} else {
			session.removeAttribute("key");
			key = "";
		}
		
		Paging paging = new Paging(); // ������ ��ü ����
		paging.setPage(page);  // ���� ������ ����
	
		int count = ips.getAllCountProduct(key,kind,subkind); 
		paging.setTotalCount(count); // �� ���ڵ� ������ ���õǰ� paging() �޼��� ����
		paging.paging();
		request.setAttribute("kindword", kindList1[kind]);
		 List<ProductVO> list =ips.listKindProduct(paging.getStartNum(),paging.getEndNum(),key,kind, subkind);
		 request.setAttribute("productList", list);
		 request.setAttribute("paging",paging);
		 request.setAttribute("key", key);
		
		return url;
		
	}
	
	@RequestMapping("/")
	public String main(HttpServletRequest request,Model model) {
		ArrayList<ProductVO> newlist = ips.getNewList();
		ArrayList<ProductVO> bestlist = ips.getBestList();
		
		request.setAttribute("newProductList", newlist);
		request.setAttribute("bestProductList", bestlist);
	
		
		return "main";
		
	}

}
