<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<title>장바구니</title>
</head>



<body>
	<div id="root">
		<section id="container">
			<div id="container_box">
				<section id="content">
					<h1>Cart List Page</h1>
				
					<ul>
						<li>
							<div class="allCheck" style="text-align: right; padding: 1em;">
								<input type="checkbox" name="allCheck" id="allCheck" />
								<label for="allCheck">모두 선택 </label>
								<button type="button" class="selectDelete_btn btn-sm"> 선택 삭제</button>
							</div>
						</li>
					</ul>

					<table class="table">
						<!-- jsp상의 변수 선언 -->
						<c:set var="sum" value="0" />
						<c:forEach items="${clist}" var="clist">
								<tr>
								<td class="checkBox">
									<input type="checkbox" name="chBox" class="chBox" data-cartNum="${clist.cartno}" />
								</td>
								<td style="min-width:100px; text-align:center; vertical-align:middle">
									<div id="lab1" style="padding-top:120%;">	<div id="lab2"> <div id="lab3">
										<img src="${clist.img}" style="vertical-align:middle;" />
									</div></div></div>
								</td>
								<td class="gdsInfo" >
									<table class="table" style="margin-bottom:0">
										<tr><td><div style="text-align:center;">상품명</div><td><td>${clist.pname}<td></tr>
										<tr><td><div style="text-align:center;">단 가</div><td><td>  <fmt:formatNumber pattern="###,###,###" value="${clist.price}" /> <td></tr>
										<tr>
											
											<td><div style="text-align:center;">수 량</div><td>
											<td>	
												<form name="form1" id="form1" method="post" action="/myflexbag/cupdate.mc">
												<input type="number" class="modify_num" name="amount" value="${clist.pnum}" min="1" style="width:20%; margin-right:1em;"> 개
												<input type="hidden" name="productId" value="${clist.pid }">
												<input type="hidden" name="userId" value="${clist.userid }">
												<button class="btn-sm" type="submit">수정</button>
												<button type="button" class="btn-sm delete_${clist.cartno}_btn" data-cartNum="${clist.cartno}">삭제</button>
												</form>
											<td>
										</tr>
										<tr><td><div style="text-align:center;">소 계</div><td><td><fmt:formatNumber pattern="###,###,###"	value="${clist.price * clist.pnum}" /><td></tr>
									</table>
								</td>
							</tr>
							<!-- 반복할 때마다 sum에 상품 가격(gdsPrice)*상품 갯수(cartStock)만큼을 더함 -->
						<c:set var="sum" value="${sum + (clist.price * clist.pnum)}" />

								<script>
									$(".delete_"+${clist.cartno}+"_btn").click(function(){
										var confirm_val = confirm("정말 삭제하시겠습니까?");
																	
										if(confirm_val) {
										var checkArr = new Array();
										checkArr.push($(this).attr("data-cartNum"));
																										
										$.ajax({
											url : "/myflexbag/deleteCart.mc",
											type : "post",
											data : { chbox : checkArr },
											success : function(result){
												if(result == 1) {                                    
													location.href = "/myflexbag/clist.mc";
												} else {
													alert("삭제 실패");
												}
												}
												});
										}   
									});
								</script>
						</c:forEach>
					</table>
					<br><br>

					<div class="listResult" style="margin:0 auto; text-align:center">
						<div class="sum" >
							<div style="display:inline-block">총 합계 :<fmt:formatNumber pattern="###,###,###" value="${sum}" />원</div>
							<div style="display:inline-block; ">
								<form id="order_form" action="orderCart.mc" method="post">
									<input type="hidden" name="amount" value="${sum}" style="margin-right:1em;"/>
									<button id="order_btn" type="submit">결제</button>	
								</form>
							</div>
						</div>
					</div>
				
				</section>
			</div>
		</section>
	</div>
	
		<script>
			$("#allCheck").click(function(){
				console.log('allchecked')
				var chk = $("#allCheck").prop("checked");
				if(chk) {
						$(".chBox").prop("checked", true);
						} else {
						$(".chBox").prop("checked", false);
						}
			});
		
			$(".selectDelete_btn").click(function(){
					console.log('select deleted')
					var confirm_val = confirm("정말 삭제하시겠습니까?");
					if(confirm_val) {
					var checkArr = new Array();
						// 체크된 체크박스의 갯수만큼 반복
						$("input[class='chBox']:checked").each(function(){
							checkArr.push($(this).attr("data-cartNum"));  // 배열에 데이터 삽입
						});
						$.ajax({
							url : "/myflexbag/deleteCart.mc",
							type : "post",
							data : { chbox : checkArr },
							success : function(result){
								if(result == 1) {                                    
													location.href = "/myflexbag/clist.mc";
												} else {
													alert("삭제 실패");
												}
											}
								});
						}   
			});

			$("#order_btn").click(function() {
				//결제 버튼 누르면 주문완료 페이지로 
				var confirm_val = confirm("카트에 담긴 상품을 주문하시겠습니까?");
				if (confirm_val) {
					$("#order_form").submit(function(){})
						return true	
						} else {
						return false
							}
				});

			
			$(".chBox").click(function(){
					$("#allCheck").prop("checked", false);
				});
	</script>
</body>