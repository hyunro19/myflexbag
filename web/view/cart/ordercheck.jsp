<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section id="container">
	<div id="container_box">
		<section id="content" style="text-align:center">
			<div class=".centermain" style="display:inline-block; width:70%;">
				
				<c:forEach items="${odlist}" var="oditem">
						<table class="table" style="margin-bottom:0">
							<tr><td><div style="text-align:center;">주문번호</div><td><td><a href="/myflexbag/ordercheckview.mc?orderno=${oditem.orderno}&page=${pagenext.page}">${oditem.orderno}</a><td></tr>
							<tr><td><div style="text-align:center;">주문날짜</div><td><td>${oditem.odate}<td></tr>
							<tr><td><div style="text-align:center;">받는사람</div><td><td>${oditem.receiver}<td></tr>
							<tr><td><div style="text-align:center;">받는번호</div><td><td>${oditem.orderphon}<td></tr>
							<tr><td><div style="text-align:center;">받는주소</div><td><td>${oditem.address}<td></tr>
							<tr><td><div style="text-align:center;">주문금액</div><td><td><fmt:formatNumber pattern="###,###,###" value="${oditem.pricesum}" /> 원 <td></tr>
							<tr><td><div style="text-align:center;">배송상태</div><td><td>${oditem.deliid}<td></tr>
						</table>
						<br>
				</c:forEach>
					
			</div>
			
			<!-- paging navigation -->
			<jsp:include page="/view/pagenav.jsp" />
			
		</section>
	</div>
</section>
	
	

			