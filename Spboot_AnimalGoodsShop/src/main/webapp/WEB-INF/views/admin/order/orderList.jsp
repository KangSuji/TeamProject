<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>
<script type="text/javascript">
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

</script>
<div class="productList_base">
<article>
	<h1>주문리스트</h1>
	<form name="frmm" method="post">
		 <input type="text" name="key" value="${key}" placeholder="주문자이름검색"> 
		 <input class="btn" type="button" value="검색"  onclick="go_search_order()">
		 <input class="btn" type="button" name="btn_total" value="전체보기 " onClick="go_total_order()">     
		 <input type="hidden" name="all_view" value="y">
		    
		 
		
		<table id="orderList" style="text-align:letf; width:1200px;">
		 <tr><th>주문번호</th><th>주문자</th><th>상품명</th><th>수량</th><th>옵션</th>
		     <th>우편번호</th><th  style="width:300px;">배송지</th><th>전화</th><th>주문일</th></tr>
		    <c:forEach items="${orderList}" var="orderVO">
		  <tr><td>
		       <c:choose>
		           <c:when test='${orderVO.result=="1"}'>
		            <span style="font-weight: bold; color: blue">${orderVO.odseq}</span>
		            (<input type="checkbox" name="result" value="${orderVO.odseq}"> 미처리)
		           </c:when>
		           <c:otherwise>
		            <span style="font-weight: bold; color: red">${orderVO.odseq}</span>
		            (<input type="checkbox" checked="checked" disabled="disabled">처리완료)
		           </c:otherwise>
		          </c:choose>
		      </td>
		      <td>${orderVO.mname}</td><td>${orderVO.pname}</td>
		      <td>${orderVO.quantity}</td><td>${orderVO.pcolor }${orderVO.psize }</td>
		      <td>${orderVO.zip_num}</td>
		      <td>${orderVO.address}</td> <td>${orderVO.phone}</td>
		      <td><fmt:formatDate value="${orderVO.indate}" /></td>
		  </tr>
		 </c:forEach>
		</table>
		<input type="button" class="btn" style="width: 150px;" value="주문처리(입금확인)" onClick="go_order_save()">
	</form>
	<br>
	<jsp:include page="../../admin/paging/admin_order_paging.jsp">
	<jsp:param value="${paging.page}" name="page"/>
	<jsp:param value="${paging.beginPage}" name="beginPage"/>
	<jsp:param value="${paging.endPage}" name="endPage"/>
	<jsp:param value="${paging.prev}" name="prev"/>
	<jsp:param value="${paging.next}" name="next"/>
</jsp:include>
</article>
</div>
<%@ include file="../../admin/footer.jsp"%>