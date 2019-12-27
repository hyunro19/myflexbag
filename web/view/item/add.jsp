<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>Item Add Page</h1>
<form enctype="multipart/form-data" action="iaddimpl.mc" method="post">

상품 아이디(seq) <br>
상품 이름<input type="text" name="pname"><br>
가격(KRW)<input type="number" name="price"><br>
재고(EA)<input type="number" name="pstock"><br>
카테고리<select name="cateid">
	<option value="shoulder">숄더</option>
	<option value="tote">토트</option>
	<option value="backpack">백팩</option>
	<option value="messenger">메신저</option>
	<option value="clutch">클러치</option>
	<option value="wallet">지갑</option>
	<option value="etc">기타</option>
</select><br>
사이즈<select name="sizeid">
	<option value="free">free</option>
	<option value="small">small</option>
	<option value="medium">medium</option>
	<option value="large">large</option>
</select><br>
색상<select name="colorid">
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
</select><br>
브랜드<select name="brandid">
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
</select><br>
재질<select name="matid">
	<option value="calfskin">소가죽</option>
	<option value="lambskin">양가죽</option>
	<option value="aligator">악어가죽</option>
	<option value="artficialleather">인조가죽</option>
	<option value="cotton">면</option>
	<option value="knit">니트</option>
	<option value="nylon">나일론</option>
</select><br>
그림1<input type="file" name="mf1"><br>
그림2<input type="file" name="mf2"><br>
그림3<input type="file" name="mf3"><br>
그림4<input type="file" name="mf4"><br>
그림5<input type="file" name="mf5"><br>
<input type="submit" value="ADD"><br>

</form>