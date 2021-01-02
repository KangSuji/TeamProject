<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>member_id_overlap_check_popup</title>
    <style type="text/css">
        body{padding: 50px; box-sizing: border-box;}
/*        .member_id_overlap_check_body {display: none; position: fixed; left: 50%; top: 50%; z-index: 100; width: 600px;height: 400px;transform: translate(-50%, -50%); background: #fff; box-sizing: border-box; }*/
        
        .member_id_overlap_check_dim {display: contents; position: fixed; left: 0; top: 0; z-index: 99; width: 100%; height: 100%; background: rgba(0,0,0,0.5); }
        
        .member_id_overlap_check_body h2 {font-size: 36px; color: #061f5d; text-align: center;  border-bottom: 3px solid #444;padding-bottom: 20px;}
        .member_id_overlap_check_body .id_overlap_check_body_side {padding:  10px ;}

        .member_id_overlap_check_space{}
        
        table .member_id_overlap_check_space th {font-size: 15 px; color: #222; text-align: left; font-weight: normal;}
        
        .overlap_user_id_check_box{position: relative; width:90px; height:50px; border: 1px solid black; float: right; text-align:center; line-height:50px; background: white; left: 100%}
        .overlap_user_id_check_box:hover{background: #231816; color: white;}
        
        input[type=text]{width:150% ; height: 48px; font-size: 15px; color: #373737; border: 1px solid #e9e9e9; background: #fff; text-decoration: none; vertical-align: middle; border-radius: 3px; }
        .member_id_overlap_check_body th {padding-right: 50px;}
        
        #use_member_id_button {display: inline-block; width: 170px; height: 50px; line-height: 50px; text-align: center;  background: #061f5d; color: #fff;border-radius: 3px; margin-right:20px; cursor: pointer; }

        #member_id_overlap_check_bottom_space{text-align: center;cursor: pointer; }
        a {text-decoration: none; }
        a:link{text-decoration: none; }
    </style>
    <script type="text/javascript" src="member/member.js"></script>
    <script type="text/javascript">
    function idok(){
    	opener.frmm.mid.value=document.frmm.mid.value;
    	opener.frmm.reid.value=document.frmm.mid.value;
    	self.close();
    }
    </script>
</head>
<body>
<form method="post" name="frmm" action="idcheck">
<div class="member_id_overlap_check_body">
   <div class="id_overlap_check_body_side">
    <h2>아이디 중복확인</h2>
    <table class="member_id_overlap_check_space">아이디는 영문, 숫자 포함 4~10자 이내로 입력해주세요.<br><br></table>
    <table class="member_id_overlap_check_space">
        <tr>          
            <td><input type="text" style="width:200px; margin-left: 45%" name="mid" value="${mid}"></td>
            <th>
            <input type="submit" value="중복확인" class="overlap_user_id_check_box">

            </th>

        </tr>

    </table>
            
            <br><c:if test="${result==1}">
			<script type="text/javascript">
			 	opener.document.frmm.mid.value="";
			</script>
			${mid}는 이미 사용중인 아이디입니다.
		</c:if>
		<c:if test="${result==0}">
			${mid}는 사용 가능한 아이디 입니다.
			<div id="member_id_overlap_check_bottom_space">

        <input type="button" id="use_member_id_button" value="사용하기" onclick="idok()">

    </div>  
		</c:if>
    
    </div>
    
</div>
<div class="member_id_overlap_check_dim"></div>
</form>
</body>
</html>