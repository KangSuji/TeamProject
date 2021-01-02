function go_search(){
	var theForm = document.frm;
	if(theForm.key.value=="") return;
	theForm.action =  "product_list";
	theForm.submit();
}