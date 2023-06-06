<%@page import="com.smhrd.model.CocoMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>COCOBORI</title>
<style type="text/css">
	@font-face {
   	 	font-family: 'omyu_pretty';
   	 	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    	font-weight: normal;
   	 	font-style: normal;
	}
</style>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="is-preload" style="font-family: 'omyu_pretty'">

	<% CocoMemberDTO member = (CocoMemberDTO)session.getAttribute("loginMember"); %>	
	<!-- Header -->
	<div id="header">

		<div class="top">

			<!-- Logo -->
			<div id="logo">
<!-- ================================================================================ -->			
				<!-- 프로필 사진 넣는 자리 -->
				
				<span class="image avatar48">
					<img  src="<%= "./images/cocobori_logo.png" %>">
				</span>
				
				
				
				
				<%-- <% if (member != null){ %>
				<span class="image avatar48" >
					<img alt="" src="<%= "./upload/"+ member.getUser_file() %>">
				</span>
				<%}else{ %>
				<span class="image avatar48">
					<img src="<%= "./images/cocobori_logo_1.png" %>">
				</span>
				<%} %>
				<p>
					<% if (member == null) { %><!-- 	<h1 id="title">COCOBORI</h1> -->
						SNS	
					<% } else { %>
						<%= member.getUser_nick() %>님
					<% } %>	
				</p> --%>
<!-- ================================================================================ -->			
			
<!-- ================================================================================ -->			
			
<!-- ================================================================================ -->			
			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="main.jsp" id="top-link"><span class="icon solid fa-home">홈</span></a></li>
					<% if (member == null) { %>
					<li><a href="login.jsp" id="login-link"><span class="icon solid fa-envelope">로그인</span></a></li>
					<% } else { %>
						<% if(member.getUser_email().equals("admin@admin.com")) { %>
						<li><a href="admin_member.jsp" id="admin-link"><span class="icon solid fa-th">전체회원정보</span></a></li>
						<li><a href="LogoutService" id="logout-link"><span class="icon solid fa-user">로그아웃</span></a></li>
						<% } else { %>
						<li><a href="my_page.jsp" id="my-link"><span class="icon solid fa-envelope">마이페이지</span></a></li>
						<li><a href="LogoutService" id="logout-link"><span class="icon solid fa-user">로그아웃</span></a></li>
						<% } %>
					<% } %>
						<li><a href="#" id="community-link"><span class="icon solid fa-envelope">커뮤니티</span></a></li>
						<li><a href="#" id="petinfo-link"><span class="icon solid fa-envelope">반려동물 정보</span></a></li>
						<li><a href="#" id="loc-link"><span class="icon solid fa-envelope">주변 정보</span></a></li>
					
				</ul>
			</nav>

		</div>

		<div class="bottom">

			<!-- Social Icons -->
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-github"><span
						class="label">Github</span></a></li>
				<li><a href="#" class="icon brands fa-dribbble"><span
						class="label">Dribbble</span></a></li>
				<li><a href="#" class="icon solid fa-envelope"><span
						class="label">Email</span></a></li>
			</ul>

		</div>

	</div>

	<!-- Main -->
	<div id="main">

		<!-- Intro -->
		<!-- <section id="top" class="#">
			<div class="container">
				<h1>메인페이지</h1>
				<p>코코보리 - 반려인과 반려동물을 위한 SNS</p>
			</div>
		</section> -->

		<!-- Portfolio -->
		<section id="#" class="two">
		<h1>메인페이지</h1>
		<h4>코코보리 - 반려인과 반려동물을 위한 SNS</h4>
			<div class="container">
				<div class="row">
					<div class="col-4 col-12-mobile">
						<article class="item">
							<a href="#" class="image fit"><img src="images/pic02.jpg"
								alt="" /></a>
							<header>
								<h3>Ipsum Feugiat</h3>
							</header>
						</article>
						<article class="item">
							<a href="#" class="image fit"><img src="images/pic03.jpg"
								alt="" /></a>
							<header>
								<h3>Rhoncus Semper</h3>
							</header>
						</article>
					</div>
					<div class="col-4 col-12-mobile">
						<article class="item">
							<a href="#" class="image fit"><img src="images/cat_hat.jpg"
								alt="" /></a>
							<header>
								<h3>Magna Nullam</h3>
							</header>
						</article>
						<article class="item">
							<a href="#" class="image fit"><img src="images/pic05.jpg"
								alt="" /></a>
							<header>
								<h3>Natoque Vitae</h3>
							</header>
						</article>
					</div>
					<div class="col-4 col-12-mobile">
						<article class="item">
							<a href="#" class="image fit"><img src="images/pic06.jpg"
								alt="" /></a>
							<header>
								<h3>Dolor Penatibus</h3>
							</header>
						</article>
						<article class="item">
							<a href="#" class="image fit"><img src="images/pic07.jpg"
								alt="" /></a>
							<header>
								<h3>Orci Convallis</h3>
							</header>
						</article>
					</div>
				</div>

			</div>
		</section>
	</div>

	<!-- Footer -->
	<div id="footer">

		<!-- Copyright -->
		<ul class="copyright">
			<li>&copy; Untitled. All rights reserved.</li>
			<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
		</ul>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>