$(function(){
            $(".faqlistQ").click(function(){
                if($(this).next().css("display")=="none"){
                    $(".faqlistA").css("display", "none");
                    $(this).next().slideDown(400);
                 }else{
                    $(this).next().slideUp(400);
                 }
            }); 
        });

function go_searchfaq(){
	if(document.faqhomefrm.faqsearchinput.value==""){
		alert("검색어를 입력해주세요.")
		faqhomefrm.faqsearchinput.focus();
		return false;
	}else{
		document.faqhomefrm.submit();
	}
	return true;
}