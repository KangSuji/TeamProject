package com.spboot.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spboot.shop.dto.AddressVO;
import com.spboot.shop.dto.CuponVO;
import com.spboot.shop.dto.MemberVO;
import com.spboot.shop.service.IMemberService;

@Controller
public class MemberController {
	@Autowired
	IMemberService ims;
	
	
	@RequestMapping("/cupon_form")
	public String cupon_form(HttpServletRequest request,Model model) {
		return "mypage/cupon_form";
	}
	
	@RequestMapping("/cupon_insert")
	public String cupon_insert(HttpServletRequest request,Model model) {
		String url="mypage/cupon_form";
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
		if(mvo == null) {
			model.addAttribute("message", "로그인을 먼저 해주시기 바랍니다.");
		} else {
			CuponVO cvo=new CuponVO();
			cvo=ims.getCuponVO(request.getParameter("name"));
			if(cvo!=null) {
				cvo.setId(mvo.getId());
				ims.updateId(mvo.getId(),request.getParameter("name"));
				ims.insertPoint(cvo.getPoint(),mvo.getId());
				model.addAttribute("message", "포인트추가 성공했습니다");
			}else {
				model.addAttribute("message", "포인트추가 실패했습니다");
			}
		}
		return url;
	}

	@RequestMapping("/mypage_update_form")
	public String mypage_update_form(HttpServletRequest request,Model model) {
		String url="member/mypage_updateForm";
		String mid = request.getParameter("mid");
		MemberVO mvo = ims.getMember(mid);
		String addr = mvo.getAddress();  // 주소 추출
		String birth=mvo.getBirth();
		String phone=mvo.getPhone();
		String email = mvo.getEmail();
		if(email!=null) {
			int k1 = email.indexOf("@");  
			String memail1 = email.substring(0, k1); 
			String memail2 = email.substring(k1+1); 
			model.addAttribute("memail1", memail1);
			model.addAttribute("memail2", memail2);
		}
		if(phone!=null) {
			int k1 = phone.indexOf("-");  
			int k2 = phone.indexOf("-", k1+1); 
			String mphone1 = phone.substring(0, k1); 
			String mphone2 = phone.substring(k1+1,k2); 
			String mphone3 = phone.substring(k2+1);
			model.addAttribute("mphone1", mphone1);
			model.addAttribute("mphone2", mphone2);
			model.addAttribute("mphone3", mphone3);
		}
		if(birth!=null) {
			int k1 = birth.indexOf("-");
			int k2 = birth.indexOf("-", k1+1); 
			String myear = birth.substring(0, k1); 
			String mmonth = birth.substring(k1+1,k2); 
			String mday = birth.substring(k2+1);
			model.addAttribute("myear", myear);
			model.addAttribute("mmonth", mmonth);
			model.addAttribute("mday", mday);
		}
		
		if(addr!=null) {
			int k1 = addr.indexOf(" ");  // 첫번째 공백의 위치 찾음
			int k2 = addr.indexOf(" ", k1+1);  // 첫번째 공백 위치의 다음위치부터 두번째 공백 위치 찾음
			int k3 = addr.indexOf(" ", k2+1);  // 두번째 공백위치 다음 위치부터 세번째 공백 위치 찾음
			// 서울시 마포구 대현동 115-15  세번째 공백 위치  k3:11 (0부터 시작)
			String addr1 = addr.substring(0, k3); // 맨앞부터 세번째 공백 위치 바로 전까지... 주소 앞부분
			String addr2 = addr.substring(k3+1);  // 세번째 공백 뒷글자부터 맨끝까지...주소 뒷부분
			
			model.addAttribute("addr1", addr1);
			model.addAttribute("addr2", addr2);
		}
		
		model.addAttribute("member", mvo);
		return url;
	}
	@RequestMapping("/find_zip_num")
	public String find_zip_num(HttpServletRequest request,Model model) {
		String url="member/findZipNum";
		String dong=request.getParameter("dong");
		if(dong != null) {
			if( dong.equals("") == false ) {
				List<AddressVO> list = ims.selectAddressByDong( dong );
				model.addAttribute("addressList", list);
			}
		}
		return url;
	}
	@RequestMapping("/member_update")
	public String member_update(HttpServletRequest request,Model model) {
		MemberVO mvo = new MemberVO();
		mvo.setId(request.getParameter("mid"));
		mvo.setPwd(request.getParameter("mpwd"));
		mvo.setName(request.getParameter("mname"));
		mvo.setPhone(request.getParameter("mphone1")+"-"+request.getParameter("mphone2")+"-"+request.getParameter("mphone3"));
		mvo.setEmail(request.getParameter("memail1")+"@"+request.getParameter("memail2"));
		mvo.setGender(request.getParameter("mgender"));
		mvo.setBirth(request.getParameter("myear")+"-"+request.getParameter("mmonth")+"-"+request.getParameter("mday"));
		mvo.setZip_num(request.getParameter("zip_num"));
		mvo.setAddress(request.getParameter("addr1") + " " 
											+	request.getParameter("addr2"));
	    ims.updateMember(mvo); 
	    HttpSession session=request.getSession();
	    session.setAttribute("loginUser", mvo);
		return "redirect:/";
	}
	
