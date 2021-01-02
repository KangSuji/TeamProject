<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header1.jsp"%>

<div id="faqhometopmargin"></div>
    <form name="faqhomefrm" id="faqhomefrm">
    <input type="hidden" name="command" value="faq_search">
        <div>
            <div id="faqtitle">FAQ</div>
            <div id="faqsearchcontainer">
                <input type="text" id="faqsearchinput" name="faqsearchinput" placeholder="${faqkey }">
                <input type="button" id="faqsearchbutton" value="검색" onclick="go_searchfaq()">
            </div>
        </div>
        
        <ul id="faqcontentlist">
        <c:forEach items="${faqsearchlist }" var="faqsearch">
            <li class="faqlistQ"><img src="images/qnabulletimg.png">${faqsearch.faqtitle }</li>
            <li class="faqlistA"><div class="faqlistAcontent"><br>${faqsearch.faqcontent }<br><br></div></li>
        </c:forEach>
        </ul>
        
        <a href="shop.do?command=faq_main"><div id="faqpreviousbutton">이전으로</div></a>
    </form>

<%@ include file="../footer.jsp"%>