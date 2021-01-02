<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>
<div class="productList_base">
<article id="product_detail">
<h1>상품 상세 보기</h1> 
<form name="frmm" method="post">
<table id="list">
	<tr>
		<th>상품분류</th><td  colspan="2" >${kind}</td>
		<th>상품소분류</th><td colspan="2" >${subkind}</td>
	</tr>        
	<tr><th align="center">상품명</th><td colspan="5">${productVO.pname}</td></tr>
    <tr>
   		<th>원가[A]</th><td width="100">${productVO.price1}원</td><th>판매가[B]</th>
       	<td width="100">${productVO.price2}원</td>
       	<th>마진[B-A]</th><td width="100">${productVO.price3}원</td>	</tr>
       	<tr>
				<th>컬러</th>
				<c:choose>
				<c:when test="${empty ColorList}"><td colspan="2">옵션 없음</td></c:when>
				<c:otherwise><td colspan="2"> ${ColorList} </td></c:otherwise>
				</c:choose>
				<th>사이즈</th>
				<c:choose>
				<c:when test="${empty SizeList}"><td colspan="2">옵션 없음</td></c:when>
				<c:otherwise><td colspan="2"> ${SizeList} </td></c:otherwise>
				</c:choose>
			</tr> 
   	<tr><th>상품 이미지</th>
    	<td colspan="5" align="center">
    		<img src="static/product_images/${productVO.image1}" width="200px">
        </td>
    </tr>
   	<tr><th>상세설명</th>
   		<td colspan="5"><img src="static/product_images/${productVO.content}"height="200px"></td>
   	</tr>
    <tr><th>이미지</th>
    	<td colspan="5" align="center">
    		<img src="static/product_images/${productVO.image2}" height="200px">
        </td>
    </tr>

</table>
<div id="detail_bottom">
    <input class="btn"  type="button" value="수정" onClick="go_mod('${productVO.pseq}')">
    <input class="btn"  type="button" value="목록" onClick="go_mov()">
    <input class="btn"  type="button" value="삭제" onClick="go_delete('${productVO.pseq}')">  
</div>     
</form>
</article>
</div>


<%@ include file="../../admin/footer.jsp"%>