	@RequestMapping("/reset_pwd")
	public String reset_pwd(HttpServletRequest request,Model model) {
		String url = "member/login";
		
		String mpwd = request.getParameter("mpwd");
		String mid = request.getParameter("mid");
		
		int result = ims.resetPassword(mid, mpwd);
		System.out.println(result);
		
		if( result != 1) {
			url = "member/resetPass";
			model.addAttribute("message", "비밀번호가 수정되지 않았습니다");
		}
		
		return url;
	}
	
	
	@RequestMapping("/agreement1")
	public String agreement1(HttpServletRequest request,Model model) {
		return "member/agreement1";
	}
	@RequestMapping("/agreement2")
	public String agreement2(HttpServletRequest request,Model model) {
		return "member/agreement2";
	}
	@RequestMapping("/agreement3")
	public String agreement3(HttpServletRequest request,Model model) {
		return "member/agreement3";
	}

	
	
	@RequestMapping("/idcheck")
	public String idcheck(HttpServletRequest request,Model model) {
		String mid=request.getParameter("mid");
		MemberVO mvo=ims.getMember(mid);
		int result=0;
		if(mvo==null) {
		 result=0;
		}else {
			result=1;
		}
		model.addAttribute("result", result);
		model.addAttribute("mid", mid);
		return "member/idcheck";
		
	}
	
	@RequestMapping("/find_id_form")
	public String find_id_form(HttpServletRequest request,Model model) {
		String url="member/findid";
		String num=null;
		String mphone=null;
		String memail=null;
		String mname=null;
		if(request.getParameter("num")!=null) {
			num=request.getParameter("num");
		}
		if((request.getParameter("mphone1")!=null)||(request.getParameter("mphone2")!=null)||(request.getParameter("mphone3")!=null)) {
			mphone=request.getParameter("mphone1")+"-"+request.getParameter("mphone2")+"-"+request.getParameter("mphone3");
		}
		
		if((request.getParameter("memail1")!=null)||(request.getParameter("memail2")!=null)) {
			memail=request.getParameter("memail1")+"@"+request.getParameter("memail2");
		}
		if(request.getParameter("mname")!=null) {
			mname=request.getParameter("mname");
		}
		
		
		if(memail!=null){
			MemberVO mvo = new MemberVO();
			System.out.println("memail:"+memail);
			mvo = ims.getMemberByemail(memail); 
			if(mvo!=null) {  
				if(mvo.getName().equals(mname)) {
					model.addAttribute("findId", mvo);
				}
			}
		}
		if(mphone!=null){
			MemberVO mvo = new MemberVO();
			mvo = ims.getMemberByphone(mphone); 
			if(mvo!=null) { 
				if(mvo.getName().equals(mname)) 
					model.addAttribute("findId2", mvo);
			}
		}
	if(num!=null) {
		int num1=Integer.parseInt(num);
		if(num1==1) {
			model.addAttribute("num", num1);

		}
	}
		
	
		return url;
		
	}
	@RequestMapping("/find_pwd_form")
	public String find_pwd_form(HttpServletRequest request,Model model) {
		String url="member/resetPass";
		String mid=request.getParameter("mid");
		String mphone=request.getParameter("mphone1")+"-"+request.getParameter("mphone2")+"-"+request.getParameter("mphone3");
		String memail=request.getParameter("memail1")+"@"+request.getParameter("memail2");
		String mname=request.getParameter("mname");
		
		MemberVO mvo = new MemberVO();
		mvo = ims.getMemberByphone(mphone);
		request.setAttribute("findPass", mvo);
		if(mvo==null) { 
			url="member/findpwd";
		}else if( mvo.getName()!=null && mvo.getEmail() !=null && mvo.getId()!=null) { 
			if(!mvo.getName().equals(mname) || !mvo.getEmail().equals(memail) || !mvo.getId().equals(mid))
				url="member/findpwd";
		}		
	
		
		return url;
		
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(HttpServletRequest request,Model model) {
		MemberVO mvo= new MemberVO();
		mvo.setId(request.getParameter("mid"));
		mvo.setPwd(request.getParameter("mpwd"));
		mvo.setName(request.getParameter("mname"));
		mvo.setPhone(request.getParameter("mphone1")+"-"+request.getParameter("mphone2")+"-"+request.getParameter("mphone3"));
		mvo.setEmail(request.getParameter("memail1")+"@"+request.getParameter("memail2"));
		mvo.setGender(request.getParameter("mgender"));
		mvo.setBirth(request.getParameter("myear")+"-"+request.getParameter("mmonth")+"-"+request.getParameter("mday"));
	
		ims.insertMember(mvo);
		return "member/joinfinish";
		
	}
	@RequestMapping("/join_member_form")
	public String join_member_form(HttpServletRequest request,Model model) {
		return "member/joinmember";
		
	}
	@RequestMapping("/join_button_form")
	public String join_button_form(HttpServletRequest request,Model model) {
		
		return "member/joinbutton";
		
	}
	
	
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request,Model model) {
		HttpSession session=request.getSession();
		if(session!=null) session.invalidate();
		return "redirect:/";
		
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(HttpServletRequest request,Model model) {
		String mid=request.getParameter("mid");
		String mpwd=request.getParameter("mpwd");
		String url="member/login_fail";
		MemberVO mvo=ims.getMember(mid);
		HttpSession session = request.getSession();
		if(mvo!=null) {
			if(mvo.getPwd()!=null) {
				if(mvo.getPwd().equals(mpwd)) {
					session.setAttribute("loginUser", mvo);
					url="redirect:/";
				}
			}
		}
		return url;
		
	}
	
	@RequestMapping("/login_form")
	public String login_form(HttpServletRequest request,Model model) {
		return "member/login";
		
	}

}
