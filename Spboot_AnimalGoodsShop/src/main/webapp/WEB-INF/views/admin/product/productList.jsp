<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>
<div class="productList_base">
<article id="productList_base">
<h1>상품리스트</h1>
<form name="frmm" method="post">
       <input type="text" name="key" placeholder="상품이름검색" value="${key}"/>
       <input type="button"  value="검색" onclick="go_search_product()" />
       <input type="button" value="전체보기" onclick="view_all_prodcut()"/>
       <input type="button" value="상품등록" onclick="go_write()"/>
       <input type="hidden" name="all_view" value="y"/> 
    <table id="product_list_head">
        <tr>
        	<th>번호</th><th>상품명</th><th>원가</th><th>판매가</th><th>등록일</th><th>사용유무</th>
        </tr>
        <c:choose>
        	<c:when test="${productListSize<=0}">
	    		<tr>
	      			<td width="100%" colspan="7" align="center" height="23">등록된 상품이 없습니다.</td>      
	    		</tr>
    		</c:when>
    	<c:otherwise>
	    	<c:forEach items="${productList}" var="productVO">
		        <tr>
		            <td>${productVO.pseq}</td>
		            <td><a href="#" onClick="go_detail('${productVO.pseq}')">${productVO.pname}</a></td>
		            <td><fmt:formatNumber value="${productVO.price1}"/></td>
		            <td><fmt:formatNumber value="${productVO.price2}"/></td>
		            <td><fmt:formatDate value="${productVO.indate}"/></td>
		            <td>
		            	<c:choose>
		            		<c:when test='${productVO.useyn==n}'>미사용</c:when>
		            		<c:otherwise>사용</c:otherwise>
		            	</c:choose>
		            </td>
		        </tr>
		     </c:forEach> 
	    </c:otherwise>
        </c:choose>
    </table>
</form>
<jsp:include page="../../admin/paging/admin_product_paging.jsp">
	<jsp:param value="${paging.page}" name="page"/>
	<jsp:param value="${paging.beginPage}" name="beginPage"/>
	<jsp:param value="${paging.endPage}" name="endPage"/>
	<jsp:param value="${paging.prev}" name="prev"/>
	<jsp:param value="${paging.next}" name="next"/>
</jsp:include>
</article> 
</div>
<%@ include file="../../admin/footer.jsp"%>