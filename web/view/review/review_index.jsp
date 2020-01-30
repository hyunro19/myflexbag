<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<div class="centermain">
		<h1>Review</h1>
		<table>
			<thead>
				<tr>
					<th>No</th> 
					<th>PRODUCT</th>
					<th>WRITER</th>
					<th>TITLE</th>
					<th>DATE</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${rlist }" var="item" varStatus="value">
					<tr>
						<td>${value.count }</td>
						<td>${item.pname}</td>
						<td>${item.userid}</td>
						<td><a href="review_detail.mc?rvno=${item.rvno}&page=${pagenext.page}">${item.rvtitle}</a></td>
						<td>${item.rvdate}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	
		<!-- paging navigation -->
		<jsp:include page="/view/pagenav.jsp" />
		
	</div>

</body>
