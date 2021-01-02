<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header1.jsp"%>
  <div id="findid_top_margin"></div>
    <div id="findidbody">
        <div id="findidbodytitle">아이디 찾기</div>
        <div id="findidtab">
            <div id="findidemailtab" onclick="showfindidemail()">이메일로 찾기</div>
            <div id="findidphonetab" onclick="showfindidphone()">휴대전화번호로 찾기</div>	
        </div>
        <form id="findidemailform" action="find_id_form" name="frmm" >
            <div id="findidemail">
                <div >이름
                    <div id="findidemailname">
                        <input  type="text" name="mname" class="findidemailtextarea">
                    </div>
                </div>
                <div id="findidemailemailtext">이메일
                    <div><input type="text" placeholder="이메일 주소" class="findidemailtextarea2" name="memail1">@<input type="text" class="findidemailtextarea2" name="memail2" readonly="readonly"></div>
                    <input type="hidden"  name="memail4" value="">
                    <div id="findidemailtype"></div>
                    <SELECT name="memail3" onchange="changeSelect(this,1);" id="findpwemailselect">
        <option value="" >메일주소선택</option>
        <option value='gmail.com'>gmail.com</option>
        <option value='naver.com'>naver.com</option>
        <option value='nate.com'>nate.com</option>
        <option value='hotmail.com'>hotmail.com</option>
        <option value='hanmail.net'>hanmail.net</option>
        <option value="user">직접입력</option>
    </SELECT>
                </div>
                <c:choose>
                <c:when test="${empty findId}">
                <span style="color:red; font-size: 10px;">아이디를 찾을수 없습니다</span>
                </c:when>
                <c:otherwise>
                <span style="color:red; font-size: 10px;">${findId.id}입니다</span>
                </c:otherwise>
                </c:choose>
                <input type="button" id="findidbutton" value="아이디 찾기"  style="width:400px;height:40px;" onclick="go_idSearch()">
            </div>
        </form>
        <form id="findidphoneform" action="find_id_form" name="frmmm">
         <input type="hidden" name="num" value="1">
            <div id="findidphone">
                <div>이름
                    <div id="findidphonename">
                        <input class="findidemailtextarea" type="text" name="mname">
                    </div>
                </div>
                <div id="findidphonediv">전화번호
                    <div>
                        <select name="mphone1" id="findidphonedropbox">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="017">017</option>
                        </select>
                    </div>&nbsp;- <input type="text" class="findidemailtextarea3" name="mphone2"> - <input type="text" name="mphone3" class="findidemailtextarea3">
                    
                </div>
                <c:choose>
                <c:when test="${empty findId2}">
                <span style="color:red; font-size: 10px;">아이디를 찾을수 없습니다</span>
                </c:when>
                <c:otherwise>
                <span style="color:red; font-size: 10px;">${findId2.id}입니다</span>
                </c:otherwise>
                </c:choose>
                <input type="button" id="findidbutton" value="아이디 찾기"  style="width:400px;height:40px;" onclick="go_idSearch2()">
            </div>
        </form>
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
   <c:if test="${num==1}">
            		<script type="text/javascript">
            			/* document.getElementById("findidphonetab")[0].click(); */
            			document.getElementById("findidphoneform").style.visibility="visible";
            
           				 document.getElementById("findidemailform").style.visibility="hidden";
            
            			document.getElementById("findidemailtab").style.border="1px solid silver";
            			document.getElementById("findidemailtab").style.borderBottom="1px solid black";
            
            			document.getElementById("findidphonetab").style.border="1px solid black";
           			    document.getElementById("findidphonetab").style.borderBottom="1px solid white";
            		</script>
            </c:if> 
<%@ include file="../footer.jsp"%>