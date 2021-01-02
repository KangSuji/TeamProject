<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>

<script type="text/javascript">
   function go_rep(qseq){
      	var theForm = document.frmm;
    	theForm.qseq.value=qseq;
    	theForm.action="admin_qna_repsave";
    	theForm.submit();
   }   
   function go_list() {
    	var theForm = document.frmm;
    	theForm.action="admin_qna_list";
    	theForm.submit();
	}
</script>

<article>
<form name="frmm" method="post">
<input type="hidden" name="qseq">
   <table id="orderList">
	<tr><th width="20%">제목</th><td> ${qnaVO.qsubject} </td></tr>
	<tr><th>등록일</th><td> <fmt:formatDate value="${qnaVO.qindate}" type="date"/> </td></tr>
	<tr><th>내용</th><td><textarea name="qcontent" rows="10" cols="100" readonly> ${qnaVO.qcontent}</textarea> </td></tr>
    </table>
   
    <table id="orderList">
    		<tr><td colspan="2"><textarea name="qreply" rows="10" cols="110"></textarea>
    		<br>
   			<input type="button" class="btn" value="저장" onClick="go_rep('${qnaVO.qseq}')">
   			<input type="button" class="btn" value="목록" onClick="go_list()"></td>
   			<tr><th>답변</th><td><textarea name="qreply" rows="10" cols="100" readonly>${qnaVO.qreply}</textarea></td></tr>
    </table><br>

</form>
</article>
<%@ include file="../../admin/footer.jsp"%>