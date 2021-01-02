<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header1.jsp"%>

<form name="payform" id="payform" action="">
        <div id="payview">
            <div id="payviewleft">
                <div id="paytitle">결제하기</div>
                <div id="payleft1">
                    <div id="payitemlist">
                        <div class="payitemlist1">개별 배송상품</div>
                        <table style=  "cellpadding=0;  cellspacing=0;">
                                <tr class="tablediv">
                                    <th class="payprddetail">상품 정보</th>
                                    <th class="payprdprice">상품 금액</th>
                                    <th class="paytabledelivcost">배송비</th>
                                </tr>
                                <tr class="tablediv">
                                    <td class="payprddetail">
                                        <div id="payprddetailimg"></div>
                                        <div id="payprdinnerdetail">
                                            <div style="margin-bottom: 5px; height: 21px;"></div>
                                            <div style="margin-bottom: 10px; font-size: 90%; height: 20px;"></div>
                                            <div>수량 :&nbsp;</div>
                                        </div>
                                    </td>
                                    <td class="payprdprice"><div class="payprdcentering"></div></td>
                                    <td class="paytabledelivcost"><div class="payprdcentering">배송비 무료</div></td>
                                </tr>
                        </table>
                        <div class="paysectionlastline"></div>
                    </div>
                    <div id="paymemberdetail">
                        <div class="payitemlist1">
                            <div style="float: left;">구매자 정보</div>
                            <div style="float: right; font-weight: 100; font-size: 80%;">* 필수 입력사항</div>
                        </div>
                        <div class="paypersonaldetailsection">
                            <div class="paypersonaldetaillabel">* 이름</div>
                            <input type="text" class="payinputname" style="">
                        </div>
                        <div class="paypersonaldetailsection">
                            <div class="paypersonaldetaillabel">* 핸드폰번호</div>
                            <select name="payphoneselect" id="payphoneselect">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="017">017</option>
                            </select>&nbsp;-
                            <input class="payphoneinput" type="text">&nbsp;-
                            <input class="payphoneinput" type="text">
                        </div>
                        <div class="paypersonaldetailsection" style="margin-bottom: 40px;">
                            <div class="paypersonaldetaillabel">* 이메일</div>
                            <input class="payemailinput" type="text"> @ <input class="payemailinput" type="text" name="payemailselected1"><select name="payemailselect" class="payemailselect" onclick="payemailselect1(this,1)">
                                <option value="user">직접입력</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="naver.com">naver.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                                <option value="hotmail.com">hotmail.com</option>
                            </select>
                        </div>
                    </div>
                    <div id="paydelivdetail">
                        <div class="payitemlist1">
                            <div style="float: left;">배송지 정보</div>
                            <div style="float: right; font-weight: 100; font-size: 80%;">* 필수 입력사항</div>
                        </div>
                        <div class="paypersonaldetailsection">
                            <div class="paypersonaldetaillabel">* 이름</div>
                            <input type="text" class="payinputname" id="payinputnamebox">
                        </div>
                        <div class="paypersonaldetailsection">
                            <div class="paypersonaldetaillabel">* 핸드폰번호</div>
                            <select name="payphoneselect" id="payphoneselect">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="017">017</option>
                            </select>&nbsp;-
                            <input class="payphoneinput" type="text" id="payphoneinputbox">&nbsp;-
                            <input class="payphoneinput" id="payphoneinputbox2" type="text">
                        </div>
                        <div class="paypersonaldetailsection">
                            <div class="paypersonaldetaillabel">* 이메일</div>
                            <input class="payemailinput" id="payemailinputbox" type="text"> @ <input class="payemailinput" type="text" name="payemailselected2"><select name="payemailselect" class="payemailselect" onclick="payemailselect2(this,1)">
                                <option value="user">직접입력</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="naver.com">naver.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                                <option value="hotmail.com">hotmail.com</option>
                            </select>
                        </div>
                        <div class="paypersonaldetailsection" style="height: 80px; margin-bottom: 15px; margin-top: 10px;">
                            <div class="paypersonaldetaillabel" style="height: 80px; line-height: 80px;">* 주소</div>
                            <div>
                                <div class="payphoneinput" id="payaddinputbox1" style="float: left; text-align: center; line-height: 30px;"></div> <input type="button" value="우편번호 찾기" style="margin-left: 10px; height: 32px; border: 1px solid;">
                                <input type="text"  id="payaddinputbox2" style="width: 600px; height: 30px; margin-top: 10px; border: 1px solid #D7D7D7;">
                            </div>
                        </div>
                        <div class="paypersonaldetailsection" style="margin-bottom: 20px;">
                            <div class="paypersonaldetaillabel">배송요청사항</div>
                            <input type="text" id="payaddinputbox3" class="payinputname" style="width: 600px;" placeholder="예: 부제시 경비실에 맡겨주세요.">
                        </div>
                    </div>
                    <div id="payusebpoint">
                        <div class="payitemlist1">
                            <div style="float: left;">적립금 사용</div>
                            
                        </div>
                        <div class="paypersonaldetailsection" style="margin-bottom: 20px;">
                            <div class="paypersonaldetaillabel">적립금</div>
                            <input type="text" class="payinputname" style="float: left;">
                            <div style="float: left; height: 30px; line-height: 30px; margin-left: 5px; margin-right: 10px; font-size: 90%">보유적립금:</div>
                            <div style="height: 30px; line-height: 30px; font-size: 90%;">※ 적립금은 1,000포인트 이상부터 사용 가능합니다.</div>
                        </div>
                    </div>
                    <div id="paymentmethoddetail">
                        <div class="payitemlist1">
                            <div style="float: left;">결제수단 선택</div>
                            
                        </div>
                        <div class="paypersonaldetailsection">
                            <div class="paypaymethod" id="paypaymethod1">신용카드</div>
                            <div class="paypaymethod" id="paypaymethod2">실시간 계좌이체</div>
                            <div class="paypaymethod" id="paypaymethod3">무통장입금</div>
                        </div>
                        <ul style="font-size: 80%; letter-spacing: -2px; position: relative; right: 24px;">
                            <li>실시간 이체 결제시 화면 아래 '결제하기'버튼을 클릭하시면 실시간 이체 결제 창이 나타납니다.</li>
                            <li>실시간 이체 결제 창을 통해 입력되는 고객님의 정보는 128bit로 안전하게 암호화되어 전송되며 승인 처리 후 정보는 승인 성공/ 실패 여부에 상관없이 자동 으로 폐기되므로, 안전합니다.</li>
                            <li>실시간 이체 결제 신청시 승인 진행에 다소 시간이 소요될 수 있으므로 '중지', '새로고침'을 누르지 마시고 결과 화면이 나타 날때까지 기다려 주십시오.</li>
                            <li>신용카드/ 실시간 이체는 결제 후, 무통장입금은 입금확인 후 배송이 이루어집니다.</li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <!--주문요약창-->
            <div id="payviewright">
                <div id="payrighttitle">주문요약</div>
                <div class="payrightdetails">
                    <div class="prdd">총 상품금액</div>
                    <div class="prdn"></div>
                </div>
                <div class="payrightdetails">
                    <div class="prdd">배송비</div>
                    <div class="prdn"></div>
                </div>
                <div class="payrightdetails">
                    <div class="prdd">제주,도서산간배송비</div>
                    <div class="prdn"></div>
                </div>
                <div class="payrightdetails">
                    <div class="prdd">적립금 사용</div>
                    <div class="prdn"></div>
                </div>
                <div class="payrightdetails">
                    <div class="prdd">총 결제금액</div>
                    <div class="prdn"></div>
                </div>
                <input type="button" id="paybutton" value="결제하기" onclick="checkbeforepay()">
            </div>
        </div>
    </form>

<%@ include file="../footer.jsp" %>

