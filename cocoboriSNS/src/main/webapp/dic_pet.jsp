<%@page import="com.smhrd.model.CocoPetDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.CocoPetDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>반려동물 백과사전</title>
<style type="text/css">
	@font-face {
		font-family: 'omyu_pretty';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2')
			format('woff2');
		font-weight: normal;
		font-style: normal;
	}

	.table .pet-state {
		background-color: #fafabe;
		opacity: 0.7;
	}
	 
	.table .pet-score {
		background: linear-gradient(to right, #ffe3ee, #f7e7b1);
		opacity: 0.8;
	}
	
	.icon_pet {
		width: 100px;
		height: 100px;
		margin: 10px;
		margin-right: 20px;
	}
	
	#top {
		background-image: url("./images/pet01.jpg");
	}
	
	
</style>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body class="is-preload" style="font-family: 'omyu_pretty'">

	<!-- Header -->
	<div id="header">

		<div class="top">

			<!-- Logo -->
			<div id="logo">
				<span class="image avatar48"><img src="images/retriever.webp"
					alt="" /></span>
				<h1 id="title">COCOBORI</h1>
				<p>반려동물 백과사전</p>
				
			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="main.jsp" id="main-link"><span
							class="icon solid fa-home">HOME</span></a></li>
				</ul>
				<ul>
					<li><a href="dic_pet.jsp" id="dic_pet"><span
							class="icon solid fa-home">반려동물 백과사전</span></a></li>
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
		<section id="top" class="#" style="padding-top: 20px; padding-bottom: 20px;">
			<h1>반려동물 백과사전</h1>
			<h4>반려동물들에 대한 모든것!</h4>
		</section>
		<!-- Portfolio -->
		<section id="portfolio" class="two">
			<div class="container-a" style="width: 70%; font-size: 18px;">
					<div>
					<img class="icon_pet" alt="" src="./images/icon_dog.gif">
					<button type="button" class="btn btn-light btn-lg" style="background-color: #55cbcd;" onclick="location.href='dic_dog.jsp'">강아지 백과사전</button>
					</div>
					<div>
					<img class="icon_pet" alt="" src="./images/icon_cat.gif">
					<button type="button" class="btn btn-light btn-lg" style="background-color: #caa6fe;" onclick="location.href='dic_cat.jsp'">고양이 백과사전</button>
					</div>
					<div>
					<img class="icon_pet" alt="" src="./images/icon_rep.gif">
					<button type="button" class="btn btn-light btn-lg" style="background-color: #a9d39e;" onclick="location.href='dic_rep.jsp'">파충류 백과사전</button>
					</div>
					<div>
					<img class="icon_pet" alt="" src="./images/icon_bird.gif">
					<button type="button" class="btn btn-light btn-lg" style="background-color: #b37c57;" onclick="location.href='dic_bird.jsp'">조 류 백과사전</button>
					<p>버튼 색상 및 디자인 고민중</p>
					</div>
				
				<!-- <video style="margin-top: 10px;" src="./images/video_dog.mp4" autoplay="autoplay" muted="muted" loop="loop" width="80%" height="50%">
				</video> -->
			
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>


</body>
</html>
	