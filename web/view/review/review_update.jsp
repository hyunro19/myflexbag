<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>QNA</h1>
<div class="centermain">
	<form action="review_updateimpl.mc" method="post">

		<input type = "hidden" name="rvno" value="${ureview.rvno}">
		
		<label>작성자</label> 
		<div class="div_text">
		<input type="text" name="userid" value="${ureview.userid}" readonly><br>
		</div>
		
		<label>상품번호</label> 
		<div class="div_text">
		<input type="text" name="pid" value="${ureview.pid }" readonly="readonly"><br>
		</div>
		
		<label>제목</label>
		<div class="div_text">
		<input type="text" name="rvtitle" 	value="${ureview.rvtitle }" /><br>
		</div>
		
		<label>내용</label>
		<div class="div_text">
		<textarea cols="50" rows="5" name="rvcon" style="width:60%; resize:none; height:20em;">${ureview.rvcon}</textarea> <br>
		</div>
		
		<input class="btn" type="submit" value="UPDATE"> 
		<input class="btn" type="button" value="CANCEL" onclick="mypage()"><br>

	</form>
</div>

<script>
var mypage = function(){location.href='/myflexbag/mypage.mc'}
</script>

