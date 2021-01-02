package com.spboot.shop.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.spboot.shop.dto.Admin_Paging;
import com.spboot.shop.dto.MemberVO;
import com.spboot.shop.dto.OrderVO;
import com.spboot.shop.dto.ProductVO;
import com.spboot.shop.dto.Product_QnaVO;
import com.spboot.shop.dto.QnaVO;
import com.spboot.shop.dto.WorkerVO;
import com.spboot.shop.service.IAdminService;

@Controller
public class AdminContoller {

	@Autowired
	IAdminService ias;
	
	@RequestMapping("/admin_logout")
	public String admin_logout(Model model, HttpServletRequest request) {
	      HttpSession session=request.getSession();
	      if(session!=null) session.invalidate();
	      
	      return "redirect:/admin";
	}
	
	
	@RequestMapping("/admin_product_qna_repsave")
	public String admin_product_qna_repsave(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    WorkerVO wvo = (WorkerVO)session.getAttribute("loginUser");
	    if( wvo == null) { 
	        return "redirect:/admin";
		}else {
			Product_QnaVO pqvo = new Product_QnaVO();
			pqvo.setPq_seq(Integer.parseInt(request.getParameter("pq_seq")));
			pqvo.setReply(request.getParameter("reply"));
			ias.updateProuctQna(pqvo);
			request.setAttribute("Product_qnaVO", pqvo);
		}
		return "redirect:/admin_product_qna_list";
		
	}
	
	@RequestMapping("/admin_product_qna_detail")
	public String admin_product_qna_detail(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    WorkerVO wvo = (WorkerVO)session.getAttribute("loginUser");
	    if( wvo == null) { 
	        return "redirect:/admin";
		}else {
			String pq_seq = request.getParameter("pq_seq");
			
			Product_QnaVO pqvo = ias.getProdcutQna(Integer.parseInt(pq_seq));
			request.setAttribute("Product_qnaVO", pqvo);
		}
		return "admin/qna/productQnaDetail";
	}
	
	
	@RequestMapping("admin_product_qna_list")
	public String admin_product_qna_list(Model model, HttpServletRequest request) {
		int page=1;
		HttpSession session = request.getSession();
	    WorkerVO wvo = (WorkerVO)session.getAttribute("loginUser");
	    String key = request.getParameter("key");
	    if( wvo == null) { 
	        return "redirect:/admin";
		}else {
			if(request.getParameter("first")!=null) {
				session.removeAttribute("page");
				session.removeAttribute("key");
			}
			if(request.getParameter("page")!=null) {
				page = Integer.parseInt(request.getParameter("page"));
				session.setAttribute("page",page);
			 }else if(session.getAttribute("page")!= null) {
				page=(int) session.getAttribute("page");
			}else {
				page =1;
				session.removeAttribute("page");
			}
			if(request.getParameter("key") != null) {
				key = request.getParameter("key");
				session.setAttribute("key",key);
			}else if(session.getAttribute("key")!=null) {
				key= (String)session.getAttribute("key");
			}else {
				session.removeAttribute("key");
				key="";
			}
			Admin_Paging paging = new Admin_Paging();
			paging.setPage(page);
			int count = ias.getAllCount_product_qna();
			paging.setTotalCount(count);
			paging.paging();
			List<Product_QnaVO> list = ias.listProductQna(paging.getStartNum(), paging.getEndNum());
			request.setAttribute("product_qnaList", list);
			request.setAttribute("paging", paging);
		}
		return "admin/qna/productQnaList";
	}
	
	@RequestMapping("/admin_qna_repsave")
	public String admin_qna_repsave(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    WorkerVO wvo = (WorkerVO)session.getAttribute("loginUser");
	    if( wvo == null) { 
	        return "redirect:/admin";
		}else {
			QnaVO qvo = new QnaVO();
			qvo.setQseq(Integer.parseInt(request.getParameter("qseq")));
			qvo.setQreply(request.getParameter("qreply"));
			ias.updateQna(qvo);
		}
		return "redirect:/admin_qna_list";
	}
	
