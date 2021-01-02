

function post_zip(){
	var url = "find_zip_num";
	var opt = "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=550, ";
	opt = opt + "height=500, top=700, left=300";
	window.open(url, "Find zip num", opt);
}

function idcheck(){
	var alphaDigit= "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	/*버튼 클릭전 아이디를 입력 후 클릭하도록 하는 if 문 제작*/
	if(document.frmm.mid.value==""){
		alert("먼저 아이디를 입력해주시기 바랍니다.");
		frmm.mid.focus();
		return false;
	}
	if (document.frmm.mid.value.length < 4 || document.frmm.mid.value.length > 15){
    alert("아이디는 4~10자 이내여야 합니다.");
    document.frmm.mid.focus();
    return;
    }
    if (document.frmm.mid.value.indexOf(" ") >= 0) {
    alert("아이디에는 공백이 들어가면 안됩니다.");
    document.frmm.mid.focus();
    return;
    }
    for (i=0; i<document.frmm.mid.value.length; i++) {
      if (alphaDigit.indexOf(document.frmm.mid.value.substring(i, i+1)) == -1) {
      alert("아이디는 영문과 숫자의 조합만 사용할 수 있습니다.");
      document.frmm.mid.focus();
      return;
      }
    }
	/*입력해서 추출해온 아이디를 이용해서 아이디 검색 후 결과를 보여주는 클래스 실행*/
	var opt="toobar=no,resizable=no,scorllbars=no,menubar=no,width=700,height=500";
	var k=document.frmm.mid.value;
	window.open("idcheck?mid="+k,"id_check",opt);
}

