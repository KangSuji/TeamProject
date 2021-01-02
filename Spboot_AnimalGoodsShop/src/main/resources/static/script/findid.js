function go_idSearch2(){
	if(document.frmmm.mname.value==""){
		alert("이름을 입력해주시기 바랍니다.");
		frmmm.mname.focus();
		return false;
	}else if(document.frmmm.mphone2.value==""){
		alert("전화번호를 입력해주시기 바랍니다.");
		frmmm.mphone2.focus();
		return false;
	}else if(document.frmmm.mphone3.value==""){
		alert("전화번호를 입력해주시기 바랍니다.");
		frmmm.mphone3.focus();
		return false;
	}else{
		document.frmmm.submit();
	}
	return true;
}
function go_idSearch(){
	if(document.frmm.mname.value==""){
		alert("이름을 입력해주시기 바랍니다.");
		frmm.mname.focus();
		return false;
	}else if(document.frmm.memail1.value==""){
		alert("이메일을 입력해주시기 바랍니다.");
		frmm.memail1.focus();
		return false;
	}else if(document.frmm.memail2.value==""){
		alert("이메일을 입력해주시기 바랍니다.");
		frmm.memail2.focus();
		return false;
	}else{
		document.frmm.action="find_id_form";
		document.frmm.submit();
	}
	return true;
}

function showfindidemail(){
            document.getElementById("findidemailform").style.visibility="visible";
            
            document.getElementById("findidphoneform").style.visibility="hidden";
            
            document.getElementById("findidphonetab").style.border="1px solid silver";
             document.getElementById("findidphonetab").style.borderBottom="1px solid black";
            
            document.getElementById("findidemailtab").style.border="1px solid black";
            document.getElementById("findidemailtab").style.borderBottom="1px solid white";
            
        }
        function showfindidphone(){
            document.getElementById("findidphoneform").style.visibility="visible";
            
            document.getElementById("findidemailform").style.visibility="hidden";
            
            document.getElementById("findidemailtab").style.border="1px solid silver";
            document.getElementById("findidemailtab").style.borderBottom="1px solid black";
            
            document.getElementById("findidphonetab").style.border="1px solid black";
            document.getElementById("findidphonetab").style.borderBottom="1px solid white";
        }
        function expandphonedropmenu(){
            document.getElementById("findidphonedropmenu").style.visibility="visible";
        }
        var pn;
        function findidchangephone(pn){
            
            var c = document.getElementById("findidphonedropbox");
            c.innerHTML = pn+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▼";
            document.getElementById("findidphonedropmenu").style.visibility="hidden";
        }