<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
   function go_product_rep(pq_seq){
      	var theForm = document.frmm;
    	theForm.pq_seq.value=pq_seq;
    	theForm.action="admin_product_qna_repsave?pq_seq="+pq_seq;
    	theForm.submit();
   }   
   function go_qna_list() {
    	var theForm = document.frmm;
    	theForm.action="admin_product_qna_list";
    	theForm.submit();
	}
</script>

<article>
<form name="frmm" method="post">
<input type="hidden" name="pq_seq">
   <table id="orderList">
		<tr><th width="100px">제목</th><td>${Product_qnaVO.subject}</td></tr>
		<tr><th>상품번호</th><td>${Product_qnaVO.pseq }</td></tr>
		<tr><th>등록일</th><td><fmt:formatDate value="${Product_qnaVO.indate}" type="date"/> </td></tr>
		
		<tr><th>질문내용</th><td><textarea name="content" rows="10" cols="100" readonly> ${Product_qnaVO.content}</textarea></td></tr>
    </table>
    <table id="orderList">
    		<tr><td colspan="2"><textarea name="reply" rows="5" cols="115"></textarea></tr>
   			<tr>
   				<td style="text-align:center;" colspan="3"><input type="button" class="btn" value="저장" onClick="go_product_rep('${Product_qnaVO.pq_seq}')"></td>
      		</tr>
   			<tr><th style="text-align:center;">답변</th><td><textarea name="reply" rows="5" cols="115" readonly>${Product_qnaVO.reply}</textarea></td></tr>
   			<tr><td style="text-align:center;" colspan="3"><input type="button" class="btn" value="목록" onClick="go_qna_list()"></td></tr>
    </table>
    
</form>
</article>
</body>
</html>