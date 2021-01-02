<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header1.jsp"%>
 <form name="frmm" action="find_pwd_form">
        <div id="findpw_top_margin"></div>
        <div id="findpwbody">
            <div id="findpwtitle">비밀번호 찾기</div>
            <div id="findpwid">아이디
                <div id="findpwidtext"><input class="findpwbiginput" type="text" name="mid"></div>
            </div>
            <div id="findpwname">이름 
                <div><input class="findpwbiginput" type="text" name="mname"></div>
            </div>
            <div id="findpwphone">
                <div>전화번호</div>
                <select name="mphone1" id="findpwphoneselect">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="017">017</option>
                </select>-<input type="text" class="findpwsmallinput" name="mphone2">-<input type="text" class="findpwsmallinput" name="mphone3">
            </div>
            
            <div id="findpwemail">이메일
                <div><input type="text" class="findpwmedinput" name="memail1">@<INPUT type="text" name="memail2" size="8" class="findpwmedinput" name="memail2" />
     
    <SELECT name="memail3" onchange="changeSelect(this,1);" id="findpwemailselect">
        <option value="">메일주소선택</option>
        <option value='gmail.com'>gmail.com</option>
        <option value='naver.com'>naver.com</option>
        <option value='nate.com'>nate.com</option>
        <option value='hotmail.com'>hotmail.com</option>
        <option value='hanmail.net'>hanmail.net</option>
        <option value="user">직접입력</option>
    </SELECT>
                
            </div>
            <c:choose>
            <c:when test="${empty findPass}">
                <span style="color:red; font-size: 10px;">비밀번호를 찾을 수 없습니다</span>
                </c:when>
                <c:otherwise>
              
                </c:otherwise>
             </c:choose>
            <input type="button" id="findidbutton" value="비밀번호 찾기"  style="width:400px;height:40px;" onclick="go_pwdSearch()">
        </div>
        </div>
    </form>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
  
<%@ include file="../footer.jsp"%>
