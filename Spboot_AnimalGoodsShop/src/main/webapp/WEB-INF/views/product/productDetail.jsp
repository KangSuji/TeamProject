<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<form name="formm" method="post">
<input type="hidden" name="pseq" value="${productVo.pseq}">
<br>
<br>
<br>
<div id="product_detail_base">
   
    <div id="detail_left_area">
        <div id="product_detail_img_area">
            <div class="box_img" id="button_img1"><img src="static/product_images/${productVo.image1 }" width="50px;"></div>
            <div class="main_detail_img" id="view_img1"><img src="static/product_images/${productVo.image1 }" width="550px;"></div>
            <div class="box_img" id="button_img2"><img src="static/product_images/${productVo.image2 }" width="50px;"></div>
            <div class="main_detail_img" id="view_img2"><img src="static/product_images/${productVo.image2 }" width="550px;"></div>
        </div>
       
        <div id="detail_content">
            <img src="static/product_images/${productVo.content}">
        </div>
        <div id="comment_area">
            <div id="comment_title" ><h2>상품후기</h2></div>
            <div class="comment_content_area"id="comment_content_area_1">
                <div class="comment_txt">디자인 넘 맘에 들어 주문했는데 기능까지 괜춘해요. 역시 비싼값을 하네요...</div>
                <div class="comment_option">선택 : Top Rope Collar , 컬러 : Sunset 선셋 , 사이즈 : M</div>
                <div><span class="userID">userID</span><span class="write_date"> write_date</span></div>
            </div>
            <div class="comment_detail" id="comment_detail_1">
                <div>일단... 너무 예뻐요 ㅠㅠㅠ 엉엉 교육용으로 목줄이 필요해서 M 구매했는데 12킬로 진도믹스 아이에게 잘 맞아요. 그리고 반사판(?) 기능이 있어 밤에도 보이는 부분이 있어서 좋고 차고 뺄 때 딸깍 거리는 소리가 안나는 점도 좋네요. 생각보다 편해하기도 해서 대만족입니다. 가격대가 있어 고민했지만...</div>
                <img src="static/images/best1.png">
            </div>
            <div id="comment_more_content"></div>
            <div id="more_comment_btn_area">
                <div id="more_comment_btn"><a href="#">더보기</a></div>
            </div>
            
        </div>
         <div id="qna_area">
             <div id="qna_title_area" >
                 <div id="qna_title"><h2>상품Q&amp;A</h2></div>
                 
                 <div id="go_qna_write_form" onclick="qna_write_from('${loginUser.id}')">
                     <a href="#">문의하기</a>
                 </div>
            
             </div>
           
             <c:choose>
            	<c:when test="${Product_Qna_List.size()==0}">
            	<div class="qna_content_base"><br>질문이 비어있습니다.</div>
            	</c:when>
            	<c:otherwise>
             <c:forEach items="${Product_Qna_List}" var="product_qnaVo">
             
             
                <div class="qna_content_area">
                     <div class="qna_detail_title">${product_qnaVo.kind }</div>
                     <div id="qna_head"><!--클릭하면 문의사항 보이게-->
                         <span class="userID">${product_qnaVo.id}</span><span class="write_date"> ${product_qnaVo.indate }</span>
                         <c:choose>
                         <c:when test="${product_qnaVo.rep=='1'}">
                         	<span style="color:grey; float:right;">답변없음</span>
                         </c:when>
                         <c:otherwise>
                         	<span style="color:skyblue; float:right;">답변완료</span>
                         </c:otherwise>
                   
                         </c:choose>
                     </div>
                 </div>
                 <div class="qna_detail_body" id="qna_detail_body_1">
                     <div class="ask_area">
                         <span class="qna_ask_img">${product_qnaVo.subject }</span>&nbsp;<br>※ 개인정보(주민번호, 연락처, 계좌번호, 카드번호 등)가 포함되지 않도록 유의해 주세요.
                         <div class="ask_text">${product_qnaVo.content }</div>
                     </div>
                     
                     <div class="answer_area">
                         <span class="qna_answer_img">답변</span>
                         <div class="answer_text">${product_qnaVo.reply }</div>
                     </div>
                 </div>
             
            </c:forEach>
            </c:otherwise>
             </c:choose>
             
        </div>

         <div class="qna_dim"></div>
       
        
    
        
    </div>
    
    
    
    <!--장바구니-->
    <div id="detail_right_area">
       <div class="cart_prodcut">
            <table id="cart_prodcut_table">
                <tr style="height: 20px;">
                    <th colspan="2"><span style="width: 34px; height: 20px; background: yellow; text-align: center;">New</span></th>
                </tr>
                <tr>
                    <th colspan="2" id="product_title">${productVo.pname }</th>
                </tr>
                <tr>
                    <th>판매가</th>
                    <td ><span id="product_detail_price2">${productVo.price2}</span>원</td>
                </tr>
                <tr>
                    <th>적립금</th>
                    <td><fmt:parseNumber var ="price2" value="${productVo.price2/100}" integerOnly="true"/>${price2 }원</td>
                </tr>
                <tr style="border-bottom: 1px solid #e8e8e8">
                    <th>배송비</th>
                    <td>무료</td>
                </tr>
                <tr>
                    <th colspan="2">옵션선택</th>
                </tr>
                <c:choose>
                <c:when test="${empty ColorList  && empty SizeList}">
                <tr>
                    <td colspan="2">
                        <select id="selectBox_3" onchange="optionselect3(this,1)" name="product_option">
                            <option value="">옵션</option>
                            <option value="${productVo.pname}">${productVo.pname}</option>
                        </select> 
                    </td>
                </tr>
         
                </c:when>
                <c:otherwise>
                	<input type="hidden" name="product_option" value="noneValue"/>
                </c:otherwise>
                </c:choose>
                <c:choose>
                <c:when test="${empty ColorList}">
                	<input type="hidden" name="color" value="noneValue"/>
                </c:when>
                <c:otherwise>
                 <tr>
                    <td colspan="2">
                        <select id="selectBox_1" onchange="optionselect1(this,1)" name="color">
                            <option value="">색상</option>
                            <c:forEach items="${ColorList}" var="color">
                            <option value="${color}">${color}</option>
                            </c:forEach>
                          
                        </select> 
                    </td>
                </tr>
                </c:otherwise>
                </c:choose>
                <c:choose>
               	<c:when test="${empty SizeList}">
                	<input type="hidden" name="size" value="noneValue"/>
                </c:when>
                <c:otherwise>
                <tr>
                    <td colspan="2">
                        <select id="selectBox_2" onchange="optionselect2(this,1)" name="size">
                            <option value="">사이즈</option>
                            <c:forEach items="${SizeList}" var="size">
                            <option value="${size}">${size}</option>
                            </c:forEach>
         
                        </select> 
                    </td>
                </tr>
                </c:otherwise>
                </c:choose>
                <tr id="layer_1" style="background: #F0F4F9; width: 400px; height: 100px; text-align: left; ">
                    <td colspan="2">
                    <div id="select_options" >
                        <div class="option_view" id="option_view1"></div>
                        <div class="option_view" id="option_view2"></div>
                        <div class="option_view" id="option_view3"></div>
                        <input type="button" value="X" id="close_btn">
                        <div>
                        <div id="quantity_select_label">수량 : </div>
                            <select name="quantity" id="quantsel" style="width:70px; position: relative; right: 260px; height: 20px;" onchange="changetotalcost(this.value)">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                            </select>
                        </div>
                    </div>
                    </td>
                </tr>
                <tr id="total_cost">
                    <th>총상품금액</th>
                    <td style="color: navy; font-size: 20px;" id="totalcostamount">${productVo.price2 }원</td>
                </tr>
            </table>
            <div id="btn_center">
                <div id="submit_btn" onclick="go_pay();"><a href="#">결제하기</a></div>
                <div id="go_cart_btn" onclick="go_cart();"><a href="#">장바구니</a></div>
            </div>
        </div>  
    </div>    
    
    
    
