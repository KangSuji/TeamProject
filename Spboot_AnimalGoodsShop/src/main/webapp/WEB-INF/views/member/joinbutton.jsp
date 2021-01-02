<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header1.jsp"%>
    <!-- <div id=member_top_margin></div> -->
    <br>
    <br>
    <br>
       <div id="Bodeum_join_title">보듬 회원가입</div>
       
        <div id="naver_button">
            <div class="naver_img"><img src="static/images/icon_naver.png" height="50"></div>
            <div class="join_text">네이버 아이디로 회원가입</div>
           </div>
           
        <div id="facebook_button">
            <div class="naver_img"><img src="static/images/icon_facebook.png" height="50"></div>
            <div class="join_text">페이스북 아이디로 회원가입</div>
           </div>
           
        <div id="cacao_button">
            <div class="naver_img"><img src="static/images/icon_kakao.png" height="50"></div>
            <div class="join_text">카카오 아이디로 회원가입</div>
           </div>
            
       <div class="underline"></div>
       
        <div id="Bodeun_button">
        <input type="button" class="Bodeun_join_button" value="보듬 계정 만들기" onclick="location.href='join_member_form'">
        </div>
        
        <div id=bottom_login>이미 계정이 있으신가요?
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;<a href="login_form" style="color: grey">로그인하러가기</a></div>
    
    
</div>
</body>
</html>
<%@ include file="../footer.jsp"%> 