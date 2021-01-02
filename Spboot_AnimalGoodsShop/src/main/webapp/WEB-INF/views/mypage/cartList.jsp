<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp"%>
<form name="frrmm" method="post">
    <div id="shopping_cart_base">
      <div id="shopping_cart_left">
          <div id="shopping_cart_title">
              <div id="shopping_cart_title_1">장바구니</div><br>
              <div id="shopping_cart_title_2">개별 배송 상품</div>
            </div>
          <table id="shopping_cart_list_table">
              <tr style="background: #f3f3f3;">
               
                <td style="width: 120px;">이미지표시</td>
                <td>상품정보</td>
                <td>상품금액</td>
                <td>배송비</td>
                <td>삭제</td>
              </tr>
              <c:forEach items="${cartList}" var="cartVO">
              <tr>
                
                <td><img src="static/product_images/${cartVO.image}"></td> 
                <td id="shopping_cart_list_text">
                   <a href="#">${cartVO.pname}<c:if test="${cartVO.pcolor!=null}">/${cartVO.pcolor}</c:if><c:if test="${cartVO.psize!=null}">/${cartVO.psize}</c:if></a><br>
                    <select id="shopping_cart_select_box">
                       <c:forEach  begin="1" end="12" step="1" var="index">
           
	    <c:choose>
	        <c:when test="${cartVO.quantity==index}"><option value="${index}" selected> ${index}</option></c:when>
	        <c:otherwise><option value="${index}"> ${index}</option></c:otherwise>
	    </c:choose>
	</c:forEach>
                      </select>
                </td> 
                <td>${cartVO.price2*cartVO.quantity}원</td> 
                <td>무료배송</td> 
                <td><input type="button" name="cseq" value="X" class="shopping_cart_delete_btn" onClick="go_cart_delete('${cartVO.cseq}');"> 
                </td> 
              </tr>
              </c:forEach>
          </table>
          
          <span id="shopping_cart_warning_text">※ 묶음 배송이 불가한 상품으로 상품별로 배송비가 추가됩니다.<br>
                ※ 제주, 도서산간인 경우 각 상품별로 배송비가 추가됩니다.<br>
                ※ 제주도 0원, 제주도 외 도서산간 0원</span>
                <div id="cart_page_paging">
            <jsp:include page="../paging/paging_cart.jsp">
    		<jsp:param value="${paging.page}" name="page"/>
    		<jsp:param value="${paging.beginPage}" name="beginPage"/>
    		<jsp:param value="${paging.endPage}" name="endPage"/>
    		<jsp:param value="${paging.prev}" name="prev"/>
    		<jsp:param value="${paging.next}" name="next"/>
			</jsp:include>
        </div>
      </div>
      
      <div id="shopping_cart_right">
          <div id="shopping_cart_right_title">주문요약</div>
          <div id="shopping_cart_sum_price">
              <div id="shopping_cart_price_title">총 상품금액</div>
              <div id="shopping_cart_price_area">${totalPrice}원</div>
          </div>
          <div id="shopping_cart_delivery_price">
              <div id="shopping_cart_delivery_title">배송비</div>
              <div id="shopping_cart_delivery_price_area">0원</div>
          </div>
          <div id="shopping_cart_total_price">
              <div id="shopping_cart_total_title">총 결제금액</div>
              <div id="shopping_cart_total_price_area">${totalPrice}원</div>
          </div>
          <div id="shopping_cart_order_btn">
              <input type="button" value="주문하기" id="shopping_cart_order_button">
          </div>
          <div id="shopping_cart_more_shopping">
              <input type="button" value="쇼핑 계속하기" id="shopping_cart_more_shopping_btn">
          </div>
      </div>
      
    </div>
    
    
    
</form> 

<%@ include file="../footer.jsp"%>