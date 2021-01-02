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
            <li class="faqlistQ"><img src="images/qnabulletimg.png">교환/반품처리 기간은 얼마나 걸리나요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>교환/반품 완료까지 접수 후 약 4~5일 정도 소요됩니다.
            <br><br>
            교환/반품 처리 기간은 상품에 따라 다를 수 있으며, 재고 여부(교환 시) 및 택배사와 위탁판매 업체 사정에 의해 처리 및 배송이 지연될 수 있습니다.
            <br><br>
            접수일 기준으로 통상 3일 이내 택배 수거 지시가 이루어지며, 보듬 측으로 제품 회수 후 반품 및 교환 원하시는 상품으로 재배송해드리고 있습니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">[교환/반품 주소] 교환/반품은 어디로 보내면 되나요?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>교환/반품할 경우에는 수령한 제품의 택배 송장에 기재되어 있는 업체 주소지로 반품해야 합니다.
            <br><br>
            위탁 판매 제품의 경우, 위탁 업체에 따라 교환/반품 주소와 배송비 및 환불 규정이 다를 수 있습니다.
            <br><br>
            반드시 보듭숍 고객센터(1800-6358)를 통한 전화접수 후에 교환/반품이 가능합니다.
            <br><br><br>


            [교환/반품 주소 안내]
            <br><br>
            * 택배 수령 시, ‘㈜보듬컴퍼니’에서 보낸 제품일 경우
            <br><br>
            경기도 남양주시 와부읍 덕소리 283-21 ㈜보듬컴퍼니<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">새 제품 텍이 떨어졌는데 교환/반품이 가능한가요?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>상세페이지에도 기재되어 있듯이 텍이 훼손되면 상품 가치 하락으로 재판매가 어려우므로 교환/반품이 불가합니다.
            <br><br>
            특히, 수입상품(하키하나, 니나오토슨, 멜슨 등)은 텍 훼손, 제품 박스 개봉만으로 교환/반품이 절대 불가하니 이점 참고하여 주시기 바랍니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">교환/반품 접수는 어떻게 하나요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>자사 쇼핑몰에서 구매 >
            <br><br>
            마이페이지 - 1:1 문의에서 문의 글 작성 후, 교환/반품 접수
            <br><br><br>

            스토어팜(네이버)에서 구매 >
            <br><br>
            네이버페이 - 결제내역(PC버전)에서 교환/반품 접수
            <br><br><br>

            * 위탁판매 상품은 보듬숍 고객센터(1800-6358)를 통한 전화로 교환/반품 접수가 가능합니다.<br><br></div></li>
        </ul>
        <div id="faqPaging">
            <div class="faqPagingbutton"  style="font-weight: bold; color: #26ADE3; left: 77px;">1</div>
        </div>
        <a href="shop.do?command=faq_main"><div id="faqpreviousbutton">이전으로</div></a>
    </form>

<%@ include file="../footer.jsp"%>