<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="centermain">
	<table class="table" style="margin-bottom:0">
		<tr><td><div style="text-align:center;">제 목</div><td><td>  ${rvdetail.rvtitle} <td></tr>
		<tr><td><div style="text-align:center;">작성자</div><td><td>  ${rvdetail.userid} <td></tr>
		<tr><td><div style="text-align:center;">내 용</div><td><td>  ${rvdetail.rvcon} <td></tr>
	</table> 
<br><br>

<a href="review.mc${pagelink }&page=${pagevo.page }"><button class="btn">목록</button></a>

<c:choose>
	<c:when test="${loginid == rvdetail.userid }">
		<form action="review_del.mc" method="Post" style="display:inline-block">
			<input type="hidden" name="rvno" value="${rvdetail.rvno }">
			<button class="btn" type="submit"> 삭제하기</button>
		</form>
		<a href="review_update.mc?rvno=${rvdetail.rvno }"><button class="btn" type="button">수정하기</button></a>
	</c:when>
</c:choose>



</div>