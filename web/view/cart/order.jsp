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
<html>
<head>
<title>주문</title>

</head>


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
			
			<!-- 
		<p></p>
		<div class="inputArea">
			<p>
				<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
				<input type="text" id="sample2_postcode" placeholder="우편번호">
			</p>
			<p>	<input type="text" name="userAddr1" id="sample2_address" placeholder="주소"> </p>
			<p> <input type="text" name="userAddr2" id="sample2_detailAddress" placeholder="상세주소"> </p>
			<p>	<input type="text" name="userAddr3" id="sample2_extraAddress" placeholder="참고항목 (자동 입력)" readonly="readonly"> 	</p>

			<div id="layer" style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer"
					style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
					onclick="closeDaumPostcode()" alt="닫기 버튼">
			</div>

			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
			<script>
				// 우편번호 찾기 화면을 넣을 element
				var element_layer = document.getElementById('layer');

				function closeDaumPostcode() {
					// iframe을 넣은 element를 안보이게 한다.
					element_layer.style.display = 'none';
				}

				function sample2_execDaumPostcode() {
					new daum.Postcode(
							{
								oncomplete : function(data) {
									// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

									// 각 주소의 노출 규칙에 따라 주소를 조합한다.
									// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
									var addr = ''; // 주소 변수
									var extraAddr = ''; // 참고항목 변수

									//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
									if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
										addr = data.roadAddress;
									} else { // 사용자가 지번 주소를 선택했을 경우(J)
										addr = data.jibunAddress;
									}

									// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
									if (data.userSelectedType === 'R') {
										// 법정동명이 있을 경우 추가한다. (법정리는 제외)
										// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
										if (data.bname !== ''
												&& /[동|로|가]$/g.test(data.bname)) {
											extraAddr += data.bname;
										}
										// 건물명이 있고, 공동주택일 경우 추가한다.
										if (data.buildingName !== ''
												&& data.apartment === 'Y') {
											extraAddr += (extraAddr !== '' ? ', '
													+ data.buildingName
													: data.buildingName);
										}
										// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
										if (extraAddr !== '') {
											extraAddr = ' (' + extraAddr + ')';
										}
										// 조합된 참고항목을 해당 필드에 넣는다.
										document
												.getElementById("sample2_extraAddress").value = extraAddr;

									} else {
										document
												.getElementById("sample2_extraAddress").value = '';
									}

									// 우편번호와 주소 정보를 해당 필드에 넣는다.
									document.getElementById('sample2_postcode').value = data.zonecode;
									document.getElementById("sample2_address").value = addr;
									// 커서를 상세주소 필드로 이동한다.
									document.getElementById(
											"sample2_detailAddress").focus();

									// iframe을 넣은 element를 안보이게 한다.
									// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
									element_layer.style.display = 'none';
								},
								width : '100%',
								height : '100%',
								maxSuggestItems : 5
							}).embed(element_layer);

					// iframe을 넣은 element를 보이게 한다.
					element_layer.style.display = 'block';

					// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
					initLayerPosition();
				}

				// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
				// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
				// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
				function initLayerPosition() {
					var width = 300; //우편번호서비스가 들어갈 element의 width
					var height = 400; //우편번호서비스가 들어갈 element의 height
					var borderWidth = 5; //샘플에서 사용하는 border의 두께

					// 위에서 선언한 값들을 실제 element에 넣는다.
					element_layer.style.width = width + 'px';
					element_layer.style.height = height + 'px';
					element_layer.style.border = borderWidth + 'px solid';
					// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
					element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
							+ 'px';
					element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
							+ 'px';
				}
			</script>
		</div>
 -->



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
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("view/user/jusoPopup.jsp", "pop",
			"width=570,height=420, scrollbars=yes, resizable=yes");

	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
};

function jusoCallBack(roadFullAddr) {
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
	document.getElementById("userAddr").value = roadFullAddr;
};
</script>