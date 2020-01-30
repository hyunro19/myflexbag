<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
	<h1>Item Update</h1>
	<div class=centermain>
	
<form action="iupdateimpl.mc" method="post">

<label>상품 아이디</label>
<div class=div_text>
	<input type="text" name="pid" value="${ditem.pid }" readonly="readonly">
</div>

<label>상품 이름</label>
<div class=div_text>
	<input type="text" name="pname" value="${ditem.pname }">
</div>

<label>가격</label>
<div class=div_text>
	<input type="text" name="price" value="${ditem.price }">
</div>

<label>카테고리</label>
<div class=div_text>
	<select name="cateid">
		<option value="${ditem.cateid }" selected disabled hidden="hidden">${ditem.cateid }</option>
		<option value="shoulder">숄더</option>
		<option value="tote">토트</option>
		<option value="backpack">백팩</option>
		<option value="messenger">메신저</option>
		<option value="clutch">클러치</option>
		<option value="wallet">지갑</option>
		<option value="etc">기타</option>
	</select>
</div>

<label>사이즈</label>
<div class=div_text>
	<select name="sizeid">
		<option value="${ditem.sizeid }" selected hidden="hidden">${ditem.sizeid }</option>
		<option value="free">free</option>
		<option value="small">small</option>
		<option value="medium">medium</option>
		<option value="large">large</option>
	</select>
</div>

<label>색상</label>
<div class=div_text>
	<select name="colorid">
		<option value="${ditem.colorid }" selected hidden="hidden">${ditem.colorid }</option>
		<option value="black">black</option>
		<option value="blue">blue</option>
		<option value="red">red</option>
		<option value="green">green</option>
		<option value="yellow">yellow</option>
		<option value="orange">orange</option>
		<option value="pink">pink</option>
		<option value="navy">navy</option>
		<option value="grey">grey</option>
		<option value="etc">etc</option>
	</select>
</div>

<label>브랜드</label>
<div class=div_text>
	<select name="brandid">
		<option value="${ditem.brandid }" selected hidden="hidden">${ditem.brandid }</option>
		<option value="louisvuiton">루이비통</option>
		<option value="chanel">샤넬</option>
		<option value="ysl">생로랑</option>
		<option value="prada">프라다</option>
		<option value="gucci">구찌</option>
		<option value="fendi">펜디</option>
		<option value="botegaveneta">보테가베네타</option>
		<option value="givency">지방시</option>
		<option value="tumi">투미</option>
		<option value="cartier">까르띠에</option>
		<option value="hermes">에르메스</option>
	</select>
</div>

<label>재질</label>
<div class=div_text>
	<select name="matid">
		<option value="${ditem.matid }" selected hidden="hidden">${ditem.matid }</option>
		<option value="calfskin">소가죽</option>
		<option value="lambskin">양가죽</option>
		<option value="aligator">악어가죽</option>
		<option value="artficialleather">인조가죽</option>
		<option value="cotton">면</option>
		<option value="knit">니트</option>
		<option value="nylon">나일론</option>
	</select>
</div>

<label>이미지1</label>
<div class=div_text>
	<input type="text" name="img1" value="${ditem.img1 }">
</div>

<label>이미지2</label>
<div class=div_text>
	<input type="text" name="img2" value="${ditem.img2 }">
</div>

<label>이미지3</label>
<div class=div_text>
	<input type="text" name="img3" value="${ditem.img3 }">
</div>

<label>이미지4</label>
<div class=div_text>
	<input type="text" name="img4" value="${ditem.img4 }">
</div>

<label>이미지5</label>
<div class=div_text>
	<input type="text" name="img5" value="${ditem.img5 }">
</div>

<input type="submit" value="UPDATE"><br>
</form>

	</div>
</body>