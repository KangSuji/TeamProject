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
            <li class="faqlistQ"><img src="images/qnabulletimg.png">가슴줄과 리드줄은 세트 상품인가요?</li>
            <div class="faqlistA"><div class="faqlistAcontent"><br>가슴줄과 리드줄은 별도 판매 상품입니다.
            <br><br>
            결제를 따로 하시면 각각의 배송비가 별도로 부과됩니다.
            <br><br>
            묶음 배송을 원하시는 경우 구매 원하시는 상품을 모두 장바구니에 담아 한 번에 결제해주기 바랍니다.<br><br></div></div>
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
            머리를 통과하는 가슴줄을 불편해하거나, 귀가 줄에 닿는 것을 싫어하는 예민한 반려견에게 추천해드립니다. <br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">가슴줄은 어떤 사이즈가 좋을까요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>가슴줄 사이즈의 경우 같은 체중 또는 견종이어도 체형에 따라 가슴둘레 사이즈가 상이할 수 있습니다.
            <br><br>
            구매 전 반드시 정확한 가슴둘레를 측정하신 후 상세표 사이즈를 참고 해주시기 바랍니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png" alt="">반려견의 몸 둘레 재는 위치를 모르겠습니다.</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>* 모든 둘레 및 길이는 cm 단위입니다.
            <br><br>
            가슴둘레 : 반려견의 앞다리 겨드랑이에서 떨어진 흉곽(가장 두꺼운 부분)을 기준으로 한 바퀴
            <br><br>
            등 길이 : 반려견의 가슴둘레를 재는 곳(등 쪽)부터 얼굴로 올라가는 길이
            <br><br>
            목 둘레 : 반려견의 목이 시작되는 가장 두꺼운 지점 한 바퀴
            <br><br>
            배 둘레 : 사람을 예로 갈비뼈 가장 마지막 부분이 위치 한 곳 기준으로 한 바퀴<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">가슴줄이 자꾸 돌아가는데, 몸에 딱 맞게 채워야 하나요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>가슴줄 착용 시 딱 맞게 착용하는 것보다 리드줄 방향에 따라 자연스럽게 좌우로 움직이는 정도가 좋습니다.
            <br><br>
            가슴줄이 돌아가는 것은 상품 불량으로 인한 치우침이 아닌 이상적인 상태입니다.
            <br><br>
            * 보호자님의 손가락 2~3개 정도가 들어갈 수 있는 정도의 여유 공간을 남긴 후 채워주시기 바랍니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">가슴줄이 쓸리지는 않을까요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>반려견의 신체 구조에 가장 적합한 H 형태의 가슴줄로 겨드랑이 쪽에 마찰이 가지 않도록 설계되어 있습니다.
            <br><br>
            반려견에게 가슴줄을 너무 딱 맞게 착용시켰을 시 피부가 쓸릴 수 있으며, 리드줄의 방향에 따라 좌우로 자연스럽게 움직일 수 있도록 길이 조절을 해 주시기 바랍니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">반려견이 당기면 가슴 부분에 압박이 가지 않을까요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>보듬에서 판매 중인 모든 H형 가슴줄은 목, 가슴, 등, 배를 전체적으로 감싸주어 당겨질 때의 충격을 최대한 분산시켜주도록 제작되었습니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">리드줄 길이는 몇 미터가 좋을까요 ?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>리드줄의 길이는 보호자님의 핸들링 숙련도와 산책 장소에 따라 정해주시는 게 좋습니다.
            <br><br>
            보듬에서는 견종과 체중 등에 상관없이 길이 3미터 리드줄을 권장해 드리고 있으며, 5미터 이상은 넓은 공터나 운동장 등에서 반려견이 최대한 자유롭게 산책시키는 경우 추천해드립니다.<br><br></div></li>
            <li class="faqlistQ"><img src="images/qnabulletimg.png">리드줄 후크 종류가 많은데 어떻게 골라야하나요?</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>상세 페이지에 기재되어 있는 권장 몸무게에 맞게 선택해주시되, 각 반려견의 특성을 고려하여 선택해주시기 바랍니다.
            <br><br>
            * P후크 : 일본 반려견 시장에서 사용 중인 제품으로 일반 국산후크보다 내구성이 좋으며, 가벼워 반려견에게 부담이 적습니다.
            <br><br>
            * HS후크 : 끄는 힘이 매우 강한 반려견 또는 대형견의 경우, 국산후크 리드줄 사용 시 파손의 위험이 있어, 독일 HS사에서 제작된 내구성이 매우 좋은 HS후크를 고려하여 주시기 바랍니다.<br><br></div></li>
        </ul>
        <div id="faqPaging">
            <div class="faqPagingbutton" style="font-weight: bold; color: #26ADE3;">1</div>
            <div class="faqPagingbutton"><a href="shop.do?command=faqproductnext">2</a></div>
            <div class="faqPagingbutton" id="faqPagingbuttonborder">Previous&nbsp;&nbsp;&nbsp;</div>
            <div class="faqPagingbutton"><a href="shop.do?command=faqproductnext">Next</a></div>
        </div>
        <a href="shop.do?command=faq_main"><div id="faqpreviousbutton">이전으로</div></a>
    </form>

<%@ include file="../footer.jsp"%>