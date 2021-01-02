<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   body{text-align:center;}
   #paging{font-size: 120%;}
</style>
</head>
<body>
<div id="paging">
<c:url var="action" value="admin_member_list"/> <!-- 링크 경로 저장 -->
<c:if test="${param.prev}"> <!-- 이전 버튼 설정 -->
    <a href="${action}?page=${param.beginPage-1}">◀</a>
</c:if> 
<!-- 파라미터로 전달된  beginPage부터 endPage 까지 차례로 화면에 표시-->
<c:forEach begin="${param.beginPage}" end="${param.endPage}" step="1" var="index">
    <c:choose>
        <c:when test="${param.page==index}">   <!-- 반복실행 인데스와 전달된 현재 page 값이 같다면 -->
            ${index}   <!-- 링크 없이 표시 -->
        </c:when>
        <c:otherwise> <!-- 그 외에는  표시되는 숫자의 페이지를 파라미터로 해서 링크걸어 표시 -->
            <a href="${action}?page=${index}">${index}</a>
        </c:otherwise>
    </c:choose>
</c:forEach>
<c:if test="${param.next}">  <!-- 다음 버튼 설정 -->
    <a href="${action}&page=${param.endPage+1}">▶</a>
</c:if>
</div>

</body>
</html>