<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
td {
vertical-align:middle;
horizontal-align:middle;
text-align:center;
}
tr > th {
vertical-align:middle;
text-align:center;
}
</style>

<!-- 카트 담긴 상품 재출력 -->
<h1>Order Page</h1>
	<table border="1">
		<tr> <th>사진</th> <th>상품이름</th> <th>상품수량</th> <th>상품가격</th> </tr>
		<c:forEach items="${olist}" var="olist">
			<tr> <td> 	<div id="lab1"> <div id="lab2"> <div id="lab3"><img src="${olist. img}"></div></div></div> </td> <td>${olist. pname}</td> <td>${olist. pnum}</td> <td>${olist. price}</td> </tr>
		</c:forEach>
	</table>

<!-- 주문자 정보 출력 -->
<div>
	<table border="1">
		<tr> <th>주문자id</th> <th>보내는 사람</th> <th>보내는 연락처</th> <th>이메일</th> </tr>
		<tr> <td>${ouser.userid}</td> <td>${ouser.uname}</td> <td>${ouser.phone}</td> <td>${ouser.email}</td> </tr>
	</table>
</div>


<!-- 수령정보 입력 -->
<div class="centermain">
<div class="orderInfo">
	<form role="form" method="post" autocomplete="off" action="/myflexbag/order.mc">
		<!-- <input type="hidden" name="amount" value="${sum}" />  -->
		<input type="hidden" name="amount" value="${amount}" />
		
		<label for="RECEIVER">RECEIVER</label>
		<div class="inputArea">
		<input type="text" name="receiver" id="receiver" required="required" placeholder="받는 사람"/>
		</div> <br>
		
		<label for="RECEIVER">PHONE NUMBER</label>
		<div class="inputArea">
		<input type="number" 	name="orderphon" id="orderphon" required="required" placeholder="받는 연락처"/>
		</div> <br>
		
		<label for="address">ADDRESS</label>
		<div class=div_text>
		<input type="text" name="address" placeholder="받는 주소" id="userAddr" readonly style="margin-bottom:0.5em;"><br>
		<button class="btn" type="button" onclick="goPopup()">주소검색</button>
		</div>

		<div>
			<select name="payid" style="width:60%; color:#888888; border:1px solid #ccc; padding:6px 0 9px 0">
				<option selected disabled>결제 방법 선택</option>
				<option value="deposit">무통장 입금</option>
				<option value="deposit">계좌이체</option>
				<optgroup label="신용카드">
					<option value="kmcard">국민카드</option>
					<option value="sscard">삼성카드</option>
					<option value="shcard">신한카드</option>
					<option value="hdcard">현대카드</option>
				</optgroup>
				<optgroup label="간편결제">
					<option value="sspay">삼성페이</option>
					<option value="naverpay">네이버페이</option>
					<option value="kakaopay">카카오페이</option>
					<option value="payco">페이코</option>
				</optgroup>
			</select>
		</div> 
		<br><br><br><br>

		<div class="inputArea">
			<button type="submit" class="purchase_btn">결제</button>
			<button type="button" class="cancel_btn">취소</button>

			<script>
				$(".cancel_btn").click(function() {
					var confirm_val = confirm("주문을 취소하시겠습니까?");
					location.href = "/myflexbag/clist.mc"
				});

				$(".purchase_btn").submit(function() {
					//결제 버튼 누르면 주문완료 페이지로 
					var confirm_val = confirm("결제하시겠습니까?");
					if (confirm_val) {
						return true	
					} else {
						return false
					}
				});
			</script>

		</div>

	</form>
</div>
</div>

<script>
function goPopup() {
	var pop = window.open("view/user/jusoPopup.jsp", "pop",
			"width=570,height=420, scrollbars=yes, resizable=yes");
};

function jusoCallBack(roadFullAddr) {
	document.getElementById("userAddr").value = roadFullAddr;
};
</script>