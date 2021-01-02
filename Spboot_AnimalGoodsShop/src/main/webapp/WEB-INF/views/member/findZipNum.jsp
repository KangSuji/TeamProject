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
        body{padding: 10px; box-sizing: border-box;}
/*        .member_add_check_body {display: none; position: fixed; left: 50%; top: 50%; z-index: 100; width: 600px;height: 400px;transform: translate(-50%, -50%); background: #fff; box-sizing: border-box; }*/
        
        .member_add_check_dim {display: contents; position: fixed; left: 0; top: 0; z-index: 99;background: rgba(0,0,0,0.5); }
        
        .member_add_check_body h2 {font-size: 36px; color: #061f5d; text-align: center;  border-bottom: 3px solid #444;padding-bottom: 20px;}
        
        .member_add_check_body_side {padding:  40px ;}

        .member_add_check_space{}
        
        table .member_add_check_space th {font-size: 15 px; color: #222; text-align: left; font-weight: normal;}
        
        .member_add_check_box{position: relative; width:90px; height:50px; border: 1px solid black; float: right;  line-height:50px; background: white; left: 45%}
        .member_add_check_box:hover{background: #231816; color: white;}
        
        input[type=text]{width:150% ; height: 48px; font-size: 15px; color: #373737; border: 1px solid #e9e9e9; background: #fff; text-decoration: none; vertical-align: middle; border-radius: 3px; }
        .member_add_check_body th {padding-right: 50px;}
                
        table#zipcode_box{border-collapse:collapse; border-top:3px solid #fff; 
	    border-bottom:3px solid #fff; margin-top:15px; width:100%;}
        
        table#zipcode_box th, table#zipcode_box td{text-align:left; 
            border-bottom: 3px solid #444;}
        table th, td{  padding: 10px;}
        
        table#zipcode_box  a{display:block; height:20px; text-decoration:none; text-align:left; color:black; text-decoration:none;}
        
        table#zipcode_box a:hover{color: #F90;font-weight: bold;}
        
    </style>
   <script type="text/javascript">
function result(zipNum,sido,gugun,dong) {
	   opener.document.frmm.zip_num.value=zipNum;
	   opener.document.frmm.addr1.value=sido+" "+gugun+" "+dong;
	   self.close();
};
</script>
</head>
<body>
<form method="post" name="frmm" action="find_zip_num">
<div class="member_add_check_body">
   <div class="member_add_check_body_side">
    <h2>우편번호검색</h2>
    <table class="member_add_check_space">지번주소 :
동/읍/면/리 이름을 입력하세요. 예) 역삼동, 화도읍, 둔내면<br><br></table>
    <table class="member_add_check_space">
        <tr>          
            <td><input type="text" name="dong" style="width:300px; margin-left: 20%"></td>
            <th>
            <input type=submit value="찾기" class="member_add_check_box">

            </th>

        </tr>

    </table>
            
    <table id="zipcode_box">
    <tr><th>우편번호</th><th>주소</th></tr>
    
		<c:forEach items="${addressList}" var="addressVo">
		<tr>
			<td>${addressVo.zip_num}</td>
			<td><a href="#" onclick="result('${addressVo.zip_num}' , '${addressVo.sido}' , 
					 '${addressVo.gugun}' ,  '${addressVo.dong}'  );">
					${addressVo.sido} ${addressVo.gugun} ${addressVo.dong} ${addressVo.bunji} 
					</a>
			</td>
		</tr>
	</c:forEach>
    </table>
    
    </div>
    
</div>
<div class="member_add_check_dim"></div>
</form>
</body>
</html>