<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header1.jsp"%>

<div id=member_top_margin></div>
    <div id=login_body>
        <div id=loginL>
            <div id="naver_login_button">
                <div class="naver_img"><img src="static/images/icon_naver.png" height="50"></div>
                <div class="login_text">네이버 아이디로 로그인</div>
            </div>
           
            <div id="facebook_login_button">
                <div class="naver_img"><img src="static/images/icon_facebook.png" height="50"></div>
                <div class="login_text">페이스북 아이디로 로그인</div>
            </div>
           
            <div id="cacao_login_button">
                <div class="naver_img"><img src="static/images/icon_kakao.png" height="50"></div>
                <div id="login_text_cacao">카카오 아이디로 로그인</div>
            </div>
            
            <div class="login_underline"></div>
            <form action="login" method="post">
            <div class=login_textbox><input  type="text" name="mid" id="loginidinput" placeholder="&nbsp&nbsp아이디" style="width:365px;height:48px;"></div>
            <div class=login_textbox><input  type="password"  name="mpwd" id="loginpwinput" placeholder="&nbsp&nbsp비밀번호" style="width:365px;height:48px;"></div>
            <input type="submit" id=login_button value="로그인">
            </form>
        </div>
        <div id=loginR>
            <div class="loginR1">
                <div class="loginRcon1">아직 보듬 회원이 아니신가요?</div>
                <div class="loginRcon2">보듬 회원이 되시면 보듬의 다양한 교육에 참여하실 수 있습니다.</div>
                <a href="join_button_form" style="text-decoration:none ; color:#000000"><div id="loginRButton1">회원가입</div></a>
            </div>
            <div class="loginR1">
                <div class="loginRcon1">로그인 정보가 생각나지 않으세요?</div>
                <div class="loginRcon2">아이디 또는 비밀번호를 찾으실 수있습니다.</div>
                <a href="find_id_form"  style="text-decoration:none ; color:#000000"><div class="loginRButton2">아이디 찾기</div></a>
                <a href="find_pwd_form"  style="text-decoration:none ; color:#000000"><div class="loginRButton2">비밀번호 찾기</div></a>
            </div>
        </div>
    </div>



<%@ include file="../footer.jsp"%>