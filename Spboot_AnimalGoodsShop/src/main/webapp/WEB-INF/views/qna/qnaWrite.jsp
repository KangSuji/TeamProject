<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header1.jsp"%>
<%@ include file="../member/mypage_sub_menu.jsp"%>
<article>
<form name="frmm" method="post">

    <div id=bodeum_qna_write_body>
        <h2 style="border-bottom: 2px solid black;">1:1 문의하기</h2>
            <div class="qna_write_textbox">문의 유형</div>
                <div class="qna_write_small_box">
                <select name="qtype" style="width:200px; height:20px; border:1px; font-size:12px;">
                    <option value="배송문의">배송문의</option>
                    <option value="상품문의">상품문의</option>
                    <option value="주문/결제">주문/결제</option>
                    <option value="취소문의">취소문의</option>
                    <option value="반품/환불">반품/환불</option>
                    <option value="교환문의">교환문의</option>
                    <option value="기타문의">기타문의</option>
                </select>

            </div>
               <br>
               <br>
               <br>

        <div class="qna_write_textbox_2" >문의제목</div><br><input type="text" name="qsubject"  size="78" style="border:1px solid grey"><br><br><br>
        <div class="qna_write_textbox_3">문의내용</div><textarea rows="18" cols="80" name="qcontent"></textarea>
    </div>
    
    <div id=qna_write_view_button>
    <input type="button"  value="등록"     class="qna_write_next_button" onclick="qna_check();">
    <input type="reset"   value="취소"     class="qna_write_next_button">
    </div>

</form>
</article>
<%@ include file="../footer.jsp"%>