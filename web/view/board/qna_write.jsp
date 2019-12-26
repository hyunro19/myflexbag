<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<textarea style="resize: none;"></textarea>
<script>
	function form_Chk() {

		var form = document.writeinfo;

		if (!form.btitle.value) {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}

	};
</script>
<body>
	<div class="centermain">
		<h2>QNA</h2>
		<form method="post" name="writeinfo" onsubmit="return form_Chk();">
			
			<label>제목</label> 
			<div class="div_text">
			<input type="text" name="btitle" /><br>
			</div>
			
			<label>작성자</label> 
			<div class="div_text">
			<input type="text" name="userid" value="${loginid}" readonly><br>
			</div>
			
			<label>카테고리</label>
			<div class="div_text">
				<select name="bkind" style="width:60%; color:#888888; border:1px solid #ccc; padding:4px 0 6px 0">
					<option value = "product">상품문의</option>
					<option value = "delivery">배송문의</option>
					<option value = "beforedel">배송전취소·변경</option>
					<option value = "afterdel">배송후교환·반품</option>
					<option value = "defect">불량및오배송</option>
					<option value = "etc">기타</option>
				</select>
			</div>
			
			<label>내용</label>
			<div class="div_text">
			<textarea cols="50" rows="5" name="bcon" style="width:60%; resize:none; height:20em;"></textarea><br>
			</div>
			<button type="submit">WRITE</button>
			<input class="btn" type="button" value="CANCEL" onclick="mypage()"><br>
		</form>
	</div>
</body>

<script>
var mypage = function(){location.href='/myflexbag/mypage.mc'}
</script>