	@RequestMapping("/admin_qna_detail")
	public String admin_qna_detail(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    WorkerVO wvo = (WorkerVO)session.getAttribute("loginUser"); 
	    if( wvo == null) { 
	        return "redirect:/admin";
		}else {
			String qseq = request.getParameter("qseq");
			QnaVO qvo = ias.getQna(Integer.parseInt(qseq));
			request.setAttribute("qnaVO", qvo);
		}
		
		return "admin/qna/qnaDetail";
	}
	
	
	@RequestMapping("/admin_qna_list")
	public String admin_qna_list(Model model, HttpServletRequest request) {
		int page=1;
		HttpSession session = request.getSession();
	    WorkerVO wvo = (WorkerVO)session.getAttribute("loginUser");
	    String key = request.getParameter("key");
	    if( wvo == null) { 
	        return "redirect:/admin";
		}else {
			if(request.getParameter("first")!=null) {
				session.removeAttribute("page");
				session.removeAttribute("key");
			}
			if(request.getParameter("page")!=null) {
				page = Integer.parseInt(request.getParameter("page"));
				session.setAttribute("page",page);
			 }else if(session.getAttribute("page")!= null) {
				page=(int) session.getAttribute("page");
			}else {
				page =1;
				session.removeAttribute("page");
			}
			if(request.getParameter("key") != null) {
				key = request.getParameter("key");
				session.setAttribute("key",key);
			}else if(session.getAttribute("key")!=null) {
				key= (String)session.getAttribute("key");
			}else {
				session.removeAttribute("key");
				key="";
			}
			Admin_Paging paging = new Admin_Paging();
			paging.setPage(page);
			int count = ias.getAllCount_qna();
			paging.setTotalCount(count);
			paging.paging();
			List<QnaVO> list = ias.listQna(paging.getStartNum(), paging.getEndNum());
			request.setAttribute("qnaList", list);
			request.setAttribute("paging", paging);
		}
		return "admin/qna/qnaList";
	}
	
	
	@RequestMapping("/admin_order_save")
	public String admin_order_save(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    WorkerVO wvo = (WorkerVO)session.getAttribute("loginUser");
	    if( wvo == null) { 
	        return "redirect:/admin";
		}else {
			String[] resultArr = request.getParameterValues("result");
			for(String oseq : resultArr) {
				ias.updateOrderResult(oseq);
			}
		}
		return "redirect:/admin_order_list";
	}
	
	
	
	@RequestMapping("/admin_product_delete")
	public String admin_product_delete(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    WorkerVO wvo = (WorkerVO)session.getAttribute("loginUser");
	    String pseq = request.getParameter("pseq");
	    ProductVO pvo = new ProductVO();
	    if( wvo == null) { 
	        return "redirect:/admin";
		}else {
			ias.deleteColor(Integer.parseInt(pseq));
			ias.deleteSize(Integer.parseInt(pseq));
			ias.deleteProduct(Integer.parseInt(pseq));
		}
		return "redirect:/admin_product_list";
	}
	
