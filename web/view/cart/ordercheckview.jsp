<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<section id="container">
	<div id="container_box">
		<section id="content" style="text-align:center">
			<div class=".centermain" style="display:inline-block; width:50%;">
				
				<c:forEach items="${orderCheckView}" var="checkView">
				<table class="table" style="margin-bottom:0">
					<tr><td><div style="text-align:center;">상품명</div><td><td><a href="/myflexbag/idetail.mc?pid=${checkView.pid}">${checkView.pid}</a><td></tr>
					<tr><td><div style="text-align:center;">단 가</div><td><td><fmt:formatNumber pattern="###,###,###" value="${checkView.unitprice}" /> 원<td></tr>
					<tr><td><div style="text-align:center;">개 수</div><td><td>${checkView.quantity} 개<td></tr>
					<tr><td><div style="text-align:center;">소 계</div><td><td><fmt:formatNumber pattern="###,###,###" value="${checkView.mprice}" /> 원<td></tr>
				</table><br>
	
				<div style="text-align:center;"><a href="review_write.mc?pid=${checkView.pid}"><button>리뷰 작성</button></a></div><br><br><br>
				</c:forEach>

			<a href="ordercheck.mc${pagelink }&page=${pagevo.page }"><button class="btn">목록</button></a>
			</div>
		</section>
		
	</div>

</section>
	
	

