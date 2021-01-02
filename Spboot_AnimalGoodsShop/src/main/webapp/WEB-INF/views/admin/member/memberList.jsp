<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>
<div class="productList_base">
	<article>
	<h1>회원리스트</h1>
	<form name="frmm" method="post">
			<input type="text" name="key" placeholder="회원이름검색" value="${key}"/>
			<input type="button" value="검색" onclick="go_search_member()"/>
			<input type="button" name="btn_total" value="전체보기" onclick="go_total_member()"/>
			<input type="hidden" name="all_view" value="y"/>
		<br>
		<table id="member_list_table">
			<tr>
				<th>아이디(탈퇴여부)</th><th> 이름 </th><th> 이메일 </th><th width="100px;"> 우편번호 </th><th width="100px;"> 주소 </th>
				<th> 전화 </th><th> 생일 </th><th> 포인트 </th><th> 가입일</th>
			</tr>
			<c:forEach items="${memberList}" var="memberVO">
				<tr><td>${memberVO.id}
					<c:choose>
						<c:when test='${memberVO.useyn== "y"}'>
							<input type="checkbox" name="useyn" disabled="disabled">
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="useyn" checked="checked" disabled="disabled">
						</c:otherwise>
					</c:choose>
					</td>
					<td>${memberVO.name}</td><td>${memberVO.email}</td>
					<td>${memberVO.zip_num}</td><td>${memberVO.address}</td>
					<td>${memberVO.phone}</td><td>${memberVO.birth}</td><td>${memberVO.point}</td>
					<td><fmt:formatDate value="${memberVO.indate}"></fmt:formatDate></td>
				</tr>	
			</c:forEach>
		</table>
		<!-- 페이징들어갈 자리 -->
	</form>
</article>
</div>

<%@ include file="../../admin/footer.jsp"%>