	@RequestMapping("/admin_product_edit")
	public String admin_product_edit(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    WorkerVO wvo = (WorkerVO)session.getAttribute("loginUser");
	    ProductVO pvo = new ProductVO();
	    if( wvo == null) { 
	        return "redirect:/admin";
		}else {
			String path;
			try {
				path = ResourceUtils.getFile("classpath:static/product_images/").toPath().toString();
			    MultipartRequest multi = new MultipartRequest( request, path, 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy() );
			    int pseq = Integer.parseInt(multi.getParameter("pseq"));
		        String kind =multi.getParameter("kind");
		        String subkind = multi.getParameter("subkind");
		        String pname = multi.getParameter("pname");
		        int price1= Integer.parseInt(multi.getParameter("price1"));
		        int price2= Integer.parseInt(multi.getParameter("price2"));
		        int price3= Integer.parseInt(multi.getParameter("price3"));
		        String content = multi.getFilesystemName("content");
		        String image1=multi.getFilesystemName("image1");
		        String image2=multi.getFilesystemName("image2");
		        String bestyn = multi.getParameter("bestyn");
		        String useyn = multi.getParameter("useyn");
		        String color=multi.getParameter("color");
		        String size = multi.getParameter("size");		  		         
		         
		         pvo.setKind(kind);
		         pvo.setSubkind(subkind);
		         pvo.setPname(pname);
		         pvo.setPrice1(price1);
		         pvo.setPrice2(price2);
		         pvo.setPrice3(price3);
		         pvo.setContent(content);
		         pvo.setImage1(image1);
		         pvo.setImage2(image2);
		         pvo.setBestyn(bestyn);
		         pvo.setUseyn(useyn);
		         pvo.setPseq(pseq);
		      
		         if(multi.getFilesystemName("image1")==null) {
		            pvo.setImage1(multi.getParameter("nonmakeImg1"));
		         }
		         if(multi.getFilesystemName(image2)==null) {
		            pvo.setImage2(multi.getParameter("nonmakeImg2"));
		         }
		         if(multi.getFilesystemName(content)==null) {
		            pvo.setContent(multi.getParameter("nonmakecontent"));
		         }
		         
		         System.out.println("kind : "+ pvo.getKind()+" subkind : "+pvo.getSubkind()+" pname : "+ pvo.getPname()+" price1 : "+
							pvo.getPrice1()+" price2 : "+ pvo.getPrice2()+" price3 : "+ pvo.getPrice3()+" content : "+ pvo.getContent()+" img1 : "+ pvo.getImage1()
							+" img2 : "+pvo.getImage2()+" bset : "+pvo.getBestyn()+" use : "+pvo.getUseyn()+" pseq : "+pvo.getPseq());
		         
		         ias.editProduct(pvo);
		         ias.deleteColor(pseq);
		         ias.deleteSize(pseq);
		         if(color == null) {
		        	 return "redirect:/admin_product_list"; 
		         }else {
		        	 if(color.contains(",")) {
				            int k1=color.indexOf(",");
				            String color1=color.substring(0,k1);
				            ias.insertColor(pseq,color1);
				            if(color.substring(k1+1).contains(",")) {
				               int k2=color.indexOf(",",k1+1);
				               String color2=color.substring(k1+1,k2);
				               String color3=color.substring(k2+1);
				                  ias.insertColor(pseq,color2);
				                  ias.insertColor(pseq,color3);
				               }else {
				                  String color2=color.substring(k1+1);
				                  ias.insertColor(pseq,color2);
				               }
				            }		    
		         }
		         if(size==null) {
		        	 return "redirect:/admin_product_list"; 
		         }else {
		        	 if(size.contains(",")) {
				            int k1=size.indexOf(",");
				            String size1=size.substring(0,k1);
				            ias.insertSize(pseq,size1);
				            if(size.substring(k1+1).contains(",")) {
				               int k2=size.indexOf(",",k1+1);
				               String size2=size.substring(k1+1,k2);
				               String size3=size.substring(k2+1);
				               ias.insertSize(pseq,size2);
				               ias.insertSize(pseq,size3);
				               }else {
				                  String size2=size.substring(k1+1);
				                  ias.insertSize(pseq,size2);
				               }
				            }
		         }

			} catch (FileNotFoundException e) {e.printStackTrace();
			} catch (IOException e) {e.printStackTrace();
		    }
			 
			return "redirect:/admin_product_list";
		}	
		
	}
	
	
	@RequestMapping("/admin_product_edit_form")
	public String admin_product_edit_form(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    WorkerVO wvo = (WorkerVO)session.getAttribute("loginUser");
	    if( wvo == null) { 
	        return "redirect:/admin";
		}else {
			 String pseq=request.getParameter("pseq");
	         ProductVO pvo = new ProductVO();	     
	         pvo=ias.getProduct(Integer.parseInt(pseq));//검색
	         List<String> colorlist=ias.getColor(Integer.parseInt(pseq));
	         List<String> sizelist=ias.getSize(Integer.parseInt(pseq));
	         String subkind1=pvo.getSubkind();//가져온값
	         request.setAttribute("productVO", pvo);
	         String kindList1[]= {"","야외용품","패션","리빙","장난감","훈련용품","푸드","문구·도서"};//대분류
	         int kind=Integer.parseInt(pvo.getKind());//대분류값
	            
	         int subkind = 0;
	         String[] subkindList = null;
	         if(subkind1!=null) {
                 subkind=Integer.parseInt(pvo.getSubkind());
                 if(kind==1){
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
       
                 request.setAttribute("subkind", subkindList[subkind]);
                 request.setAttribute("subkindList",subkindList);
                
              }
	        
	            request.setAttribute("kindList1", kindList1);
	  	        request.setAttribute("kind", kindList1[kind]);
	  	        request.setAttribute("ColorList", colorlist);
	  	        request.setAttribute("SizeList", sizelist);
	         }
		
		return"admin/product/productEditForm";
	}
	
	@RequestMapping("/admin_order_list")
	public String admin_order_list(Model model, HttpServletRequest request) {
		int page=1;
		HttpSession session = request.getSession();
		WorkerVO wvo = (WorkerVO)session.getAttribute("loginUser");
		String key = request.getParameter("key");
		if( wvo == null) { 
			return "admin/adminLogin"; 
		}else{
			if(request.getParameter("first")!=null) {
				session.removeAttribute("page");
				session.removeAttribute("key");
			}
			if(request.getParameter("page")!=null) {
				page = Integer.parseInt(request.getParameter("page"));
				session.setAttribute("page",page);
			 }else if(session.getAttribute("page")!= null) {
				page=(int) session.getAttribute("page");
			}else {
				page =1;
				session.removeAttribute("page");
			}
			if(request.getParameter("key") != null) {
				key = request.getParameter("key");
				session.setAttribute("key",key);
			}else if(session.getAttribute("key")!=null) {
				key= (String)session.getAttribute("key");
			}else {
				session.removeAttribute("key");
				key="";
			}
			Admin_Paging paging = new Admin_Paging();
			paging.setPage(page);
			int count = ias.getAllCountOrder(key);
			paging.setTotalCount(count);
			paging.paging();
			List<OrderVO> list = ias.listOrder(paging.getStartNum(), paging.getEndNum(), key);
			
			
			 
			request.setAttribute("orderList",list );
			request.setAttribute("paging", paging);
			request.setAttribute("key", key);
			
		}
		
		return "admin/order/orderList";
	}
	
	@RequestMapping("/admin_member_list")
	public String admin_member_list(Model model, HttpServletRequest request) {
		int page=1;
		HttpSession session = request.getSession();
		WorkerVO wvo = (WorkerVO)session.getAttribute("loginUser");
		String key = request.getParameter("key");
		if( wvo == null) { 
			return "admin/adminLogin"; 
		}else{
			if(request.getParameter("page")!=null) {
				page = Integer.parseInt(request.getParameter("page"));
				
			}
			Admin_Paging paging=new Admin_Paging();
			
			int count = ias.getAllCountMember(key);
			paging.setTotalCount(count);
			paging.paging();
			List<MemberVO> list = ias.getMember(paging.getStartNum(), paging.getEndNum(), key);
			
			
			request.setAttribute("memberList", list);
			request.setAttribute("paging",paging);
			request.setAttribute("key", key);	
		}
		
		return "admin/member/memberList";
	}
	
	
	@RequestMapping("/admin_product_write")
	public String admin_product_write(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    WorkerVO wvo = (WorkerVO)session.getAttribute("loginUser");
	    ProductVO pvo = new ProductVO();
	    if( wvo == null) { 
	        return "redirect:/admin";
		}else {
			String path;
			try {
				path = ResourceUtils.getFile("classpath:static/product_images/").toPath().toString();
			    MultipartRequest multi = new MultipartRequest( request, path, 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy() );
				String kind =multi.getParameter("kind");
				String subkind = multi.getParameter("subkind");
				String pname = multi.getParameter("pname");
				int price1= Integer.parseInt(multi.getParameter("price1"));
				int price2= Integer.parseInt(multi.getParameter("price2"));
				int price3= Integer.parseInt(multi.getParameter("price3"));
				String content = multi.getFilesystemName("content");
				String image1=multi.getFilesystemName("image1");
				String image2=multi.getFilesystemName("image2");
				String bestyn = multi.getParameter("bestyn");
				String useyn = multi.getParameter("useyn");
				String color = multi.getParameter("color");
				String size = multi.getParameter("size");
				
				pvo.setKind(kind);
				pvo.setSubkind(subkind);
				pvo.setPname(pname);
				pvo.setPrice1(price1);
				pvo.setPrice2(price2);
				pvo.setPrice3(price3);
				pvo.setContent(content);
				pvo.setImage1(image1);
				pvo.setImage2(image2);
				pvo.setBestyn(bestyn);
				pvo.setUseyn(useyn);
				System.out.println("pvo"+ pvo.getKind()+pvo.getSubkind()+ pvo.getPname()+
						pvo.getPrice1()+ pvo.getPrice2()+ pvo.getPrice3()+ pvo.getContent()+ pvo.getImage1()+pvo.getImage2()+pvo.getBestyn()+pvo.getUseyn());

				int pseq=ias.getPseq();
				if(color.contains(",")) {
					int k1=color.indexOf(",");
					String color1=color.substring(0,k1);
					ias.insertColor(pseq,color1);
					if(color.substring(k1+1).contains(",")) {
						int k2=color.indexOf(",",k1+1);
						String color2=color.substring(k1+1,k2);
						String color3=color.substring(k2+1);
							ias.insertColor(pseq,color2);
							ias.insertColor(pseq,color3);
						}else {
							String color2=color.substring(k1+1);
							ias.insertColor(pseq,color2);
						}
					System.out.println("color" + color);
					}
				
				if(size.contains(",")) {
					int k1=size.indexOf(",");
					String size1=size.substring(0,k1);
					ias.insertSize(pseq,size1);
					if(size.substring(k1+1).contains(",")) {
						int k2=size.indexOf(",",k1+1);
						String size2=size.substring(k1+1,k2);
						String size3=size.substring(k2+1);
						ias.insertSize(pseq,size2);
						ias.insertSize(pseq,size3);
						}else {
							String size2=size.substring(k1+1);
							ias.insertSize(pseq,size2);
						}
					System.out.println("size"  + size);
					}

			} catch (FileNotFoundException e) {e.printStackTrace();
			} catch (IOException e) {e.printStackTrace();
		    }
			ias.insertProduct(pvo);
			
			return "redirect:/admin_product_list";
		}	
		
	}

	
	@RequestMapping("admin_product_write_from")
	public String admin_product_write_from(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    WorkerVO wvo = (WorkerVO)session.getAttribute("loginUser");
	    if( wvo == null) { 
	        return "redirect:/admin";
		}else {
			
			return "admin/product/productWriteForm";
		}	
		
	}
	
	@RequestMapping(value="admin_product_detail", method=RequestMethod.POST)
	public String admin_product_detail(Model model, HttpServletRequest request) {
	      String pseq = request.getParameter("pseq");
	      HttpSession session = request.getSession();
	      WorkerVO wvo = (WorkerVO)session.getAttribute("loginUser");
	      if( wvo == null) { 
	        return "redirect:/admin";
	      }else { 
	         ProductVO pvo=ias.getProduct(Integer.parseInt(pseq)); 
	         List<String> colorlist=ias.getColor(Integer.parseInt(pseq));
	 		 List<String> sizelist=ias.getSize(Integer.parseInt(pseq));
	 		 
	         int kind=Integer.parseInt(pvo.getKind());
	         String subkind1=pvo.getSubkind();
	         String[] kindList1= {"","야외용품","패션","리빙","장난감","훈련용품","푸드","문구·도서"};//대분류
	         
	         int subkind = 0;
	         String[] subkindList = null;
	         if(subkind1!=null) {
	               subkind=Integer.parseInt(pvo.getSubkind());
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
	               
	               model.addAttribute("subkind", subkindList[subkind]);
	              
	            }
	         
	         model.addAttribute("productVO",pvo);
	         model.addAttribute("kind",kindList1[kind]);
	         model.addAttribute("ColorList", colorlist);
	         model.addAttribute("SizeList", sizelist);
	         
	         
	      }
	      
	  
		return "admin/product/product_detail";
	}
	
	
	@RequestMapping("/admin_product_list")
	public String admin_product_list(Model model, HttpServletRequest request) {
		int page=1;
		HttpSession session = request.getSession();
		WorkerVO wvo = (WorkerVO)session.getAttribute("loginUser");
		String key = request.getParameter("key");
		if( wvo == null) { 
			return "admin/adminLogin"; 
		}else{
			if(request.getParameter("first")!=null) {
				session.removeAttribute("page");
				session.removeAttribute("key");
			}
			if(request.getParameter("page")!=null) {
				page = Integer.parseInt(request.getParameter("page"));
				session.setAttribute("page",page);
			 }else if(session.getAttribute("page")!= null) {
				page=(int) session.getAttribute("page");
			}else {
				page =1;
				session.removeAttribute("page");
			}
			if(request.getParameter("key") != null) {
				key = request.getParameter("key");
				session.setAttribute("key",key);
			}else if(session.getAttribute("key")!=null) {
				key= (String)session.getAttribute("key");
			}else {
				session.removeAttribute("key");
				key="";
			}
			Admin_Paging paging = new Admin_Paging();
			paging.setPage(page);
			
			int count = ias.getAllCountProduct(key);
			paging.setTotalCount(count);
			paging.paging();
			List<ProductVO> list = ias.listProduct(paging.getStartNum(), paging.getEndNum(), key);
			
			request.setAttribute("productList",list );
			request.setAttribute("paging", paging);
			request.setAttribute("key",key );
		}

		return "admin/product/productList";
	}
	
	
	@RequestMapping("/admin_login")
	public String admin_login(Model model, HttpServletRequest request) {
		String id= request.getParameter("adminId");
		String pwd=request.getParameter("adminPwd");
		WorkerVO wvo = ias.adminCheck(id);
		if(wvo!=null) {
			if(wvo.getPwd().equals(pwd)) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", wvo);
				
				return "redirect:/admin_product_list";
				
			}else {
				model.addAttribute("message","비밀번호가 맞지 않습니다.");
				return "admin/adminLogin";
			}
		}else {
			model.addAttribute("message", "ID가 없습니다.");
			return "admin/adminLogin";
		}
		
	}
	
	
	
	@RequestMapping("/admin")
	public String admin(HttpServletRequest request,Model model){
		return "admin/adminLogin";
	}
	
}
