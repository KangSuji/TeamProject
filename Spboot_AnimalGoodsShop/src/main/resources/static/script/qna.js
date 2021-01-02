function qna_check(){
	if(document.frmm.qsubject.value==""){
		alert("문의제목을 입력해 주시기 바랍니다.");
		frmm.qsubject.focus();
		return false;
	}

	if(document.frmm.qcontent.value==""){
		alert("문의내용을 입력해 주시기 바랍니다.");
		frmm.qcontent.focus();
		return false;
	}

	else{
		document.frmm.action="qna_write";
		document.frmm.submit();
	}
	return true;
	
}