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
					<th>Writer</th>
					<th>Category</th>
					<th>Title</th>
					<th>Date</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach  var="article" items="${blist }"  varStatus="value">
					<tr>
						<td>${value.count }</td>
						<td>${article.userid}</td>
							<td>
								<c:choose>
									<c:when test="${article.bkind == 'product' }">
										상품문의
									</c:when>
									<c:when test="${article.bkind == 'delivery' }">
										배송문의
									</c:when>
									<c:when test="${article.bkind == 'beforedel' }">
										배송전취소·변경
									</c:when>
									<c:when test="${article.bkind == 'afterdel' }">
										배송후교환·반품
									</c:when>
									<c:when test="${article.bkind == 'defect' }">
										불량및오배송
									</c:when>
									<c:otherwise>
										기타
									</c:otherwise>
								</c:choose>
							</td>
						<td><a href="qna_view.mc?bno=${article.bno}">${article.btitle}</a></td>
						<td>${article.bdate}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
		<c:choose>
			<c:when test="${loginid == null }">
			</c:when>
			<c:otherwise>
				<button input type="button">
					<a href="qna_write.mc">문의하기</a>
				</button>
			</c:otherwise>
		</c:choose>
	</div>

</body>
