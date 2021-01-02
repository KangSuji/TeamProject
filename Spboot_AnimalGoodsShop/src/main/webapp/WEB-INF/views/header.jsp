<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String[] subkindList1= {"","가슴줄","리드줄","목줄","안전용품","산책용품"};
String[] subkindList2= {"","SUMMER","아우터","티셔츠","악세서리"};
String[] subkindList3= {"","이동장","안전문","방석·매트","식기·보관","목욕·위생","탈취·소독","디지털·가전"};
String[] subkindList4= {"","노즈워크","터그","공","삑삑이","소프트토이"};
String[] subkindList5= {"","트릿백·가방","클리커","어질리티·피트니스","트레이너 의류"};
String[] subkindList6= {"","자연식·습식","사료·건식","간식","파우더","영양제"};
String[] subkindList7= {"","도서","문구"};
request.setAttribute("subkindList1", subkindList1);
request.setAttribute("subkindList2", subkindList2);
request.setAttribute("subkindList3", subkindList3);
request.setAttribute("subkindList4", subkindList4);
request.setAttribute("subkindList5", subkindList5);
request.setAttribute("subkindList6", subkindList6);
request.setAttribute("subkindList7", subkindList7);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GoodsShop</title>
<link href="static/css/goods.css" rel="stylesheet">
<link href="static/css/main.css" rel="stylesheet">
<link href="static/css/cartList.css" rel="stylesheet">
<link href="static/css/productDetail.css" rel="stylesheet">
<link href="static/css/productList.css" rel="stylesheet">
<script src="static/jquery/jquery-3.5.1.js"></script>

<script type="text/javascript" src="static/script/cartList.js"></script>
<script type="text/javascript" src="static/script/main.js"></script>
<script type="text/javascript" src="static/script/productDetail.js"></script>
<script type="text/javascript" src="static/script/product.js"></script>
<script type="text/javascript" src="static/script/member.js"></script>
<script type="text/javascript" src="static/script/mypage.js"></script>


</head>
<body>
   <div id="wrap">
        <header>
            <div id="header_top">
                <div id="top">  
                    <div id="logo">
                    <a href="/"><img src ="static/images/logo.png"></a></div></div>
                    <div id="right">
                           <nav id="top_menu">
                                <ul>
                                <c:choose>
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
            <div id="bottom">
                <nav id="category_menu" >
                    <div><a href="/">HOME</a></div>
                    <div id="category_menu_1"><a href="product_list?kind=1&first=1">야외용품</a>
                        <div class="sub_menu" >
                            <c:forEach items="${subkindList1}" var="subkind" varStatus="status">
                            <a href="product_list?kind=1&subkind=${status.count}&first=1"><div>${subkind}</div></a>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="category_menu_1"><a href="product_list?kind=2&first=1">패션</a>
                         <div class="sub_menu" >
                            <c:forEach items="${subkindList2}" var="subkind" varStatus="status">
                            <a href="product_list?kind=2&subkind=${status.count}&first=1"><div>${subkind}</div></a>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="category_menu_1"><a href="product_list?kind=3&first=1">리빙</a>
                         <div class="sub_menu" >
                            <c:forEach items="${subkindList3}" var="subkind" varStatus="status">
                            <a href="product_list?kind=3&subkind=${status.count}&first=1"><div>${subkind}</div></a>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="category_menu_1"><a href="product_list?kind=4&first=1">장난감</a>
                         <div class="sub_menu" >
                            <c:forEach items="${subkindList4}" var="subkind" varStatus="status">
                            <a href="product_list?kind=4&subkind=${status.count}&first=1"><div>${subkind}</div></a>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="category_menu_1"><a href="product_list?kind=5&first=1">훈련용품</a>
                         <div class="sub_menu" >
                            <c:forEach items="${subkindList5}" var="subkind" varStatus="status">
                            <a href="product_list?kind=5&subkind=${status.count}&first=1"><div>${subkind}</div></a>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="category_menu_1"><a href="product_list?kind=6&first=1">푸드</a>
                         <div class="sub_menu" >
                            <c:forEach items="${subkindList6}" var="subkind" varStatus="status">
                            <a href="product_list?kind=6&subkind=${status.count}&first=1"><div>${subkind}</div></a>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="category_menu_1"><a href="product_list?kind=7&first=1">문구·도서</a>
                         <div class="sub_menu" >
                            <c:forEach items="${subkindList7}" var="subkind" varStatus="status">
                            <a href="product_list?kind=7&subkind=${status.count}&first=1"><div>${subkind}</div></a>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="category_menu_1"><a href="#" onclick="go_cupon_page();">쿠폰</a>
                       
                    </div>
                
                    <div style="border-style: none;" >
                        <form method="post" name="frm">
                        <div id="search_menu" onclick="view"><input type="text" style="width:200px;height:30px;border-radius:10px" name="key" value="${key}"><img src="static/images/search.png" style="float:right; vertical-align: middle;" onClick="go_search();"></div>
                        </form>
                    </div>
                </nav>
            </div>   
        </div>
     </header>    
