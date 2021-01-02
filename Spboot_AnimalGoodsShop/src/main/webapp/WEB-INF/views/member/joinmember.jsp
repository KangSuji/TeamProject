<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header1.jsp"%>

<div id="member_join_my_information_top_margin"></div>
    
    <div id="member_join_my_information_body">
       <div id="my_information_left_margin"></div>
        <div id="my_information_title">회원정보입력</div>
        <form method="post" name="frmm">
        <div id="my_information_left">
            <div class="user_input_title">아이디</div>
            <div class="user_input_text_id">&nbsp;&nbsp;<input type="text" name="mid" size="36" id="id_text_box_line_delete" style="font-size:12px;" placeholder="영문,숫자포함 4~10자 이내" value="${mid}"></div>
            
           <input type="hidden" name="reid" value="${result}">
           <input type="button" class="user_id_check_box" value="중복확인" style="font-size:12px;" onclick="idcheck();">
      
  

            <br>
            
            <div class="user_input_title">비밀번호</div>
            <div class="user_input_text_pw_name">&nbsp;&nbsp;<input type="password" name="mpwd" size="47" id="id_text_box_line_delete" style="font-size:12px;" placeholder="영문,숫자포함 4~20자 이내"></div>
            
            <div class="user_input_text_pw_name">&nbsp;&nbsp;<input type="password" name="mpwd_check" size="47" id="id_text_box_line_delete"  style="font-size:12px;" placeholder="비밀번호 확인"></div>
            <br>
            
            <div class="user_input_title">이름</div>
            <div class="user_input_text_pw_name">&nbsp;&nbsp;<input type="text" name="mname" id="id_text_box_line_delete" size="47"></div>
            <br>
            
            <div class="user_input_title">성별</div>
            <input type="radio" name="mgender" value="M" style="width:15px; height:15px; border:1px;">남자
            <input type="radio" name="mgender" value="F" style="width:15px; height:15px; border:1px;">여자
            <br>
            <br>
            
            <div class="user_input_title">생년월일</div>
            <div class="user_input_text_pw_name_no_border">
            <div class="user_small_input_box"><input type="text" name="myear" class="text_box_line_delete" style="width:100px; height:20px; border:1px; font-size:12px;" placeholder="년(4자)"></div>
            <div class="user_small_input_box">
        <select name="mmonth" id="select_box_line_delete" style="width:100px; height:20px; border:1px; font-size:12px;">
            <option value="">월</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
        </select>
    </div>
    <div class="user_small_input_box" style="margin-right:0px;"><input type="text" name="mday" class="text_box_line_delete" style="width:100px; height:20px; border:1px; font-size:12px;" placeholder="일"></div>
            </div>    
        <br>
        
        <div class="user_input_title">휴대폰</div>
        <div class=user_input_text_pw_name_no_border>
            <div class="user_small_input_box">
                <select name="mphone1" id="select_box_line_delete" style="width:100px; height:20px; border:1px; font-size:12px;">
                <option value="010" selected>010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
                </select>
            </div>
                <div class="user_small_input_box"><input type="text" name="mphone2" class="text_box_line_delete" style="width:100px; height:20px; border:1px; font-size:12px;"></div>
                <div class="user_small_input_box"><input type="text"  name="mphone3" class="text_box_line_delete" style="width:100px; height:20px; border:1px; font-size:12px;"></div>
        </div>
        
        </div>
        
        <div id="my_information_right">
            <div class="user_input_title">이메일</div>
                <div class="user_small_input_box"><input type="text" name="memail1" class="text_box_line_delete" style="width:100px; height:20px; border:1px; font-size:12px;" placeholder="이메일 주소"></div>
                <div class="user_small_input_box"><input type="text" name="memail2" class="text_box_line_delete" style="width:100px; height:20px; border:1px; font-size:12px;"></div>
                <div class="user_small_input_box">
                <select name="memail3" onchange="changeSelect(this,1);" id="select_box_line_delete" style="width:100px; height:20px; border:1px; font-size:12px;">
                <option value="">직접입력</option>
                <option value="empal.com">empal.com</option>
                <option value="naver.com">naver.com</option>
                <option value="hotmail.com">hotmail.com</option>
                <option value="nate.com">nate.com</option>
                <option value="dreamwiz.com">dreamwiz.com</option>
                <option value="lycos.co.kr">lycos.co.kr</option>
                <option value="yahoo.co.kr">yahoo.co.kr</option>
                <option value="korea.com">korea.com</option>
                <option value="paran.com">paran.com</option>
                </select>
            </div>
            <br>
            <br>
            <br>
            <div class="user_input_small_title">※다음메일(한메일)과 지메일은 메일수신이 원활하지 않을 수 있습니다.</div>
            <br>
            <br>
            <div id="user_agreement_box">
                <div class="user_input_title">약관 동의</div>
                <input type="checkbox"  name="agree" style="width:15px; height:15px; border:1px;"/><a href="agreement1" target="_blank" style="color: grey">이용약관 동의(필수)</a>
                <br>
                <br>
                <input type="checkbox"  name="agree" style="width:15px; height:15px; border:1px;"/><a href="agreement2" target="_blank" style="color: grey">개인정보취급방침 동의(필수)</a>
                <br>
                <br>
                <input type="checkbox" name="agree" style="width:15px; height:15px; border:1px;"/><a href="agreement3" target="_blank" style="color: grey">미성년자 이동계약의 특칙(필수)</a>
                
            </div>
            <br>
            <input type="button" class="member_join_my_information_next_button" value="다음" onclick="go_save();">
                     

        </div>
        </form>
        
    </div>

<%@ include file="../footer.jsp"%>