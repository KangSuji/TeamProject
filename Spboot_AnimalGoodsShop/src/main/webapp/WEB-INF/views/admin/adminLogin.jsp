<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
        body{margin: 0%;}
        .clear {clear: both;}
        #header_base{position: relative; width: 100%; height: 150px; top: 0%; border: 1px solid black;text-align: center;}
        #header{position: relative; width: 50%; height: 150px; margin: 0 auto; text-align: center;line-height: 150px; }
        
        
        #loginform{position: relative; width: 50%; background: white;margin: 0 auto;text-align: center;}
        #form_center table{margin: 0 auto;text-align: center; padding: 20px; }
        #form_center
    </style>
    <script type="text/javascript">
		function admin_check(){
			  if(document.frm.adminId.value==""){
			      	alert("아이디를 입력하세요.");
			      	return false;
			  }else if(document.frm.adminPwd.value==""){
			     	alert("비밀번호를 입력하세요.");
			      	return false;
			  }
			  return true;  
		}
</script>
</head>
<body>
<header>
    <div id="header_base">
        <div id="header">
                <img src="static/images/logo.png">  
        </div>
    </div>
    </header><div class="clear"></div>
    <article>
	<div id="loginform">
		<form name="frm" method="post" action="admin_login">
		    <div id="form_center">
                <table>
                    <tr><td>아 이 디</td><td>
                        <input type="text" name="adminId" size="10"></td></tr>
                    <tr><td>비밀번호</td>
                        <td><input type="password" name="adminPwd" size="10"></td></tr>
                    <tr align="center" >
                        <td  colspan="2">
                            <input class="btn" type="submit" value="업무 로그인" onClick="return admin_check();">
                            <br><br>
                            <h4 style="color:red">${message}</h4>
                        </td>
                    </tr>
                </table>
			</div>
		</form>
	</div>
</article>
</body>
</html>