</div>
</form>
<form name="product_qna_form" method="post" action="product_qna_write?pseq=${productVo.pseq}">
 <div id="qna_write_from">
<%--  <input type="hidden" name="command" value="product_qna_write">
 <input type="hidden" name="pseq" value="${productVo.pseq}"> --%>
            <table id="qna_write_from_table">
                <tr>
                    <th><label>문의유형</label></th>
                </tr>
                <tr>
                   <td>
                        <select id="qna_kind" name="qna_kind">
                            <option value="">선택하세요.</option>
                            <option value="배송문의">배송문의</option>
                            <option value="상품문의">상품문의</option>
                            <option value="주문/결제">주문/결제</option>
                            <option value="취소문의">취소문의</option>
                            <option value="반품/환불">반품/환불</option>
                            <option value="교환문의">교환문의</option>
                            <option value="기타문의">기타문의</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th><label for="qna_email">아이디</label></th>
                </tr>
                <tr>
                    <td><input type="text" name="qna_id" id="qna_email" value="${loginUser.id}" readonly="readonly"></td>
                </tr>
                <tr>
                    <th><label for="qna_phone">휴대전화</label></th>
                </tr>
                <tr>
                    <td>
                     <input type="text" name="qna_phone" id="qna_email" value="${loginUser.phone}" readonly="readonly"></td>
                         
            
                </tr>
                <tr>
                    <th><label for="">제목</label></th>
                </tr>
                <tr>
                    <td><input type="text" name="qna_subject" style="width: 100%;"></td>
                </tr>
                <tr>
                    <th><label for="">내용</label></th>
                </tr>
                <tr>
                    <td>
                        <textarea name="qna_content"></textarea>
                    </td>
                </tr>
                
            </table>
                <div id="qna_btn_center">
                    <!-- <input type="button" id="qna_submit_btn" value="등록"  onclick="qna_product_write();"> -->
                    <div id="qna_submit_btn" onclick="qna_product_write();">등록</div>
                    <input type="reset"  id="qna_close_btn" value="취소">
                </div>  
          
        </div>
 </form>
<%@ include file="../footer.jsp"%>