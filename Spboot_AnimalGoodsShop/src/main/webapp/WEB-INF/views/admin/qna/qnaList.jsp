<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>

<script type="text/javascript">
function go_view(qseq){
	var theForm = document.frmm;
    theForm.action = "admin_qna_detail?qseq=" + qseq;
    theForm.submit();
}
</script>
<article>
<form name="frmm" method="post">
	<div id=qna_answer_base>
        <h2> 1:1 문의하기 </h2>
        <table id="qna_answer_table">
        <tr style="text-align: center">	<th>문의유형</th>  <th>문의제목</th> <th>작성일</th> <th>작성자</th> <th>문의상태</th> </tr>
        <c:forEach items="${qnaList}" var="qnaVO">
        <tr>  
       		<td>${qnaVO.qtype}</td>    
    
       		<td><a href="#"onClick="javascript:go_view('${qnaVO.qseq}')">${qnaVO.qsubject}</a></td>
       		<td><fmt:formatDate value="${qnaVO.qindate}" type="date"/></td>
       		<td>${qnaVO.mid}</td>
       		<td><c:choose>
				<c:when test="${qnaVO.qrep==1}"> 답변 대기중 </c:when>
				<c:when test="${qnaVO.qrep==2}"> 답변 완료 </c:when>
			</c:choose></td>    
   		</tr>
   		</c:forEach>
        </table>
    </div>
</form>

<br>
<jsp:include page="../../admin/paging/admin_qna_paging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
</jsp:include>

</article>
<%@ include file="../../admin/footer.jsp"%>
