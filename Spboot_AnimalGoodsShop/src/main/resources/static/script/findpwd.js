function pass_check(){
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
	}else{
		document.frmm.action="reset_pwd";
		document.frmm.submit();
	}
	return true;

}
function go_pwdSearch(){
	if(document.frmm.mid.value==""){
		alert("아이디를 입력해주시기 바랍니다.");
		frmm.mid.focus();
		return false;
	}
	else if(document.frmm.mname.value==""){
		alert("이름을 입력해주시기 바랍니다.");
		frmm.mname.focus();
		return false;
	}else if(document.frmm.mphone1.value==""){
		alert("전화번호를 입력해주시기 바랍니다.");
		frmm.mphone1.focus();
		return false;
	}else if(document.frmm.mphone2.value==""){
		alert("전화번호를 입력해주시기 바랍니다.");
		frmm.mphone2.focus();
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
		document.frmm.submit();
	}
	return true;
}