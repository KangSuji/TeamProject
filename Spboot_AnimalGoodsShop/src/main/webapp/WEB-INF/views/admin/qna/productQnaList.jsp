<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
        
	#qna_answer_base{position: relative; width: 1000px;  margin: 0 auto;text-align: left;}
	#qna_answer_base table{width: 1200px; border-collapse: collapse;
	    text-align: center; margin-top: 10px; margin-bottom:20px; border: 1px solid #e8e8e8;}
	#qna_answer_base tr,th,td{border-bottom: 1px solid #e8e8e8;}
	#qna_answer_base td{text-align:center;border:1px solid #f3f3f3;}
	#qna_answer_base th{background: #f3f3f3;margin-right:10px;}
	#qna_answer_base tr,th{height: 20px;}
	#qna_answer_table{}
        
</style>

</head>
<body>
<script type="text/javascript">
function go_qna_view(pq_seq){
	var theForm = document.frmm;
    theForm.action = "admin_product_qna_detail?pq_seq=" + pq_seq;
    theForm.submit();
}
</script>
<article>
<form name="frmm" method="post">
	<div id=qna_answer_base>
        <h2> 상품별 문의 </h2>
        <table id="qna_answer_table">
        <tr>	<th>문의유형</th><th>상품번호</th> <th>문의제목</th> <th>작성일</th> <th>작성자</th> <th>문의상태</th> </tr>
        <c:forEach items="${product_qnaList}" var="Product_qnaVO">
        <tr>  
       		<td>${Product_qnaVO.kind}</td>          
       		<td>${Product_qnaVO.pseq}</td>
       		<td><a href="#"onClick="javascript:go_qna_view('${Product_qnaVO.pq_seq}')">${Product_qnaVO.subject}</a></td>
       		<td><fmt:formatDate value="${Product_qnaVO.indate}" type="date"/></td>
       		<td>${Product_qnaVO.id}</td>
       		<td><c:choose>
				<c:when test="${Product_qnaVO.rep==1}"> 답변 대기중 </c:when>
				<c:when test="${Product_qnaVO.rep==2}"> 답변 완료 </c:when>
			</c:choose></td>    
   		</tr>
   		</c:forEach>
        </table>
    </div>
</form>
<br>
<jsp:include page="../../admin/paging/admin_product_qna_paging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
</jsp:include>
</article>
<%@ include file="../../admin/footer.jsp"%>
