<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<form name="frmm">
    <div id="product_page_base">
    <c:choose>
    	<c:when test="${empty key}">
    	 <c:choose>
    	<c:when test="${empty subkindword}">
        	<div id="product_page_head"><p>HOME&nbsp;>&nbsp;${kindword}</p></div>
        </c:when>
        <c:otherwise>
        	<div id="product_page_head"><p>HOME&nbsp;>&nbsp;${kindword}>&nbsp;${subkindword}</p></div>
        </c:otherwise>
    </c:choose>
        <div id="product_page_title">
         <c:choose>
    	<c:when test="${empty subkindword}">
            <div id="page_title_area">${kindword}</div>
         </c:when>
         <c:otherwise>
          <div id="page_title_area">${subkindword}</div>
        </c:otherwise>
         </c:choose>
        </div>
    	</c:when>
    	<c:otherwise>
    	
    	</c:otherwise>
    </c:choose>
   
        <div id="product_sort_lineup">
            <div id="product_sort_lineup_area">
                    <div class="lineup_text" style="margin-left: 0px;"><a href="product_list?kind=${kind}&subkind=${subkind}&product_sub_menu=1&key=${key}">최근 등록 순&nbsp;&nbsp;&nbsp;|</a></div>
                    <div class="lineup_text"><a href="product_list?kind=${kind}&subkind=${subkind}">낮은 가격 순&nbsp;&nbsp;&nbsp;|</a></div>
                    <div class="lineup_text"><a href="product_list?kind=${kind}&subkind=${subkind}">높은 가격 순&nbsp;&nbsp;&nbsp;|</a></div>
                    <div class="lineup_text"><a href="product_list?kind=${kind}&subkind=${subkind}">상품평 순</a></div>
            </div>
        </div>
        <div id="product_area">
         <c:forEach items="${productList}" var="productVO">
            <div class="product">
                <a href="product_detail?pseq=${productVO.pseq}"><div class="product_img"><img src="static/product_images/${productVO.image1 }" width="315px" height="315px"></div>
                <div class="product_title">${productVO.pname }</div>
                <div class="product_price">${productVO.price2}</div></a>
                
            </div>
         </c:forEach> 
        </div>
        
        <div id="product_page_paging">
            <jsp:include page="../paging/paging_product.jsp">
    		<jsp:param value="${paging.page}" name="page"/>
    		<jsp:param value="${paging.beginPage}" name="beginPage"/>
    		<jsp:param value="${paging.endPage}" name="endPage"/>
    		<jsp:param value="${paging.prev}" name="prev"/>
    		<jsp:param value="${paging.next}" name="next"/>
			</jsp:include>
        </div>
    </div>
</form>
<%@ include file="../footer.jsp"%>