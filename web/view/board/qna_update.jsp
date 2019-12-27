<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>QNA</h1>
<div class="centermain">
	<form action="qna_updateimpl.mc" method="post">

	<input type = "hidden" name="bno" value="${uboard.bno}">
		<div class="div_text">
			카테고리 <select name="bkind">
				<option value="${uboard.bkind }">
						<c:choose>
						<c:when test="${uboard.bkind == 'product' }">
							상품문의
						</c:when>
						<c:when test="${uboard.bkind == 'delivery' }">
							배송문의
						</c:when>
						<c:when test="${uboard.bkind == 'beforedel' }">
							배송전취소·변경
						</c:when>
						<c:when test="${uboard.bkind == 'afterdel' }">
							배송후교환·반품
						</c:when>
						<c:when test="${uboard.bkind == 'defect' }">
							불량및오배송
						</c:when>
						<c:otherwise>
							기타
						</c:otherwise>
					</c:choose>
				
				
				</option>
				<option value="product">상품문의</option>
				<option value="delivery">배송문의</option>
				<option value="beforedel">배송전취소,변경</option>
				<option value="afterdel">배송후교환,반품</option>
				<option value="defect">불량및오배송</option>
				<option value="etc">기타</option>
			</select>
		</div>
		<div class="div_text">
			<label>제목</label> <input type="text" name="btitle"
				value="${uboard.btitle }" /><br>
		</div>
		<div class="div_text">
			<label>작성자</label> <input type="text" name="userid"
				value="${uboard.userid}" readonly><br>
		</div>
		
		<div class="div_text">
			<label>내용</label>
			<textarea cols="50" rows="5" name="bcon">${uboard.bcon}</textarea>
			<br>
		</div>
		<input type="submit" value="UPDATE"><br>
		<input class="btn" type="button" value="CANCEL" onclick="mypage()"><br>

	</form>
</div>


<script>
var mypage = function(){location.href='/myflexbag/mypage.mc'}
</script>

