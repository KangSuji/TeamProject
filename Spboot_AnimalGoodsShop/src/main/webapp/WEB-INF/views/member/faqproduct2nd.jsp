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
            <li class="faqlistQ"><img src="images/qnabulletimg.png">리드줄이 끊어지진 않을까요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>반려견이 입으로 물지 않는 이상 산책 중 리드줄이 끊어지는 경우는 발생하기 힘드나, 가슴줄과 리드줄은 소모품으로서 땅에 자주 끌리게 두시거나, 나무 등에 묶어 놓으시는 경우 파손 가능성이 높아질 수 있습니다.
            <br><br>
            * 산책이 끝난 후에는 가슴줄과 리드줄을 물지 않도록 안전한 곳에 보관해주세요.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">가슴줄과 리드줄 세탁은 어떻게 하나요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>약 30˚가량의 미온수에서 중성 세제를 이용해 단독 손세탁 후 그늘건조를 권장 해 드리고 있습니다.
            <br><br>
            * 기계건조금지
            <br><br>
            * 염소표백금지<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">A/S나 수선이 가능한가요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>상세페이지에 기재되어 있듯 별도의 A/S나 수선은 불가합니다.
            <br><br>
            또한, 부속품만 별도로 판매하고 있지 않습니다.
            <br><br><br>

            보듬에서는 구매일 기준 90일 이내 제품이 파손된 보호자님을 위하여 가슴줄에 한하여 ‘가슴줄 보상판매’를 시행하고 있습니다.
            <br><br>
            구매 30일 이내 제품 파손 시 30% 할인, 구매 90일 이내 제품 파손 시 20% 할인된 금액으로 새 제품을 구매하실 수 있습니다.
            <br><br><br>

            * 보상판매를 원하실 시 게시판에 문의 글 작성 또는 보듬숍 고객센터로 문의하시기 바랍니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">코담요의 먼지와 보풀이 반려견에게 해롭지 않을까요?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>코담요는 원단 특성상 어느 정도 먼지와 보풀이 일어날 수 있습니다.
            <br><br>
            사용 전 세탁(빨래망 사용, 단독세탁, 중성세제 사용, 자연건조)을 권장해드리고 있습니다.
            <br><br>
            2~3회 세탁 후에는 먼지가 현저히 줄어드는 것을 확인하실 수 있으나, 반려견이 코담요에 소변을 보지 않는 이상 너무 잦은 세탁보다는 먼지 제거기로 평소에 가볍게 관리해주시기 바랍니다.
            <br><br>
            코를 통해 세상을 인식하는 반려견들은 사람이 생각하는 것보다 훨씬 더 먼지와 자극적인 냄새 등을 걸러내는 데 익숙합니다.
            <br><br>
            후각 활동을 하다 보면 하얀색 물이 코에서 떨어지는 등 반려견의 코는 손상과 이물질을 막기 위한 장치가 되어 있어, 코담요에서 나오는 먼지가 반려견이 냄새를 맡거나 먹었을 때 큰 문제를 일으키지 않습니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png" alt="">코방석 솜 꺼짐은 없나요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>코방석 충전재인 솜의 경우 100% 폴리에스터로 복원력이 뛰어나다는 장점이 있습니다.
            <br><br>
            부드러운 솜을 압축하여 꽉 채웠기 때문에 일반적인 꺼짐 현상은 거의 없으나 1~2년 사용 후 꺼짐이 발생한다면 솜이 살아날 수 있게 올바른 세탁법으로 세탁해주시기 바랍니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">코방석/코담요를 다른 제품과 묶음 배송이 가능한가요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>코방석/코담요는 크기가 커서 주문 전 이미 개별 포장이 되어 있습니다.
            <br><br>
            그러므로 다른 제품과 함께 주문하셔도 합포장이 불가하여 별도의 배송비가 발생하는 점 참고 부탁드립니다.<br><br></div></li>
            
        </ul>
        <div id="faqPaging">
            <div class="faqPagingbutton"><a href="shop.do?command=faq_product">1</a></div>
            <div class="faqPagingbutton" style="font-weight: bold; color: #26ADE3;">2</div>
            <div class="faqPagingbutton" id="faqPagingbuttonborder"><a href="shop.do?command=faq_product">Previous&nbsp;&nbsp;&nbsp;</a></div>
            <div class="faqPagingbutton">Next</div>
        </div>
        <a href="shop.do?command=faq_main"><div id="faqpreviousbutton">이전으로</div></a>
    </form>

<%@ include file="../footer.jsp"%>