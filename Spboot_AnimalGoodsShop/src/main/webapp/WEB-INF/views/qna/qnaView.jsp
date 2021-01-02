<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header1.jsp"%>
<%@ include file="../member/mypage_sub_menu.jsp"%>

<article>
<form  name="frmm" method="post">
	<div id=bodeum_qna_view_body>
        <h2 style="border-bottom: 2px solid black;">1:1 문의하기</h2>
            <div class="qna_view_textbox">문의제목</div>
                <textarea rows="1" cols="80" name="content" readonly style="margin-top: 10px; resize:none;">${qnaVO.qsubject}</textarea>
               <br>
               <br>
               <br>

        <div class="qna_view_textbox_2">등록일</div><br>
        <textarea rows="1" cols="80" name="content" readonly style="margin-top: 3px; resize:none;"><fmt:formatDate value="${qnaVO.qindate}" type="date"/></textarea>

        <br><br><br>
        <div class="qna_view_textbox_3">문의내용</div><textarea rows="18" cols="80" name="content" readonly style="resize:none;">${qnaVO.qcontent}</textarea>
        <br><br><br>
        <div class="qna_view_textbox_3">답변내용</div><textarea rows="18" cols="80" name="content" readonly style="resize:none;">${qnaVO.qreply}</textarea>





<%--         <table id="bodeum_qna_view_table">
        <tr><th>제목</th></tr>
        <tr><td width="600" style="text-align:left;">${qnaVO.qsubject}</td></tr>
		<tr><th>등록일</th></tr>
		<tr><td align="left" style="text-align:left;">
					<fmt:formatDate value="${qnaVO.qindate}" type="date"/></td></tr>
		<tr><th>질문내용</th></tr>
		<tr><td align="left" style="text-align:left;">
					<pre>${qnaVO.qcontent}</pre></td></tr>
		<tr><th>답변 내용</th></tr>
		<tr><td align="left" style="text-align:left;">${qnaVO.qreply}</tr>
        </table> --%>
        
	</div>

	<div id=bodeum_qna_view_button><input type="button" id="bodeum_qna_view_next_button" value="돌아가기"
	 onclick="location.href='qna_list'"></div>
</form></article>
<%@ include file="../footer.jsp"%>