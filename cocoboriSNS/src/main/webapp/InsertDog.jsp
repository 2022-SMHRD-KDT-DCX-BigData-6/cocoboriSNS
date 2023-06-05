<%@page import="com.smhrd.model.CocoMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>반려동물 백과사전</title>
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
	
	<%
		CocoMemberDTO member = (CocoMemberDTO) session.getAttribute("loginMember");
	%>
	<!-- Header -->
	<div id="header">

		<div class="top">

			<!-- Logo -->
			<div id="logo">
				<!-- 프로필 사진 넣는 자리 -->
				<% if (member == null) {%>
					<span class="image avatar48">
						<img alt="" src="<%= "./images/foot.png"%>">
					</span>
				<% } else if (member.getUser_file() == null) {%>
					<span class="image avatar48">
						<img alt="" src="<%= "./images/foot.png"%>">
					</span>
				<% } else {%>
					<span class="image avatar48">
						<img alt="" src="<%= "./upload/" + member.getUser_file()%>">
					</span>
				<% }%>
			
				<h1 id="title">COCOBORI</h1>
				<p>
					<% if (member == null) {%>
						SNS
					<% } else {%>
						<%= member.getUser_nick()%>님
					<% }%>	
				</p>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="main.jsp" id="main-link"><span
							class="icon solid fa-home">HOME</span></a></li>
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
			<h1>반려동물 백과사전 데이터 등록</h1>
			
		</section>
		<!-- Portfolio -->
		<section id="portfolio" class="two">
			<div class="container-a" style="width: 70%; font-size: 20px;">
				<form action="InsertDog" method="post" enctype="multipart/form-data">
					<select style="margin-bottom: 10px" class="form-select" aria-label="Default select example" name="pet_type">
					<!-- 품종 대분류 -->
						<option selected>품종</option>
						<option value="강아지">강아지</option>
						<option value="고양이">고양이</option>
						<option value="파충류">파충류</option>
						<option value="조류">조류</option>
					</select>
					<!-- 품종 소분류 -->
					<div class="form-floating">
						<input type="text" name="pet_breed" class="form-control-sm" placeholder="상세품종">
					</div>
					<!-- 동물 사진 -->
					<div class="input-group mb-3">
						<input type="file" class="form-control" id="inputGroupFile02" name="pet_pic">
					</div>
					<!-- 적응력 지표 -->
					<div class="form-floating">
						<input type="text" name="pet_adaptno" class="form-control-sm" placeholder="적응력 지표 점수">
					</div>
					<div class="form-floating">
						<input type="text" name="pet_adapt" class="form-control-sm" placeholder="적응력 지표">
					</div>
					<!-- 실내 적합도 -->
					<div class="form-floating">
						<input type="text" name="pet_fitno" class="form-control-sm" placeholder="실내 적합도 점수">
					</div>
					<div class="form-floating">
						<input type="text" name="pet_fit" class="form-control-sm" placeholder="실내 적합도 지표">
					</div>
					<!-- 친화력 지표 -->
					<div class="form-floating">
						<input type="text" name="pet_affno" class="form-control-sm" placeholder="친화력 지표 점수">
					</div>
					<div class="form-floating">
						<input type="text" name="pet_aff" class="form-control-sm" placeholder="친화력 지표">
					</div>
					<!-- 건강 지표 -->
					<div class="form-floating">
						<input type="text" name="pet_healthno" class="form-control-sm" placeholder="건강 지표 점수">
					</div>
					<div class="form-floating">
						<input type="text" name="pet_health" class="form-control-sm" placeholder="건강 지표">
					</div>
					<!-- 훈련 습득력 -->
					<div class="form-floating">
						<input type="text" name="pet_trainno" class="form-control-sm" placeholder="훈련 습득력 점수">
					</div>
					<div class="form-floating">
						<input type="text" name="pet_train" class="form-control-sm" placeholder="훈련 습득력 지표">
					</div>
					<!-- 활동성 지표 -->
					<div class="form-floating">
						<input type="text" name="pet_actno" class="form-control-sm" placeholder="활동성 지표 점수">
					</div>
					<div class="form-floating">
						<input type="text" name="pet_act" class="form-control-sm" placeholder="활동성 지표">
					</div>
					<button type="submit" class="btn btn-warning">동물백과 등록</button>
					<button type="button" class="btn btn-light" style="background-color: #b37c57;" onclick="location.href='InsertPet.jsp'">뒤로가기</button>
				</form>
				
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
			<!-- 		<button type="submit" class="btn btn-warning">LOGIN</button>
					<button type="button" class="btn btn-info"
						onclick="location.href='join.jsp'">SIGN UP</button> -->
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