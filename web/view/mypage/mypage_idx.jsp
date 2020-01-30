<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script>

function del(userid){
	var c=confirm('정말 탈퇴하시겠습니까?');
	if(c==true){
		$.ajax({
			url : "udel.mc",
			type:"post",
			data : {'userid':userid},
			success : function(data){
				if(data==1) location.href="main.mc";
				else return false;
			}
		})
	}else{
		return false;
	}
};

</script>
<body>
<h1>My Page</h1>

<div class="centermain">
	<a href="ordercheck.mc"> <button class="btn"> 주문 및 배송 조회 </button>  </a><br><br>
	<a href="uupdate.mc">  <button  class="btn"> 회원 정보 수정 </button > </a><br><br>
	<a href="board_byme.mc"> <button  class="btn"> 내가 쓴 게시물 </button> </a><br><br>
</div>
</body>
