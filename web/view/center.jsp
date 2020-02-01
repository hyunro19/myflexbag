<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script>
	window.onload = function(){
		$('#popup').click();
	}
</script>
<div id = "mainimg" >
<img src = "view/img/myflexbag.jpg" >
</div>

<div class="main_newbest">
	<h4> NEW ARRIVALS</h4>
</div>

<div class="grid portfoliogrid">

	<c:forEach var="l" items="${latest }">
		<article class="hentry col-sm-12">
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
		<article class="hentry col-sm-12">
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
 
<!-- The Modal -->
    
<div class="col-md-6 col-lg-4">
	<div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal1">
		<span id="popup"></span>
	</div>
</div>

  <!-- Portfolio Modal 1 -->
  <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-body text-center">
          <div class="modal-container">
            <div class="row justify-content-center">
              <div>
                <!-- Portfolio Modal - Text -->
                <span class="mb-5">
                  	테스트를 위한 샘플 계정이 제공됩니다.<br><br>
                	ID : sample<br>
                	PW : sample</span><br><br>
                <button class="btn btn-primary" href="#" data-dismiss="modal">
                  CLOSE
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

