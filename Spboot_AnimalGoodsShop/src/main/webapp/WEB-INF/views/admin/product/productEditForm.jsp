<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>
<div class="productList_base">
<article>
<h1>상품수정</h1>
	<form name="frmm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pseq" value="${productVO.pseq}">
		<input type="hidden" name="nonmakeImg1" value="${productVO.image1}">
		<input type="hidden" name="nonmakeImg2" value="${productVO.image2}">
		<input type="hidden" name="nonmakecontent" value="${productVO.content}">
		<table id="list">
			<tr>
				<th>상품분류</th>
				<td colspan="2">
					<select name="kind" onchange="itemChange(this.value);">
						<c:forEach var="kind" items="${kindList1}" varStatus="status">
								<c:choose>
									<c:when test="${kind==''}">
									</c:when>
									<c:when test="${productVO.kind==status.index}">
										<option value="${status.index}" selected="selected">${kind}</option>
									</c:when>
									<c:otherwise>
										<option value="${status.index}">${kind}</option>
									</c:otherwise>
								</c:choose>
						</c:forEach>
					</select>
				</td>
				<th>상품소분류</th>
				<td colspan="2">
					<select name="subkind">
						<c:forEach items="${subkindList}" var ="subkindVO" varStatus="status">
						<c:choose>
						<c:when test="${subkindVO==''}">
						
						</c:when>
			
						<c:when test="${productVO.subkind==status.index}">
										<option value="${status.index}" selected="selected">${subkindVO}</option>
									</c:when>
									<c:otherwise>
										<option value="${status.index}">${subkindVO}</option>
									</c:otherwise>
						</c:choose>
							
						</c:forEach>
							
					</select>
				
				
				</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td width="343" colspan="5">
					<input type="text" name="pname" size="99" maxlength="100" value="${productVO.pname}">
				</td>
			</tr>
			<tr>
				<th>원가[A]</th>
				<td width="70"><input type="text" name="price1" size="11" value="${productVO.price1}"></td>
				<th>판매가[B]</th>
				<td width="70"><input type="text" name="price2" size="11" value="${productVO.price2}"></td>
				<th>마진[B-A]</th>
				<td width="72"><input type="text" name="price3" size="11" value="${productVO.price3}"></td>
			</tr>
			<tr>
				<th>컬러</th>
				<c:choose>
				<c:when test="${empty ColorList}"><td colspan="2">옵션 없음</td></c:when>
				<c:otherwise><td colspan="2"><input type="text" name="color" value=" ${ColorList}"> </td></c:otherwise>
				</c:choose>
				<th>사이즈</th>
				<c:choose>
				<c:when test="${empty SizeList}"><td colspan="2">옵션 없음</td></c:when>
				<c:otherwise><td colspan="2"><input type="text" name="size" value="${SizeList}"> </td></c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th>베스트상품</th>
				<td colspan="2">
					<c:choose>
						<c:when test='${productVO.bestyn=="y"}'>
								Y<input type="checkbox" name="bestyn" value="y" checked="checked" onclick="oneCheckboxBest(this)">
								N<input type="checkbox" name="bestyn" value="n" onclick="oneCheckboxBest(this)">
						</c:when>
						<c:otherwise>
							Y<input type="checkbox" name="bestyn" value="y" onclick="oneCheckboxBest(this)">
							N<input type="checkbox" name="bestyn" value="n" checked="checked" onclick="oneCheckboxBest(this)">
						</c:otherwise>
					</c:choose>
				</td>
				<th>사용유무</th>
				<td colspan="3">
					<c:choose>
							<c:when test='${productVO.useyn=="y"}'>
								Y<input type="checkbox" name="useyn" value="y" checked="checked" onclick="oneCheckboxUse(this)">
								N<input type="checkbox" name="useyn" value="n" onclick="oneCheckboxUse(this)">
							</c:when>
							<c:otherwise>
								Y<input type="checkbox" name="useyn" value="y" onclick="oneCheckboxUse(this)">
								N<input type="checkbox" name="useyn" value="n" checked="checked" onclick="oneCheckboxUse(this)">
							</c:otherwise>
						</c:choose>
				</td>
			</tr>
			<tr>
				<th>상품이미지</th>
				<td colspan="5"><img src="static/product_images/${productVO.image1}"
					width="200px"> <br>
				<input type="file" name="image1"></td> 
			</tr>
			<tr>
				<th>상품이미지</th>
				<td colspan="5"><img src="static/product_images/${productVO.content}"
					height="200px"> <br>
				<input type="file" name="content"></td> 
			</tr>
			<tr>
				<th>상품이미지</th>
				<td colspan="5"><img src="static/product_images/${productVO.image2}"
					width="200px"> <br>
				<input type="file" name="image2"></td> 
			</tr>
		</table>
		<input class="btn" type="button" value="수정" onClick="go_mod_save('${productVO.pseq}')">
		<input class="btn" type="button" value="취소" onClick="go_mov()">
	</form>
</article>
</div>




<%@ include file="../../admin/footer.jsp"%>