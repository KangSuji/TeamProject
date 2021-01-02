

function go_cart() {
	if (document.formm.color.value == "") {
		    alert("색상을 선택하여 주세요.");
		    document.formm.color.focus();
	 }else if(document.formm.size.value == ""){
		  alert("사이즈를 선택하여 주세요.");
		    document.formm.size.focus();
	}else if(document.formm.product_option.value==""){
		alert("옵션을 선택하여 주세요.");
		document.formm.product_option.focus();
	}else{
		 	document.formm.action ="cart_insert";
		 	document.formm.submit();
	 }
}

function go_cart_delete(cseq){
	if(cseq!=null){ 
		document.frrmm.action = "cart_delete?cseq="+cseq;
	    document.frrmm.submit();
	}
}

function go_pay() {
   if (document.formm.color.value == "") {
          alert("색상을 선택하여 주세요.");
          document.formm.color.focus();
    }else if(document.formm.size.value == ""){
        alert("사이즈를 선택하여 주세요.");
          document.formm.size.focus();
   }else if(document.formm.product_option.value==""){
      alert("옵션을 선택하여 주세요.");
      document.formm.product_option.focus();
   }else{
          document.formm.action ="pay_form";
          document.formm.submit();
    }
}
