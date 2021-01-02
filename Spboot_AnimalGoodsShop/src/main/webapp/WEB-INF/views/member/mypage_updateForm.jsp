<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header1.jsp"%>
<form method="post" name="frmm">
    <div id="my_edit_profile_top_margin"></div>
    <div id="my_edit_profile_menu">
        <div id="my_deit_profile_my_name_box">
            <div id="my_deit_profile_my_name_text">${member.name}(${member.id })<br>적립금 : ${member.point }</div>
        </div>
           <div id="my_edit_profile_menu_text_box">
                <div class="my_edit_information_button">내 정보</div>
           </div>
        <div id="my_edit_profile_menu_text_box"></div>
        
        
        <div id="my_edit_profile_menu_text_box_top">
            <div class="my_edit_profile_icon_img"><img src="static/images/cart_icon.png" height="28"></div>
            <div class="my_edit_profile_icon_text">주문조회</div>
        </div>
        
        <div id="my_edit_profile_menu_text_box">
            <div class="my_edit_profile_icon_img"><img src="static/images/coupon_icon.png" height="28"></div>
            <div class="my_edit_profile_icon_text">쿠폰</div>
        </div>
        <div id="my_edit_profile_menu_text_box_bottom">
            <div class="my_edit_profile_icon_img"><img src="static/images/qna_icon.png" height="28"></div>
            <div class="my_edit_profile_icon_text"><a href="qna_list">1:1 문의</a></div>
        </div>
        
           
        
        
    </div>
    <div id="my_edit_profile_title">내 정보</div>
    <div id="my_edit_profile_body">
               
        <div id="my_edit_profile_body_left">
            <div class="my_edit_profile_text_box">이름</div>
            <div class="my_edit_profile_big_box">&nbsp;&nbsp;<input type="text" size="36" id="my_edit_text_box_line_delete" name="mname" value="${member.name}" readonly></div>
            
            <div class="my_edit_profile_text_box">아이디</div>
            <div class="my_edit_profile_big_box">&nbsp;&nbsp;<input type="text" size="36" id="my_edit_text_box_line_delete" name="mid" value="${member.id}" readonly></div>
                   
            <br>
            
            <div class="my_edit_profile_text_box">비밀번호</div>
            <div class="my_edit_profile_big_box">&nbsp;&nbsp;<input type="text" size="47" id="my_edit_text_box_line_delete" placeholder="4~10자의 영문, 특수문자, 숫자" name="mpwd"></div>
            
            <div class="my_edit_profile_big_box">&nbsp;&nbsp;<input type="text" size="47" id="my_edit_text_box_line_delete" placeholder="비밀번호 확인" name="mpwd_check"></div>
            <br>
            

            
            <div class="my_edit_profile_text_box">성별</div>
            <c:if test="${member.gender=='M'}">
           	 	<input type="radio" style="width:15px;height:15px;border:1px;" name="mgender" value="M" checked>남자
           	 	<input type="radio" style="width:15px;height:15px;border:1px;" name="mgender" value="F">여자
            </c:if>
            <c:if test="${member.gender=='F'}">
            	<input type="radio" style="width:15px;height:15px;border:1px;" name="mgender" value="M">남자
            	<input type="radio" style="width:15px;height:15px;border:1px;" name="mgender" value="F" checked>여자
            </c:if>
            <br>
            <br>
            
            <div class="my_edit_profile_text_box">생년월일</div>
            <div class="my_edit_profile_big_box_no_border">
            <div class="my_edit_profile_small_box"><input type="text" class="my_edit_text_small_box_line_delete" style="width:100px; height:20px; border:1px; font-size:12px;" placeholder="년(4자)" name="myear" value="${myear}"></div>
            <div class="my_edit_profile_small_box">
        <select name="mmonth" id="my_edit_profile_select_box_line_delete" style="width:100px; height:20px; border:1px; font-size:12px;">
            <option value="월">월</option>
           <c:forEach begin="1" end="12" step="1" var="index">
           
	    <c:choose>
	        <c:when test="${mmonth==index}"><option value="${index}" selected> ${index}</option></c:when>
	        <c:otherwise><option value="${index}"> ${index}</option></c:otherwise>
	    </c:choose>
	</c:forEach>
        </select>
    </div>
    <div class="my_edit_profile_small_box" style="margin-right:0px;"><input type="text" class="my_edit_text_small_box_line_delete" style="width:100px; height:20px; border:1px; font-size:12px;" placeholder="일" name="mday" value="${mday}"></div>
            </div>    
        <br>
        
        </div>
        
        <div id="my_edit_profile_body_right">
           
           <div class="my_edit_profile_text_box">휴대폰</div>
           

        <div class=my_edit_profile_big_box_no_border_2>

               <input type="text" name="mphone1" value="${mphone1}" class="my_edit_profile_input_box" style="width:100px; height:30px; font-size:12px;">
           

                <span>&nbsp;-</span>
                
                <input type="text" name="mphone2" value="${mphone2}" class="my_edit_profile_input_box" style="width:100px; height:30px; font-size:12px;">
                
                <span>&nbsp;-</span>
                
                <input type="text"  name="mphone3" value="${mphone3}" class="my_edit_profile_input_box" style="width:100px; height:30px; font-size:12px;">
        </div>
           
          <br><br><br>
            <div class="my_edit_profile_text_box">이메일</div>
               
               
            <div class="my_edit_profile_big_box_no_border_2">
                <input type="text" class="my_edit_profile_input_box" name="memail1" value="${memail1}" style="width:100px; height:30px; font-size:12px;" placeholder="이메일 주소">
                <span>&nbsp;&nbsp;@</span>
                
                <input type="text" class="my_edit_profile_input_box" name="memail2" value="${memail2}" style="width:100px; height:30px; font-size:12px;">
                &nbsp;
                <select name="memail3" onchange="changeSelect(this,1);" style="width:100px; height:35px; font-size:12px;">
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
            <div class="my_edit_profile_small_title">※다음메일(한메일)과 지메일은 메일수신이 원활하지 않을 수 있습니다.</div>
            <br>
            
            <div class="my_edit_profile_text_box">주소</div>
            <div class="my_edit_input_text_id">&nbsp;&nbsp;<input type="text" size="36" id="my_edit_text_box_line_delete" name="zip_num" value="${member.zip_num}"></div>
            <input type="button" class="my_edit_profile_user_id_check_box" value="우편번호 찾기" onclick="post_zip()">
            <div class="my_edit_profile_big_box">&nbsp;&nbsp;<input type="text" id="my_edit_text_box_line_delete" size="47" name="addr1" value="${addr1}"></div>
            <div class="my_edit_profile_big_box">&nbsp;&nbsp;<input type="text" id="my_edit_text_box_line_delete" size="47" name="addr2" value="${addr2}"></div>
        </div>
        
        <!-- 끝 -->
    </div>
    <div id="my_edit_profile_button_title">
    <input type="button" class="my_edit_profile_next_button" value="저장하기" onclick="go_update();">
    </div>
</form>
<%@ include file="../footer.jsp"%>