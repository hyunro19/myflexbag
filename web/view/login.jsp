<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class=centermain>
	<form action="login.mc" method="post" >
	
		<label for="ID">ID</label>
		<div class=div_text>
		<input type="text" name="userid" id="userId" placeholder="ID" style="margin-bottom:0.5em;"><br>
		</div>
		
		<label for="PASSWORD">PASSWORD</label>
		<div class=div_text>
		<input type="password" name="pwd" placeholder="비밀번호">
		</div>
		
		<div class=div_text>
		<input type="submit" value="LOGIN"><br>
		</div>
		
		<c:if test="${msg == false}">
			<p style="color: red;">로그인에 실패하였습니다! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form> <br><br><br>
	
		<label for="registermsg">회원이 아니신가요?</label><br>
		<div class=div_text>
		<a href="uadd.mc"><button type="button">REGISTER</button></a>
		</div>
</div>

		