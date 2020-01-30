<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="content" class="site-content">
	<div id="primary" class="content-area column full">
		<main id="main" class="site-main" role="main">
		<div id="container">
		<div id="content" role="main">
				<nav class="woocommerce-breadcrumb" itemprop="breadcrumb"><a href="ilist.mc${pagelink }&page=${pagevo.page }"><button class="btn">BACK TO LIST</button></a></nav>
				<div itemscope itemtype="http://schema.org/Product" class="product">
					<div class="images">
						<a href="" itemprop="image" class="woocommerce-main-image zoom" title="" data-rel="prettyPhoto">								
						<img src="${ditem.img1 }" alt=""></img></a>
					</div>
					<div class="summary entry-summary">
						<h1 itemprop="name" class="product_title entry-title">${ditem.pname }</h1>
						<div class="woocommerce-product-rating" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
							<a href="#reviews" class="woocommerce-review-link" rel="nofollow"><span itemprop="reviewCount" class="count"></span> Read Customer Reviews</a>
						</div>
						<div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
							<p class="price">
								<span class="amount">
									<fmt:formatNumber pattern="###,###,###" value="${ditem.price}" />원
								</span>
							</p>
							<meta itemprop="price" content="35"/>
							<meta itemprop="priceCurrency" content="USD"/>
							<link itemprop="availability" href="http://schema.org/InStock"/>
						</div>
						<div itemprop="description">
							<p style="line-height:2em;">
								Welcome to the website. If you're here, you're likely looking to find random words. Random Word Generator is the perfect tool to help you do this. While this tool isn't a word creator, it is a word generator that will generate random words for a variety of activities or uses. Even better, it allows you to adjust the parameters of the random words to best fit your needs.

							</p>
						</div>
						
						<form class="cart" method="post" enctype='multipart/form-data' action="cadd.mc?pid=">
							<div class="quantity">
								<input type="number" step="1" min="1" max="${ditem.pstock }" name="quantity" value="1" title="Qty" class="input-text qty text" size="4"/>
								<a id="${ditem.pid }" class="single_add_to_cart_button btn button" style="float:none; padding:1.05em 1.5em 1.05em 1.5em; margin-bottom:0.4em">CART</a>
							</div>
							
						</form>
						<div class="product_meta">
							<span class="posted_in">DETAILS 
							<a href="/myflexbag/ilist.mc?cateid=${ditem.cateid }" rel="tag"> ${ditem.cateid }</a>
							<a href="/myflexbag/ilist.mc?sizeid=${ditem.sizeid }" rel="tag"> ${ditem.sizeid }</a>
							<a href="/myflexbag/ilist.mc?colorid=${ditem.colorid }" rel="tag"> ${ditem.colorid }</a> 
							<a href="/myflexbag/ilist.mc?brandid=${ditem.brandid }" rel="tag"> ${ditem.brandid }</a> 
							<a href="/myflexbag/ilist.mc?matid=${ditem.matid }" rel="tag"> ${ditem.matid }</a>
							</span>
						</div>
					</div>
					<!-- .summary -->
					<div class="woocommerce-tabs wc-tabs-wrapper">
							<div class="panel entry-content wc-tab" id="tab-description">
							<br><br><br>
							<h2>Product Description</h2>
							<p style="line-height:2.5em; width:70%; display:inline-block;">
							Welcome to the website. If you're here, you're likely looking to find random words. Random Word Generator is the perfect tool to help you do this. While this tool isn't a word creator, it is a word generator that will generate random words for a variety of activities or uses. Even better, it allows you to adjust the parameters of the random words to best fit your needs.
							The first option the tool allows you to adjust is the number of random words to be generated. You can choose as many or as few as you'd like. You also have the option of choosing words that only begin with a certain letter, only end with a certain letter or only begin and end with certain letters. If you leave these blank, the randomize words that appear will be from the complete list.
					You also have the option of choosing the number of syllables of the words or the word length of the randomized words. There are also options to further refine by choosing "less than" or "greater than" options for both syllables and word length. Again, if you leave the space blank, the complete list of randomized words will be used.

								<br><br>
								<img src="${ditem.img1 }" alt="" width="80%"> <br><br>
								<img src="${ditem.img2 }" alt="" width="80%"> <br><br>
								<img src="${ditem.img3 }" alt="" width="80%"> <br><br>
								<img src="${ditem.img4 }" alt="" width="80%"> <br><br>
								<img src="${ditem.img5 }" alt="" width="80%"> <br><br>
																		
							</p>
						</div>
						<div class="panel entry-content wc-tab" id="tab-reviews">
							<div id="reviews">
								<div id="comments">
									<ol class="commentlist">
							<h2> REVIEWS </h2>	
							<br>		
							<c:forEach items="${reviewList }" var="rarticle">	
										<li itemprop="review" itemscope itemtype="http://schema.org/Review" class="comment">
										<div id="comment-3" class="comment_container">
											<div class="comment-text">	
												<p class="meta">
													<strong itemprop="author">${rarticle.userid }</strong> &ndash; <time itemprop="datePublished" datetime="2013-06-07T15:54:25+00:00">${rarticle.rvdate }</time>:
												</p>
												<div itemprop="description" class="description">
													<p> <b>TITLE &nbsp;&nbsp;</b> ${rarticle.rvtitle } 	</p>
													<p> <b style="display:inline-block; margin-bottom:0.5em">CONTENT</b><br> ${rarticle.rvcon } 	</p>
												</div>
											</div>
										</div>
										</li>
							</c:forEach>
										
									<!-- #comment-## -->
								</ol>
							</div>
							<div class="clear">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
			
		<c:choose>
			<c:when test="${loginid == 'admin' }">
			<div style="text-align:center;"><div style="display:inline-block;">
				<a href="idel.mc?pid=${ditem.pid }">DELETE</a>
				<a href="iupdate.mc?pid=${ditem.pid }">UPDATE</a>
				</div></div>
			</c:when>
			<c:otherwise>
				
			</c:otherwise>
		</c:choose> 
		
		</div>
		</main>
		<!-- #main -->
	</div>
	<!-- #primary -->
</div>