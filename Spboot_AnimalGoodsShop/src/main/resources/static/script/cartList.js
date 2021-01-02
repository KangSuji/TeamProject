   $(function(){
            $('#shopping_cart_order_button').mouseover(function(){
                $(this).css({background: "#269cd3", color:"white"});
            });
            $('#shopping_cart_order_button').mouseout(function(){
                $(this).css({background: "#061f5c", color:"white"});
            });
            $('#shopping_cart_more_shopping_btn').mouseover(function(){
                $(this).css({background: "#7d7775", color:"white", border: "none"});
            });
            $('#shopping_cart_more_shopping_btn').mouseout(function(){
                $(this).css({background: "none", color:"black",border:"1px solid black"});
            });
            
        });
    
