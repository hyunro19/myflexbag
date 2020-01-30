<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
	<p class="woocommerce-result-count">
		Showing ${pagenext.totalCount } results on current filtering conditions
	</p>

	<form action="ilist.mc" class="woocommerce-ordering" method="get">
		<c:if test="${not empty pageprev.cateid}">
			<input name="cateid" type="hidden" value="${pageprev.cateid }">
		</c:if>
		<c:if test="${not empty pageprev.brandid}">
			<input name="brandid" type="hidden" value="${pageprev.brandid }">
		</c:if>
		<c:if test="${not empty pageprev.matid}">
			<input name="matid" type="hidden" value="${pageprev.matid }">
		</c:if>					

		<select name="sortcon" class="orderby" style="width:60%; color:#888888; border:1px solid #ccc; padding:6px 0 9px 0">
			<option value="menu_order" selected="selected">Default sorting</option>
			<option value="popularity">Sort by popularity</option>
			<option value="pdate">Sort by newness</option>
			<option value="priceasc">Sort by price: low to high</option>
			<option value="pricedesc">Sort by price: high to low</option>
		</select>
		<input type=submit value="Apply" class="btn-sm">
	</form>
</div>

<ul class="products" style="margin-top:4em;">

	<c:forEach var="i" items="${ilist }">
		<li class="product" style="text-align:center">
		<a href="idetail.mc${pageprev.listLink }&page=${pagenext.page }&pid=${i.pid }">
			<!-- <span class="onsale">Sale!</span>  -->
		<div id="lab1">	<div id="lab2">	<div id="lab3">
		<img src="${i.img1}" alt="">		
		</div> </div> </div>
		
		<span style="font-size:larger; margin-top:0.5em;">${i.pname }<span>
		<span class="price" style="margin-bottom:-0.5em; margin-top:0.5em"><span class="amount" style="font-size:medium;">
			<fmt:formatNumber pattern="###,###,###" value="${i.price}" />원
		</span></span>
		</span></span>
		</a>
		
		<div class="quantity">
		<input type="number" step="1" min="1" max="${i.pstock }" name="quantity" value="1" title="Qty" class="input-text qty text" size="4"/>
		<a id="${i.pid }" class="single_add_to_cart_button button" style="float:none; padding:1.05em 1.5em 1.05em 1.5em; margin-bottom:0.4em">Cart</a>
		</div>
		
		</li>
	</c:forEach>	
	
</ul>

		<!-- paging navigation -->
		<jsp:include page="/view/pagenav.jsp" />
	
			<!-- #main -->
		<!-- #primary -->

<c:choose>

	<c:when test="${loginid == 'admin' }">
		<div style="text-align:center;"><div style="display:inline-block;">
		<a href="iadd.mc">Item ADD</a>
		</div></div>
	</c:when>
	<c:otherwise>
				
	</c:otherwise>
</c:choose> 