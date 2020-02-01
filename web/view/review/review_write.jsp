<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function form_Chk() {
		var form = document.writeinfo;
		if (!form.rvtitle.value) {
			alert("제목을 입력하세요.");
			form.rvtitle.focus();
			return false;
		}
	};
</script>
<body>
	<div class="centermain">
		<h2>Review</h2>
		<form method="post" action="review_write.mc" name="writeinfo" >

			<label>작성자</label> 
			<div class="div_text">
			<input type="text" name="userid" value="${loginid}" readonly><br>
			</div>
			
			<label>상품번호</label> 
			<div class="div_text">
			<input type="text" name="pid" value="${pid }" readonly="readonly"><br>
			</div>
						 
			<label>제목</label> 
			<div class="div_text">
			<input type="text" name="rvtitle" /><br>
			</div>
			
			<label>내용</label>
			<div class="div_text">
			<textarea cols="50" rows="5" name="rvcon" style="width:60%; resize:none; height:20em;"></textarea><br>
			</div>
			
			<button class="btn" type="submit">WRITE</button>
			<input class="btn" type="button" value="CANCEL" onclick="mypage()"><br>
		</form>
	</div>
</body>

<script>
var mypage = function(){location.href='/myflexbag/mypage.mc'}
</script>
