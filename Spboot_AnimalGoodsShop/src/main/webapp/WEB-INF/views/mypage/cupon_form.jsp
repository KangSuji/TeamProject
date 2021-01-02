<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
        body{padding: 50px; box-sizing: border-box;}
        .popup { position: fixed;  z-index: 100; width: 600px;height: 400px;background: #fff; box-sizing: border-box; }
        
     
        .popup h2 {font-size: 36px; color: #061f5d; text-align: center;  border-bottom: 3px solid #444;padding-bottom: 20px;}
        .popup .cupon_con {padding:  40px ;}
        .cupon_con{ /*border-bottom: 1px solid #e8e8e8;*/}
        .cupon th {font-size: 15 px; color: #222; text-align: left; font-weight: normal; }
        
        #cupon_num {width:150% ; height: 48px; font-size: 15px; color: #373737; border: 1px solid #e9e9e9; background: #fff; text-decoration: none; vertical-align: middle; border-radius: 3px;}
        .popup th {padding-right: 50px;}
        
        #cupon_submit_btn {display: inline-block; width: 170px; height: 50px; line-height: 50px; text-align: center;  background: #061f5d; color: #fff;border-radius: 30px; margin-right:20px; cursor: pointer;}
        #cupon_close_btn{display: inline-block; width: 170px; height: 50px; line-height: 50px; text-align: center;  background: gray; color: #fff;border-radius: 30px;}
        #btn_center{text-align: center;cursor: pointer;}
        .popup a {text-decoration: none; }
        .popup a:link{text-decoration: none;}
    </style>
    
    <script type="text/javascript">
     
      
  function go_cupon_insert(){
    		if(document.cuponfrm.name.value==""){
    			alert("쿠폰번호를 입력해주시기 바랍니다.");
    			cuponfrm.name.focus();
    			return false;
    		}else{
    			document.cuponfrm.action="cupon_insert";
    			document.cuponfrm.submit();
    		}
    	}

 </script>
</head>
<body>

<form name="cuponfrm"  method="get">

<div class="popup">
   <div class="cupon_con">
    <h2>쿠폰 등록</h2>
    <table class="cupon">
        <tr>
            <th><label for="cupon_num">쿠폰입력</label></th><td><input type="text" id="name" name="name" placeholder="쿠폰번호를 입력해 주세요."></td>
        </tr>
        <tr><td>${message}</td></tr>
    </table>
    </div>
    <div id="btn_center">
        <input type="button" id="cupon_submit_btn" value="등록" onclick="go_cupon_insert();">
        <a href="javascript:self.close();" id="cupon_close_btn">취소</a>
    </div>  
</div>

</form>
</body>
</html>