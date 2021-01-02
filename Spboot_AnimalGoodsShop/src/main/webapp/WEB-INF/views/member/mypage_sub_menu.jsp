<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div id="my_edit_profile_menu">
        <div id="my_deit_profile_my_name_box">
            <div id="my_deit_profile_my_name_text">${loginUser.name}(${loginUser.id })<br>적립금 : ${loginUser.point }</div>
        </div>
           <div id="my_edit_profile_menu_text_box">
                <div class="my_edit_information_button">내 정보</div>
           </div>
        <div id="my_edit_profile_menu_text_box"></div>
        
        
        <div id="my_edit_profile_menu_text_box_top">
            <div class="my_edit_profile_icon_img"><img src="images/cart_icon.png" height="28"></div>
            <div class="my_edit_profile_icon_text">주문조회</div>
        </div>
        
        <div id="my_edit_profile_menu_text_box">
            <div class="my_edit_profile_icon_img"><img src="images/coupon_icon.png" height="28"></div>
            <div class="my_edit_profile_icon_text">쿠폰</div>
        </div>
        <div id="my_edit_profile_menu_text_box_bottom">
            <div class="my_edit_profile_icon_img"><img src="images/qna_icon.png" height="28"></div>
            <div class="my_edit_profile_icon_text"><a href="shop.do?command=qna_list">1:1 문의</a></div>
        </div>
    </div>