function go_cupon_page(){
		var url = "/cupon_form";
	var opt = "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=600, ";
	opt = opt + "height=400, top=700, left=300";
	window.open(url, "cupon_form", opt);
	
	if(document.cuponfrm.name.value==""){
		alert("먼저 쿠폰을 입력해주시기 바랍니다.");
		cuponfrm.name.focus();
		return false;
	}
}

 $(function(){
          $("#cupon_open").on("click",function(){
             $(".popup").show();
              $(".cupon_popup_dim").show();
          });
          $("#cupon_close_btn").on("click",function(){
              $(".popup").hide();
              $(".cupon_popup_dim").hide();
          });
      }); 


  var num=0;
        /*상단 배너 움직임*/
        $(function(){
            $('.remote:eq(0)').text('●');
            /*자동*/
            setInterval(function(){
                num++;
                if(num>2) num=0;
                var move = 1920*-1*num;
                $('.remote:eq(0)').text('●');
                for(var i=0; i<=3; i++)
                    $('#banner_img_list_div_'+(i+1)).animate({left:move},500);
                $('.remote').each(function(){
                    $(this).text('○');
                });
               $('.remote:eq('+num+')').text('●');
            },3000);
            /*버튼 클릭시 이동*/
            $('.remote').click(function(){
                num = $('.remote').index(this);
                var move=1920*-1*num;
                for(var i=0; i<=3; i++){
                    $('.remote:eq('+i+')').text('●');
                    $('#banner_img_list_div_'+(i+1)).animate({left:move},500);
                    
                }
                $( '.remote' ).each(function(){
                    $( this ).text('○');
                });
            });  
        });
        $(function(){
            $('.learn_more_btn').mouseover(function(){
                $(this).css({background: "none", color:"#269cd3"});
            });
            $('.learn_more_btn').mouseleave(function(){
                $(this).css({background: "#269cd3", color: "white"});
            });
           
        });
        
