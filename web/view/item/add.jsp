<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<h2>Item Add</h2>
	<div class=centermain>

<form enctype="multipart/form-data" action="iaddimpl.mc" method="post">

<label for="productname">상품이름</label>
<div class=div_text>
	<input type="text" name="pname">
</div>

<label for="price">가격(KRW)</label>
<div class=div_text>
	<input type="number" name="price">
</div>

<label for="stock">재고(EA)</label>
<div class=div_text>
	<input type="number" name="pstock">
</div>

<label for="category">카테고리</label>
<div class=div_text>
	<select name="cateid">
		<option value="shoulder">숄더</option>
		<option value="tote">토트</option>
		<option value="backpack">백팩</option>
		<option value="messenger">메신저</option>
		<option value="clutch">클러치</option>
		<option value="wallet">지갑</option>
		<option value="etc">기타</option>
	</select>
</div>


<label for="size">사이즈</label>
<div class=div_text>
	<select name="sizeid">
		<option value="free">free</option>
		<option value="small">small</option>
		<option value="medium">medium</option>
		<option value="large">large</option>
	</select>
</div>

<label for="color">색상</label>
<div class=div_text>
	<select name="colorid">
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

<label for="brand">브랜드</label>
<div class=div_text>
	<select name="brandid">
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

<label for="material">재질</label>
<div class=div_text>
	<select name="matid">
		<option value="calfskin">소가죽</option>
		<option value="lambskin">양가죽</option>
		<option value="aligator">악어가죽</option>
		<option value="artficialleather">인조가죽</option>
		<option value="cotton">면</option>
		<option value="knit">니트</option>
		<option value="nylon">나일론</option>
	</select>
</div>

<label for="img1">이미지1</label>
<div class=div_text>
	<input type="file" name="mf1" style="margin:0 auto">	
</div>

<label for="img2">이미지2</label>
<div class=div_text>
	<input type="file" name="mf2" style="margin:0 auto">
</div>

<label for="img3">이미지3</label>
<div class=div_text>
	<input type="file" name="mf3" style="margin:0 auto">
</div>

<label for="img4">이미지4</label>
<div class=div_text>
	<input type="file" name="mf4" style="margin:0 auto">
</div>

<label for="img5">이미지5</label>
<div class=div_text>
	<input type="file" name="mf5" style="margin:0 auto">
</div>

<input type="submit" value="ADD"><br>

</form>

</div>
</body>