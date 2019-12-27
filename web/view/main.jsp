<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MY FLEX BAG</title>

<script src='view/js/jquery.js'></script>
<script src='view/js/plugins.js'></script>
<script src='view/js/scripts.js'></script>
<script src='view/js/masonry.pkgd.min.js'></script>
<script src='view/js/bootstrap.min.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<link rel='stylesheet' href='view/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='view/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='view/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='view/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='view/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='view/css/bootstrap-theme.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='view/css/bootstrap.css' type='text/css' media='all'/>

<script>
	window.onload = function(){
		$(".single_add_to_cart_button").click(function(){
			var pid = $(this).attr('id');
			var pnum = $(this).prev().val();
			var data = {
				pid : pid,
			    pnum : pnum
		  		};
			$.ajax({
				url : "/myflexbag/cadd.mc",
				type : "post",
				data : data,
				success : function(result){
				    alert("상품이 카트에 담겼습니다.");
				    $(".numBox").val("1");
				   },
				error : function(){
				alert("상품을 카트에 담는데 실패하였습니다.");
				   }
				});
				});
		}
</script>
</head>

<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
<div id="page">
	<div class="container">
			<header id="masthead" class="site-header">
				<ul id="top_nav">
					<c:choose>
						<c:when test="${loginid == null }">
							<li><a href="clist.mc">CART</a></li>
							<li><a href="login.mc">LOGIN</a></li>
							<li><a href="uadd.mc">REGISTER</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="clist.mc">CART</a></li>
							<li><a href="mypage.mc">MY PAGE</a></li>
							<li><a href="logout.mc">LOGOUT</a></li>
							<li>${uname }님 반갑습니다!</li>
						</c:otherwise>
					</c:choose>
				</ul>

				<div class="site-branding">
					<div id="logo">
						<a href="main.mc"><img src="view/img/title.jpg"></a>
					</div>
					<br>
					<h2 class="site-description">Luxury bags for Men</h2>
				</div>

				<nav id="site-navigation" class="main-navigation">
					<button class="menu-toggle">Menu</button>

					<script>$('#site-navigation').click( function(){
							$(this).toggleClass("toggled");
					});
					</script>

					<a class="skip-link screen-reader-text" href="#content">Skip to content</a>
					<div class="menu-menu-1-container">
						<ul id="menu-menu-1" class="menu nav-menu">
						<li><a href="ilist.mc?sortcon=pdate">NEW</a></li>
							<li><a href="ilist.mc?sortcon=popularity">BEST</a></li>
							<li><a href="ilist.mc">CATEGORY</a>
								<ul class="sub-menu">
									<li><a href="ilist.mc?cateid=shoulder">SHOULDER</a></li>
									<li><a href="ilist.mc?cateid=tote">TOTE</a></li>
									<li><a href="ilist.mc?cateid=backpack">BACKPACK</a></li>
									<li><a href="ilist.mc?cateid=messenger">MESSENGER</a>
									<li><a href="ilist.mc?cateid=clutch">CLUTCHES</a></li>
									<li><a href="ilist.mc?cateid=wallet">WALLET</a></li>
								</ul></li>
							<li><a href="ilist.mc">BRAND</a>
								<ul class="sub-menu">
									<li><a href="ilist.mc?brandid=louisvuiton">LOUISVUITON</a></li>
									<li><a href="ilist.mc?brandid=chanel">CHANEL</a></li>
									<li><a href="ilist.mc?brandid=ysl">YSL</a></li>
									<li><a href="ilist.mc?brandid=prada">PRADA</a></li>
									<li><a href="ilist.mc?brandid=gucci">GUCCI</a></li>
									<li><a href="ilist.mc?brandid=fendi">FENDI</a></li>
									<li><a href="ilist.mc?brandid=botegaveneta">BOTEGAVENETA</a></li>
									<li><a href="ilist.mc?brandid=givency">GIVENCY</a></li>
									<li><a href="ilist.mc?brandid=cartier">CARTIER</a></li>
									<li><a href="ilist.mc?brandid=hermes">HERMES</a></li>
								</ul></li>
							<li><a href="ilist.mc">MATERIAL</a>
								<ul class="sub-menu">
									<li><a href="ilist.mc?matid=calfskin">CALFSKIN</a></li>
									<li><a href="ilist.mc?matid=lambskin">LAMBSKIN</a></li>
									<li><a href="ilist.mc?matid=aligator">ALIGATOR</a></li>
									<li><a href="ilist.mc?matid=nylon">NYLON</a></li>
									<li><a href="ilist.mc?matid=cotton">COTTON</a></li>
								</ul></li>
							
							<li><a href="#">BOARDS</a>
								<ul class="sub-menu">
									<li><a href="qna_index.mc"># Q N A</a></li>
									<li><a href="review.mc"># REVIEW</a></li>
								</ul></li>
						</ul>
					</div>
				</nav>
			</header>
			<!-- #masthead -->
			<div id="content" class="site-content">
			<div id="primary" class="content-area column full">
			<main id="main" class="site-main" role="main">
			<!-- center area -->

				<c:choose>
					<c:when test="${center == null }">
						<jsp:include page="center.jsp" />
					</c:when>
					<c:otherwise>
						<jsp:include page="${center }.jsp" />
					</c:otherwise>
				</c:choose> 

			<!-- center area -->
			</main>
		</div>
		<!-- #content -->
		</div>
		</div>
		<!-- container -->
		<footer id="colophon" class="site-footer">
		</footer>
		<a href="#top" class="smoothup" title="Back to top"><span
			class="genericon genericon-collapse"></span></a>
	</div>
	<!-- #page -->

</body>
</html>