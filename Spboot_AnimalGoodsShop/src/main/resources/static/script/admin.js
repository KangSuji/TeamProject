/*상품자세히보기*/
function go_detail(pseq){
	document.frmm.action="admin_product_detail?pseq="+ pseq;
	document.frmm.submit();
}
/*목록으로 돌아가기*/
function go_mov(){
	document.frmm.action="admin_product_list";
	document.frmm.submit();
}
/*상품수정 폼 서브밋*/
function go_mod(pseq){
	document.frmm.action="admin_product_edit_form?pseq="+pseq;
	document.frmm.submit();
}


/*prodcut search*/
function go_search_product(){
	var form = document.frmm;
	if(form.key.value=="" && form.all_view.value=='y'){
		return;
	}else{
		form.all_view.value='n';
		form.action ="admin_product_list?";
		form.submit();
	}
}
/*전체상품목록 보기*/
function view_all_prodcut(){
	var form = document.frmm;
	form.all_view.value='y';
	form.key.value="";
	form.action ="admin_product_list";
	form.submit();
}



/*회원검색*/
function go_search_member(){
	var form = document.frmm;
	if(form.key.value=="" && form.all_view.value=='y'){
		return;
	}else{
		form.all_view.value='n';
		form.action ="admin_member_list?";
		form.submit();
	}
}

/*회원목록 전체보기*/
function go_total_member(){
	var form = document.frmm;
	form.all_view.value='y';
	form.key.value="";
	form.action ="admin_member_list";
	form.submit();
}
/*상품 삭제 서브밋*/
function go_delete(pseq){
	document.frmm.action="admin_product_delete?pseq="+pseq;
	document.frmm.submit();
}
/*상품등록 서브밋*/
function go_write(){
	document.frmm.action="admin_product_write_from";
	document.frmm.submit();
}

/*대분류 소분류*/
 function itemChange(sVal) {
        var f = document.frmm;
        var opt = $("#subkind").length;
 
        if (sVal == 1) {
            num = new Array("가슴줄","리드줄","목줄","안전용품","산책용품");
            vnum = new Array("1","2","3","4","5");
        }else if (sVal == 2) {
            num = new Array("SUMMER","아우터","티셔츠","악세서리");
            vnum = new Array("1","2","3","4");
        }else if (sVal == 3) {
            num = new Array("이동장","안전문","방석·매트","식기·보관","목욕·위생","탈취·소독","디지털·가전");
            vnum = new Array("1","2","3","4","5","6","7");
        }else if (sVal == 4) {
            num = new Array("노즈워크","터그","공","삑삑이","소프트토이");
            vnum = new Array("1","2","3","4","5");
        }else if (sVal == 5) {
            num = new Array("트릿백·가방","클리커","어질리티·피트니스","트레이너 의류");
            vnum = new Array("1","2","3","4");
        }else if (sVal == 6) {
            num = new Array("자연식·습식","사료·건식","간식","파우더","영양제");
            vnum = new Array("1","2","3","4","5");
        }else if (sVal == 7) {
            num = new Array("도서","문구");
            vnum = new Array("1","2");
        }
 
        for(var i = 0; i<frmm.subkind.length; i++) {
            document.frmm.subkind.options[0] = null;
        }
        for(var i=0; i< num.length; i++){
            document.frmm.subkind.options[i] = new Option(num[i],vnum[i]);
        }
    }

/*checkBox*/
function oneCheckboxBest(a){
	var chk=document.getElementsByName("bestyn");
	for(var i =0; i<chk.length; i++){
		if(chk[i] !=a){
			chk[i].checked=false;
		}
	}
}

function oneCheckboxUse(a){
	var chk=document.getElementsByName("useyn");
	for(var i =0; i<chk.length; i++){
		if(chk[i] !=a){
			chk[i].checked=false;
		}
	}
}
/*상품등록 서브밋*/
function go_save(){
	document.frmm.action="admin_product_write";
	document.frmm.submit();
}


function go_mod_save(pseq){
	document.frmm.action="admin_product_edit?pseq="+pseq;
	document.frmm.submit();
}

function go_order_save(){
		var count=0;
		if(document.frmm.result.length == undefined){
			if(document.frmm.result.checked == true)	count++;
		}else{
			for(var i =0; i<document.frmm.result.length; i++){
				if(document.frmm.result[i].checked==true)count++;
			}
		}
		if(count==0){
			alert("주문 처리할 항목을 선택해 주세요.");
		}else{
			document.frmm.action = "admin_order_save";
			document.frmm.submit();
		}
}
function go_search_order(){
		var theForm = document.frmm;
		if(theForm.key.value=="" && theForm.all_view.value=='y')return;
		theForm.all_view.value="n";
		theForm.action = "admin_order_list";
		theForm.submit();
}
function go_total_order(){
		var theForm = document.frmm;
		theForm.all_view.value="y";
		theForm.key.value="";
		theForm.action = "admin_order_list";
		theForm.submit();
}