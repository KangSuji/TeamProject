<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<form name="frmm">
<div id="main_base">      
    <div id="banner">
       <!--이동할 메인 이미지들-->
        <div id="banner_img_list">
            <div id="banner_img_list_div_1">
                <img src="static/images/banner01.png" width="1920px;" height="480px;">
                <input type="button" value="자세히보기" id="product_more_btn">
            </div>
            <div id="banner_img_list_div_2">
                <img src="static/images/banner02.png" width="1920px;" height="480px;">
                <input type="button" value="자세히보기" id="product_more_btn">
            </div>
            <div id="banner_img_list_div_3">
                <img src="static/images/banner03.png" width="1920px;" height="480px;">
                <input type="button" value="자세히보기" id="product_more_btn">
            </div>
        </div>
        <!--우측하단 리모콘-->
        <div id="remote_base">
           <div id="remote_area">
                <div class="remote">○</div>
                <div class="remote">○</div>
                <div class="remote">○</div>
            </div>
        </div>   
    </div>
    <div id="new">
        <div id="new_title_area">
           <div id="new_title_text">NEW</div>
        </div>
       
        <div id="new_product_area">
         <c:forEach items="${newProductList}" var="newProductVO">
      
            <a href="product_detail?pseq=${newProductVO.pseq}"><div class="new_product_img">
                <div class="new_imgs"><img src="static/product_images/${newProductVO.image1}" width="285px" height="285px;"></div>
                <div class="new_title">${newProductVO.pname}</div>
                <div class="new_price">${newProductVO.price2}원</div>
            </div></a>
          
           </c:forEach>
           
        </div>

        
    </div>
    <!--BEST 상품-->
    <div id="best">
        <div id="best_title_area">
           <div id="bset_title_text">BEST</div>
        </div>
        <div id="best_img_area">
        	<c:forEach items="${bestProductList}" var="bestProductVO">
            <a href="product_detail?pseq=${bestProductVO.pseq}"><div class="best_product_img">
                <div class="best_imgs"><img src="static/product_images/${bestProductVO.image1 }" width="285px;" height="285px;"></div>
                <div class="best_title">${bestProductVO.pname }</div>
                <div class="best_price">${bestProductVO.price2 }원</div>
            </div></a>
           </c:forEach>
            
        </div>  
        
    </div>
 
    
</div>
</form>
<%@ include file="footer.jsp"%>