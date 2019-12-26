<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="text-center">
<ul class="pagination">

	<c:if test="${pagevo.prev }">
		<li><a href="listpage?pag${pagevo.startPage -1}">&laquo;</a></li>
	</c:if>

	<c:forEach begin="${pagevo.startPage } " end = "${pagevo.endPage }" var="idx">
		<li <c:out value="${pagevo.page == idx?' class =active':''}"/>>
		<a href="#">${idx}</a> <!-- "listpage?page=${idx }"  -->
		</li>
	</c:forEach>

	<c:if test="${pagevo.next && pagevo.endPage >0 }">
		<li><a href="listPage?page=${pagevo.endPage +1} }">&raquo;</a></li>
	</c:if>

</ul>
</div>
