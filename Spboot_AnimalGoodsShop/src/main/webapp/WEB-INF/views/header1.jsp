<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GoodsShop</title>
<link href="static/css/goods1.css" rel="stylesheet">
<link href="static/css/findid.css" rel="stylesheet">
<link href="static/css/joinmember.css" rel="stylesheet">
<link href="static/css/joinbutton.css" rel="stylesheet">
<link href="static/css/login.css" rel="stylesheet">
<link href="static/css/findpwd.css" rel="stylesheet">
<link href="static/css/joinfinish.css" rel="stylesheet">
<link href="static/css/resetPass.css" rel="stylesheet">
<link href="static/css/pay.css" rel="stylesheet">

<link href="static/css/qna.css" rel="stylesheet">
<link href="static/css/mypage_updateForm.css" rel="stylesheet">
<link href="static/css/faq.css" rel="stylesheet">
<script src="static/jquery/jquery-3.5.1.js"></script>
<script type="text/javascript" src="static/script/member.js"></script>
<script type="text/javascript" src="static/script/mypage.js"></script>
<script type="text/javascript" src="static/script/findid.js"></script>
<script type="text/javascript" src="static/script/findpwd.js"></script>
<script type="text/javascript" src="static/script/faq.js"></script>
<script type="text/javascript" src="static/script/qna.js"></script>
</head>
<body>
   <div id="wrap">
        <header>
            <div id="header_top">
                <div id="top">  
                    <div id="logo"><div id="main_logo" style="text-align: center;">
                    <a href="/"><img src ="static/images/logo.png"></a></div></div>
                    <div id="right">
                           <nav id="top_menu">
                                <ul><c:choose>
                                		<c:when test="${empty loginUser}">
 											<li><a href="login_form">로그인&nbsp;&nbsp;</a></li>
 											<li><a href="join_button_form">회원가입&nbsp;&nbsp;</a></li>
 										</c:when>
 									<c:otherwise>
 					
 											<li><a href="logout">로그아웃&nbsp;&nbsp;</a></li>
 											<li><a href="mypage_update_form?mid=${loginUser.id}">마이페이지&nbsp;&nbsp;</a></li>
 									</c:otherwise>
                                 </c:choose>
                                    <li><a href="faq_main">고객센터&nbsp;&nbsp;</a></li>
                                    <li>주문조회&nbsp;&nbsp;</li>
                                    <li style="border-style: none;"><a href="cart_list">장바구니</a></li>
                                </ul>
                          </nav>  
                    </div> 
                </div>
             
        </div>
     </header>
