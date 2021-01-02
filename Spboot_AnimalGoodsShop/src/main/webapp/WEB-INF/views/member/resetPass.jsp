<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header1.jsp"%>
<br>
	<br>
	<br>
	<br>
	
<form name="frmm" method="post">
    <div class="resetpass_body_side">
		<input type="hidden" name="mid" value="${findPass.id}">
	
		<br><h2>정보가 확인 되었습니다<br>아래에 수정할 비밀번호를 입력하세요</h2><br>
			<table style="width:630px;height:50px; border-bottom: 0px">
				<tr ><td align="right"><label for="pwd">비밀번호</label></td>
                    <td style="border: 1px solid grey;"><input type="password" name="mpwd" size="30"></td>
					<td align="center" rowspan="2">
					<input type="button" id="resetpass_button" value="비밀번호 재설정" style="width: 120px; height:65px;" 
																				onclick="pass_check();"></td>
				</tr>	
				<tr><td align="right"><label for="pwd_check" >비밀번호확인</label></td>
					<td style="border: 1px solid grey;"><input type="password" name="mpwd_check" size="30" >
                        </td>
				</tr>
			</table>
			<br><span style="color:red; font-size: 10px;">${message}</span>
    </div>
	</form>
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