function go_update(){
	var alphaDigit= "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	if(document.frmm.mpwd.value==""){
		alert("비밀번호를 입력해주시기 바랍니다.");
		frmm.mpwd.focus();
		return false;
	}

    if (document.frmm.mpwd.value.length < 4 || document.frmm.mpwd.value.length > 20){
    alert("비밀번호는 4~20자 이내여야 합니다.");
    document.frmm.mpwd.focus();
    return;
    }
    if (document.frmm.mpwd.value.indexOf(" ") >= 0) {
    alert("비밀번호는 공백이 들어가면 안됩니다.");
    document.frmm.mpwd.focus();
    return;
    }
    for (i=0; i<document.frmm.mpwd.value.length; i++) {
      if (alphaDigit.indexOf(document.frmm.mpwd.value.substring(i, i+1)) == -1) {
      alert("비밀번호는 영문과 숫자의 조합만 사용할 수 있습니다.");
      document.frmm.mpwd.focus();
      return;
      }
    }
 if(document.frmm.mpwd.value != document.frmm.mpwd_check.value){
		alert("비밀번호가 일치하지 않습니다.");
		frmm.mpwd_check.focus();
		return false;
	}else if(document.frmm.mgender.value==""){
		alert("성별을 선택해주시기 바랍니다.");
		return false;
	}
		else if(document.frmm.myear.value==""){
		alert("생년월일을 입력해주시기 바랍니다.");
		return false;
	}
		else if(document.frmm.mmonth.value==""){
		alert("생년월일을 입력해주시기 바랍니다.");
		return false;
	}
		else if(document.frmm.mday.value==""){
		alert("생년월일을 입력해주시기 바랍니다.");
		return false;
	}
	else if(document.frmm.mphone1.value==""){
		alert("전화번호를 입력해주시기 바랍니다.");
		frmm.mphone1.focus();
		return false;
	}
	else if(document.frmm.mphone2.value==""){
		alert("전화번호를 입력해주시기 바랍니다.");
		frmm.mphone2.focus();
		return false;
	}
	else if(document.frmm.mphone3.value==""){
		alert("전화번호를 입력해주시기 바랍니다.");
		frmm.mphone3.focus();
		return false;
	}
	else if(document.frmm.memail1.value==""){
		alert("이메일을 입력해주시기 바랍니다.");
		frmm.memail1.focus();
		return false;
	}
	else if(document.frmm.memail2.value==""){
		alert("이메일을 입력해주시기 바랍니다.");
		frmm.memail2.focus();
		return false;
	}else{
		document.frmm.action="member_update";
		document.frmm.submit();
	}
	return true;


}
function go_save(){
	var alphaDigit= "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	if(document.frmm.mid.value==""){
		alert("아이디를 입력해주시기 바랍니다.");
		frmm.mid.focus();
		return false;
	}

    if (document.frmm.mid.value.length < 4 || document.frmm.mid.value.length > 15){
    alert("아이디는 4~10자 이내여야 합니다.");
    document.frmm.mid.focus();
    return;
    }
    if (document.frmm.mid.value.indexOf(" ") >= 0) {
    alert("아이디에는 공백이 들어가면 안됩니다.");
    document.frmm.mid.focus();
    return;
    }
    for (i=0; i<document.frmm.mid.value.length; i++) {
      if (alphaDigit.indexOf(document.frmm.mid.value.substring(i, i+1)) == -1) {
      alert("아이디는 영문과 숫자의 조합만 사용할 수 있습니다.");
      document.frmm.mid.focus();
      return;
      }
    }
	if(document.frmm.mpwd.value==""){
		alert("비밀번호를 입력해주시기 바랍니다.");
		frmm.mpwd.focus();
		return false;
	}

    if (document.frmm.mpwd.value.length < 4 || document.frmm.mpwd.value.length > 20){
    alert("비밀번호는 4~20자 이내여야 합니다.");
    document.frmm.mpwd.focus();
    return;
    }
    if (document.frmm.mpwd.value.indexOf(" ") >= 0) {
    alert("비밀번호는 공백이 들어가면 안됩니다.");
    document.frmm.mpwd.focus();
    return;
    }
    for (i=0; i<document.frmm.mpwd.value.length; i++) {
      if (alphaDigit.indexOf(document.frmm.mpwd.value.substring(i, i+1)) == -1) {
      alert("비밀번호는 영문과 숫자의 조합만 사용할 수 있습니다.");
      document.frmm.mpwd.focus();
      return;
      }
    }
	
	if(document.frmm.reid.value==""){
		alert("중복체크를 해주시기 바랍니다.");
		frmm.mid.focus();
		return false;
	}
	else if(document.frmm.mpwd.value != document.frmm.mpwd_check.value){
		alert("비밀번호가 일치하지 않습니다.");
		frmm.mpwd_check.focus();
		return false;
	}
	else if(document.frmm.mname.value==""){
		alert("이름을 입력해주시기 바랍니다.");
		frmm.mname.focus();
		return false;
	}
	else if(document.frmm.mgender.value==""){
		alert("성별을 선택해주시기 바랍니다.");
		return false;
	}
		else if(document.frmm.myear.value==""){
		alert("생년월일을 입력해주시기 바랍니다.");
		return false;
	}
		else if(document.frmm.mmonth.value==""){
		alert("생년월일을 입력해주시기 바랍니다.");
		return false;
	}
		else if(document.frmm.mday.value==""){
		alert("생년월일을 입력해주시기 바랍니다.");
		return false;
	}
	else if(document.frmm.mphone1.value==""){
		alert("전화번호를 입력해주시기 바랍니다.");
		frmm.mphone1.focus();
		return false;
	}
	else if(document.frmm.mphone2.value==""){
		alert("전화번호를 입력해주시기 바랍니다.");
		frmm.mphone2.focus();
		return false;
	}
	else if(document.frmm.mphone3.value==""){
		alert("전화번호를 입력해주시기 바랍니다.");
		frmm.mphone3.focus();
		return false;
	}
	else if(document.frmm.memail1.value==""){
		alert("이메일을 입력해주시기 바랍니다.");
		frmm.memail1.focus();
		return false;
	}
	else if(document.frmm.memail2.value==""){
		alert("이메일을 입력해주시기 바랍니다.");
		frmm.memail2.focus();
		return false;
	}
	else if(document.frmm.agree[0].checked==false){
		alert("이용약관에 동의하시기 바랍니다.");
		frmm.agree[0].focus();
		return false;
	}else if(document.frmm.agree[1].checked==false){
		alert("개인정보취급방침를 동의하시기 바랍니다.");
		frmm.agree[1].focus();
		return false;
	}else if(document.frmm.agree[2].checked==false){
		alert("개인정보취급방침를 동의하시기 바랍니다.");
		frmm.agree[2].focus();
		return false;
	}
	else{
		document.frmm.action="join";
		document.frmm.submit();
	}
	return true;
	
}
 function changeSelect(s,no){
    form = document.frmm;
    sel = s[s.selectedIndex].value;
    dis = 1;
 
    if(sel=="user"){
        sel = "";
        dis = 0;
    }
 
        form.memail2.value = sel;
		/*form.memail4.value = sel;*/
      /*  form.memail2.disabled = dis;*/
    
}