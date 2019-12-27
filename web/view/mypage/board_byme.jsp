<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<div class="centermain">
		<h1>QNA</h1>
		<table>
			<thead>
				<tr>
					<th>NO</th>
					<th>Category</th>
					<th>Title</th>
					<th>Date</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${blist }" var="blist" varStatus="value">
					<tr>
						<td>${value.count }</td>
						<td>
							<c:choose>
								<c:when test="${blist.bkind == 'product' }">
									상품문의
								</c:when>
								<c:when test="${blist.bkind == 'delivery' }">
									배송문의
								</c:when>
								<c:when test="${blist.bkind == 'beforedel' }">
									배송전취소·변경
								</c:when>
								<c:when test="${blist.bkind == 'afterdel' }">
									배송후교환·반품
								</c:when>
								<c:when test="${blist.bkind == 'defect' }">
									불량및오배송
								</c:when>
								<c:otherwise>
									기타
								</c:otherwise>
							</c:choose>
						</td>
						<td><a href="qna_view.mc?bno=${blist.bno}">${blist.btitle}</a></td>
						<td>${blist.bdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
				<h1>Review</h1>
		<table>
			<thead>
				<tr>
					<th>NO</th>
					<th>PRODUCT</th>
					<th>Title</th>
					<th>Date</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${rlist }" var="rlist" varStatus="value">
					<tr>
						<td>${value.count}</td>
						<td>${rlist.pname}</td>
						<td><a href="review_detail.mc?rvno=${rlist.rvno}">${rlist.rvtitle}</a></td>
						<td>${rlist.rvdate}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	
	</div>
</body>
