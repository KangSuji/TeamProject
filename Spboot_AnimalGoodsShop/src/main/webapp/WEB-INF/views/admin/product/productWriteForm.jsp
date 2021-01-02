<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>
<div class="productList_base">
<article>
<h1>상품등록</h1>
	<form name="frmm"  enctype="multipart/form-data" method="post">
		<input type="hidden" name="pseq" value="${productVO.pseq}">
		<table id="list">
			<tr>
				<th>상품분류</th>
				<td colspan="2">
					<select name="kind" onchange="itemChange(this.value);">
						<option value="">대분류</option>
			            <option value="1">야외용품</option>
			            <option value="2">패션</option>
			            <option value="3">리빙</option>
			            <option value="4">장난감</option>
			            <option value="5">훈련용품</option>
			            <option value="6">푸드</option>
			            <option value="7">문구·도서</option>
					</select>
				</td>
				<th>상품소분류</th>
				<td colspan="2">
					<select name="subkind" >
						<option value="">소분류</option>
					</select>		
				</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td width="343" colspan="5">
					<input type="text" name="pname" size="99" maxlength="100" ">
				</td>
			</tr>
			<tr>
				<th>원가[A]</th>
				<td width="70"><input type="text" name="price1" size="11" "></td>
				<th>판매가[B]</th>
				<td width="70"><input type="text" name="price2" size="11"></td>
				<th>마진[B-A]</th>
				<td width="72"><input type="text" name="price3" size="11" ></td>
			</tr>
			<tr>
				<th>베스트상품</th>
				<td colspan="2">
						Y<input type="checkbox" name="bestyn" value="y" onclick="oneCheckboxBest(this)">
						N<input type="checkbox" name="bestyn" value="n" onclick="oneCheckboxBest(this)">
				</td>
				<th>사용 유무</th>
				<td colspan="2">
						Y<input type="checkbox" name="useyn" value="y" onclick="oneCheckboxUse(this)">
						N<input type="checkbox" name="useyn" value="n" onclick="oneCheckboxUse(this)">
				</td>
			</tr>
			<tr>
				<th>색상</th>
				<td colspan="2"><input type="text" name="color"></td>
				<th>사이즈</th>
				<td colspan="2"><input type="text" name="size"> </td>
				
			</tr>
			<tr>
				<th>기본상품이미지</th>
				<td colspan="5"><input type="file" name="image1" ></td> 
			</tr>
			<tr>
				<th>상품내용</th>
				<td colspan="5"><input type="file" name="content"></td> 
			</tr>
			<tr>
				<th>서브상품이미지</th>
				<td colspan="5"><input type="file" name="image2"></td> 
			</tr>
		</table>
		<input class="btn" type="button" value="등록" onClick="go_save()">
		<input class="btn" type="button" value="취소" onClick="go_mov()">
	</form>
</article>


</div>
<%@ include file="../../admin/footer.jsp"%>