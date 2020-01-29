<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id = "mainimg" >
<img src = "view/img/myflexbag.jpg" >
</div>

<div class="main_newbest">
	<h4> NEW ARRIVALS</h4>
</div>

<div class="grid portfoliogrid">

	<c:forEach var="l" items="${latest }">
		<article class="hentry">
			<header class="entry-header">
				<div class="entry-thumbnail">
					<div id="lab1"> <div id="lab2"> <div id="lab3">
					<a href="idetail.mc?pid=${l.pid }"><img
						src="${l.img1 }"
						class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
						alt="p1" style="max-width: auto; max-height:100%;"/></a>
					</div></div></div>
				</div>
				<h2 class="entry-title">
					<a href="#" rel="bookmark">${l.pname }</a>
				</h2>
				<a class='portfoliotype' href="/myflexbag/ilist.mc?brandid=${l.brandid }" rel="tag"> ${l.brandid }</a> 
				<a class='portfoliotype' href="/myflexbag/ilist.mc?cateid=${l.cateid }" rel="tag"> ${l.cateid }</a>
				<a class='portfoliotype' href="/myflexbag/ilist.mc?matid=${l.matid }" rel="tag"> ${l.matid }</a>
			</header>
		</article>
	</c:forEach>

</div>

<div class="main_newbest">
	<h4> BEST SELLERS </h4>
</div>

<div class="grid portfoliogrid">

	<c:forEach var="b" items="${best }">
		<article class="hentry">
			<header class="entry-header">
				<div class="entry-thumbnail">
					<div id="lab1"> <div id="lab2"> <div id="lab3">
					<a href="idetail.mc?pid=${b.pid }"><img
						src="${b.img1 }"
						class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
						alt="p1" style="max-width: auto; max-height:100%;"/></a>
					</div></div></div>
				</div>
				<h2 class="entry-title">
					<a href="#" rel="bookmark">${b.pname }</a>
				</h2>
				<a class='portfoliotype' href="/myflexbag/ilist.mc?brandid=${b.brandid }" rel="tag"> ${b.brandid }</a> 
				<a class='portfoliotype' href="/myflexbag/ilist.mc?cateid=${b.cateid }" rel="tag"> ${b.cateid }</a>
				<a class='portfoliotype' href="/myflexbag/ilist.mc?matid=${b.matid }" rel="tag"> ${b.matid }</a>
			</header>
		</article>
	</c:forEach>

</div>



