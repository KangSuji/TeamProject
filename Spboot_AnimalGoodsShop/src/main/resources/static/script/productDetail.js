 function qna_product_write(){
	if(document.product_qna_form.qna_kind.value==""){
		alert("문의유형을 선택하세요");
		document.product_qna_form.qna_kind.focus();
		return false;
	}else if($("input[name=qna_subject]").val()==""){
		alert("제목을 입력하세요");
		document.product_qna_form.qna_subject.focus();
		return false;
	}else if($("textarea[name=qna_content]").val()==""){
		alert("내용을 입력하세요");
		document.product_qna_form.qna_content.focus();
		return false;
	}else{
		document.product_qna_form.submit();
	}
	return true;
}     
       /*review Click*/
        $(function(){
            $('#comment_content_area_1').click(function(){
                $('#comment_detail_1').toggle();
            });
            
        });
        /*Qna Click event
         $(function(){
	
            $('#qna_content_area').click(function(){
			 var index = $('#qna_content_area').index(this);
		alert(index);
                $('#qna_detail_body_1:eq(' + index + ')').toggle();
            });
            
        });
*/
$(function(){
	
            $('.qna_content_area').click(function(){
			if($(this).next().css("display")=="none"){
				$(".qna_detail_body").css("display","none");
				$(this).next().show();
			}else{
				$(this).next().hide();
			}
            });
            
        });

        /*Option select*/
        $(function(){
	
            $('#selectBox_1'&&'#selectBox_2').change(function(){
                $('#selectBox_1,#selectBox_2,#selectBox_3 option:selected').val();
                $('#layer_1').show();
                $("#total_cost").style.top="50px";
            });
        });
  $(function(){
	
            $('#selectBox_3').change(function(){
                $('#selectBox_3 option:selected').val();
                $('#layer_1').show();
                $("#total_cost").style.top="50px";
            });
        });
        $(function(){
            $('#close_btn').click(function(){
                $('#layer_1').hide();
            });
        });
    /* Upon Selecting Quantity*/
    var a=0;

    function changetotalcost(a){
	var price2=document.getElementById("product_detail_price2").innerHTML*1;
        document.getElementById("totalcostamount").innerHTML=price2*a +"원";
    }
    function qna_write_from(id){
	if((id==null)||(id==undefined)||(id=="")){
		alert("로그인을 해주세요.");
		return;
	}
             $("#qna_write_from").show();
              $(".qna_dim").show();

}
$(function(){
	  $("#qna_close_btn").on("click",function(){
              $("#qna_write_from").hide();
              $(".qna_dim").hide();
          });
})
    /*Qna click->Qna modal popup*/
/*    $(function(){
          $("#go_qna_write_form").on("click",function(){
             $("#qna_write_from").show();
              $(".qna_dim").show();
          });
          $("#qna_close_btn").on("click",function(){
              $("#qna_write_from").hide();
              $(".qna_dim").hide();
          });
      });
    */
    /*버튼 호버 색상 변화*/
    $(function(){
            $('#submit_btn a').mouseover(function(){
                $(this).css({background: "#54c0e1", color:"white"});
            });
            $('#submit_btn a').mouseout(function(){
                $(this).css({background: "#061f5c", color:"white"});
            });
            $('#go_cart_btn a').mouseover(function(){
                $(this).css({background: "#269cd3", color:"white"});
            });
            $('#go_cart_btn a').mouseout(function(){
                $(this).css({background: "#f3f3f3", color:"black"});
            });
          
        });
    
    function optionselect1(s,no){
        var sel = s[s.selectedIndex].value;
        document.getElementById("option_view1").innerHTML="&nbsp;Color : "+sel;
    }
    function optionselect2(s,no){
        var sel = s[s.selectedIndex].value;
        document.getElementById("option_view2").innerHTML="&nbsp;Size : "+sel;
    }
 function optionselect3(s,no){
        var sel = s[s.selectedIndex].value;
        document.getElementById("option_view3").innerHTML="&nbsp;Name : "+sel;
    }
