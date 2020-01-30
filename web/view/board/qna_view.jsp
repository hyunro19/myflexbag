<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<div class="centermain">
		<h1>QNA</h1>
		
		<table class="table" style="margin-bottom:0">
			<tr><td><div style="text-align:center;">종류</div><td>
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
				<td>
			</tr>
			<tr><td><div style="text-align:center;">제 목</div><td><td>  ${article.btitle} <td></tr>
			<tr><td><div style="text-align:center;">작성자</div><td><td>  ${article.userid} <td></tr>
			<tr><td><div style="text-align:center;">내 용</div><td><td>  ${article.bcon} <td></tr>
		</table>
		<br><br>

			<a href="qna_index.mc${pagelink }&page=${pagevo.page }"><button class="btn">목록</button></a>

		<c:choose>
			<c:when test="${loginid == article.userid }">
				<a href="qna_del.mc?bno=${article.bno }">
					<button class="btn" type="button">
						삭제하기
					</button>
				</a>
				<a href="qna_update.mc?bno=${article.bno }">
					<button class="btn" type="button">
						수정하기
					</button>
				</a>
			</c:when>
		</c:choose>
	</div>
</body>
