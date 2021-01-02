<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header1.jsp"%>

<div id="faqhometopmargin"></div>
    <form name="faqhomefrm" id="faqhomefrm" action="shop.do?">
    <input type="hidden" name="command" value="faq_search">
        <div>
            <div id="faqtitle">고객센터</div>
            <div id="faqsearchcontainer">
                <input type="text" id="faqsearchinput" name="faqsearchinput" placeholder="&nbsp;&nbsp;궁금하신 내용을 검색해 보세요.">
                <input type="button" id="faqsearchbutton" value="검색" onclick="go_searchfaq()">
            </div>
        </div>
        <div id="faqtype">
            <div class="faqtypebutton" id="faqtypetop10button">&nbsp;&nbsp;TOP 10</div>
            <div class="faqtypebutton"><a href="shop.do?command=faq_product">&nbsp;상품문의</a></div>
            <div class="faqtypebutton"><a href="shop.do?command=faq_logistics">&nbsp;주문/배송</a></div>
            <div class="faqtypebutton"><a href="shop.do?command=faq_returns">&nbsp;교환/반품</a></div>
        </div>
        <ul id="faqcontentlist">
            <li class="faqlistQ"><img src="images/qnabulletimg.png">품절상품 재입고 일정은 알 수 없나요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>입고 일정은 상품마다 매우 상이하며, 입고 여부가 정해져 있지 않은 경우도 있습니다.<br><br><br>게시판에 문의 글 작성 또는 보듬숍 고객센터로 문의해주시면 안내해드리겠습니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">A/S나 수선이 가능한가요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>상세페이지에 기재되어 있듯 별도의 A/S나 수선은 불가합니다.
            <br>
            또한, 부속품만 별도로 판매하고 있지 않습니다.
            <br><br>
            보듬에서는 구매일 기준 90일 이내 제품이 파손된 보호자님을 위하여 가슴줄에 한하여 ‘가슴줄 보상판매’를 시행하고 있습니다.
            <br><br>
            구매 30일 이내 제품 파손 시 30% 할인, 구매 90일 이내 제품 파손 시 20% 할인된 금액으로 새 제품을 구매하실 수 있습니다.
            <br>
            <br>
            <br>
            * 보상판매를 원하실 시 게시판에 문의 글 작성 또는 보듬숍 고객센터로 문의하시기 바랍니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">배송은 언제 시작되나요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>평일(월~금) 오전 10시 이전 주문/결제 완료 건에 한하여 당일 출고되며, 이후 주문 건은 익일 발송됩니다.
            <br><br>
            배송의 경우는 평균적으로 1~2일 내 상품 수령이 가능합니다.
            <br><br>
            단, 택배사의 사정(연휴 기간, 기상 등)에 따라 배송기간은 차이가 있을 수 있으니 양해부탁드립니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">기기 변경 횟수가 초과되었다고 나와요.</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>디바이스 종류(데스크톱, 노트북, 태블릿, 모바일 등)와 무관하게 한 아이디 당 기기 3대까지 이용하실 수 있습니다.
            기기 변경 및 초기화를 원하시면 고객센터로 연락주시거나, 마이페이지 내 1:1 문의를 남겨주시기 바랍니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">방문해서 구매/수령 가능한 곳이 있나요?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>보듬숍은 별도의 오프라인 매장을 운영하지 않아, 방문 수령 및 방문 구매는 불가합니다.
            <br>
            온라인(자사 홈페이지 쇼핑몰과 네이버 스토어팜)을 통해서만 구매 가능하신 점 양해 부탁드립니다.
            <br>
            * 남양주 캠퍼스는 ㈜보듬컴퍼니의 교육장으로 방문하셔도 제품 착용, 방문 수령 및 방문 구매는 불가합니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">교환/반품 접수는 어떻게 하나요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>자사 쇼핑몰에서 구매 >
            <br><br>
            마이페이지 - 1:1 문의에서 문의 글 작성 후, 교환/반품 접수
            <br><br><br>
            스토어팜(네이버)에서 구매 >
            <br><br>
            네이버페이 - 결제내역(PC버전)에서 교환/반품 접수
            <br><br>
            * 위탁판매 상품은 보듬숍 고객센터(1800-6358)를 통한 전화로 교환/반품 접수가 가능합니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">가슴줄과 리드줄은 세트 상품인가요?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>가슴줄과 리드줄은 별도 판매 상품입니다.
            <br><br>
            결제를 따로 하시면 각각의 배송비가 별도로 부과됩니다.
            <br><br>
            묶음 배송을 원하시는 경우 구매 원하시는 상품을 모두 장바구니에 담아 한 번에 결제해주기 바랍니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">스트라이프 라인과 보듬 가슴줄은 어떤 차이가 있나요?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>가슴줄의 경우 형태는 H형으로 동일하나, 원단이 다릅니다.
            <br><br>
            * 스트라이프 라인 : 겉면 100% 순면 / 북유럽 유아용품에 사용되는 원단
            <br><br>
            * 솔리드 라인 : 웨빙 원단 / 일반적으로, 책가방이나 벨트에 사용되는 원단
            <br><br><br>

            웨빙 원단의 경우 감촉이 부드럽고 탄탄한 특징이 있으며,
            <br><br>
            100% 순면 원단은 촉감이 웨빙 원단보다는 좀 더 뻣뻣한 감이 있지만, 웨빙 원단보다 가벼워 반려견에게 부담이 적습니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">후크형 가슴줄은 다른 가슴줄과 어떤 차이가 있나요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>기존 가슴줄은 머리를 통과시켜 착용하는 반면 후크형 가슴줄은 목걸이를 하듯 뒤쪽에 후크를 걸어 착용합니다.
            <br><br>
            머리를 통과하는 가슴줄을 불편해하거나, 귀가 줄에 닿는 것을 싫어하는 예민한 반려견에게 추천해드립니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">가슴줄은 어떤 사이즈가 좋을까요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>가슴줄 사이즈의 경우 같은 체중 또는 견종이어도 체형에 따라 가슴둘레 사이즈가 상이할 수 있습니다.
            <br><br>
            구매 전 반드시 정확한 가슴둘레를 측정하신 후 상세표 사이즈를 참고 해주시기 바랍니다.<br><br></div></li>
        </ul>
    </form>

<%@ include file="../footer.jsp"%>