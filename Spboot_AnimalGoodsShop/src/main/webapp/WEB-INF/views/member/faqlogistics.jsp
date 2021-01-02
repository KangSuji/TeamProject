<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header1.jsp"%>

<div id="faqhometopmargin"></div>
    <form name="faqhomefrm" id="faqhomefrm">
    <input type="hidden" name="command" value="faq_search">
        <div>
            <div id="faqtitle">FAQ</div>
            <div id="faqsearchcontainer">
                <input type="text" id="faqsearchinput" name="faqsearchinput" placeholder="&nbsp;&nbsp;궁금하신 내용을 검색해 보세요.">
                <input type="button" id="faqsearchbutton" value="검색" onclick="go_searchfaq()">
            </div>
        </div>
        
        <ul id="faqcontentlist">
            <li class="faqlistQ"><img src="images/qnabulletimg.png">주말에도 배송하나요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>보듬숍의 계약 택배사 로젠택배는 토요일에도 배송업무를 하고 있습니다.
            <br><br>
            * 교환/반품 택배 수거의 경우 평일만 적용.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">[묶음 배송] 주문을 따로 하면 배송비가 또 발생하나요?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>묶음 배송을 원하시는 경우 구매 원하시는 상품을 모두 장바구니에 담아 한 번에 결제해주셔야만 가능합니다.
            <br><br>
            단, 위탁판매 및 묶음 배송 불가 제품의 경우에는 별도의 배송비가 적용될 수 있습니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">배송 전 주소 변경 가능한가요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>택배 발송 전까지 1:1 게시판에 남겨주시거나, 보듬숍 고객센터로 연락해주시면 주소 변경이 가능합니다.
            <br><br>
            단, 택배가 발송된 후에는 주소 변경이 불가합니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">배송완료라고 뜨는데 물건을 못 받았어요.</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>간혹 기사님께서 소화전이나 무인 택배함 또는 경비실에 맡기시는 경우가 있습니다.
            <br><br>
            위의 장소 확인 후에도 물건을 수령하지 못하셨다면 보듬숍 고객센터로 문의하시기 바랍니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png" alt="">유선 주문 가능한가요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>온라인(자사 쇼핑몰과 네이버 스토어팜)을 통해서만 구매 가능하신 점 양해 부탁드립니다.
            <br><br>
            자사 쇼핑몰은 별도의 회원가입 없이 ‘비회원 구매’가 가능합니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">비회원 주문을 했는데 주문번호를 모르겠어요.</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>주문하실 때 입력하셨던 주문자명, 수취인명, 연락처, 주문하신 상품을 게시판이나 보듬숍 고객센터로 문의해주시면 주문번호를 안내해드리겠습니다.<br><br></div></li>
            
        </ul>
        <div id="faqPaging">
            <div class="faqPagingbutton"  style="font-weight: bold; color: #26ADE3; left: 77px;">1</div>
        </div>
        <a href="shop.do?command=faq_main"><div id="faqpreviousbutton">이전으로</div></a>
    </form>

<%@ include file="../footer.jsp"%>