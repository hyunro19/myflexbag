<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="woocommerce-pagination">

	<ul class="page-numbers">
		<!-- page numbers -->
	<c:if test="${pagenext.prev }">
		<li><a href="${base }?page=${pagenext.startPage -1}">&laquo;</a></li>
	</c:if>

	<c:forEach begin="${pagenext.startPage }" end="${pagenext.endPage }" var="idx">
		<li <c:out value="${pagenext.page == idx ? 'class=active' : ''}"/>>
		<a href="${base }${pageprev.listLink }&page=${idx}">${idx }</a>
		</li>
	</c:forEach>

	<c:if test="${pagenext.next && pagenext.endPage >0 }">
		<li><a href="${base }?page=${pagenext.endPage +1 }">&raquo;</a></li>
	</c:if>
		
	</ul>
</nav>