<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header1.jsp"%>
<%@ include file="../member/mypage_sub_menu.jsp"%>

<article>
<form  name="frmm" method="post">
    <div id=bodeum_qna_body>
        <h2> 1:1 문의하기 </h2>
        <table id="bodeum_qna_table">
        <tr>	<th>문의유형</th> <th>문의제목</th>  <th>내용</th> <th>등록일</th> <th>문의상태</th> </tr>
        <c:forEach items="${qnaList}"  var="qnaVO">
	        <tr>  
	        	<td>${qnaVO.qtype}</td>
	       		<td><a href="qna_view?qseq=${qnaVO.qseq}">${qnaVO.qsubject}</a></td>    
	    		
	       		<td>${qnaVO.qcontent}</td>
	       		<td><fmt:formatDate value="${qnaVO.qindate}" type="date"/></td>
 				<td><c:choose>
					<c:when test="${qnaVO.qrep==1}"> 답변 대기중 </c:when>
					<c:when test="${qnaVO.qrep==2}"> 답변 완료 </c:when>
				</c:choose></td>
	   		</tr>
   		</c:forEach>
        </table>
    </div>
    <div id=bodeum_qna_button>
    <input type="button" id="bodeum_qna_next_button" value="글쓰기"
    onclick="location.href='qna_write_form'">

    </div>
</form></article>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<%@ include file="../footer.jsp"%>