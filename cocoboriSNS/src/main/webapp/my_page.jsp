
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/87eea0d038.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- CSS only -->
</head>
<body class="is-preload" style="font-family: 'omyu_pretty'">
	<% CocoMemberDTO member = (CocoMemberDTO)session.getAttribute("loginMember"); %>
	<% String user_email = member.getUser_email(); %>
	<% String user_pw = member.getUser_pw(); %>
	<% String user_nick = member.getUser_nick(); %>
	<% String user_phone = member.getUser_phone(); %>
	
	<%-- <% String user_name = member.getUser_name(); %> --%>
	<!-- Header -->
	<div id="header">

		<div class="top">

			<!-- Logo -->
			<div id="logo">
			
			<span class="image avatar48">
					<img  src="<%= "./images/cocobori_logo.png" %>">
				</span>
			
				<br>
				<br>
				<br>
				<br>
				<br>
			
				<%-- <span class="image avatar48">
					<img alt="" src="<%= "./upload/"+ member.getUser_file() %>">
				</span>
				 --%>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<br>
				<br>
				<ul>
					<li><a href="main.jsp" id="main-link"><span
							class="icon solid fa-home">홈</span></a></li>
					<li><a href="LogoutService" id="login-link"><span
							class="icon solid fa-th">로그아웃</span></a></li>
					
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
		<section id="top" class="#" style="padding-top: 20px; padding-bottom: 20px" >
		<h1>마이페이지</h1>
		<p>비밀번호, 닉네임, 휴대폰번호를 변경할 수 있습니다.</p>
				<p><%= user_email %></p>
		</section>
		
		<section id="portfolio" class="two">
			<div class="container-a" >
				<form action="UpdateService" method="post" enctype="multipart/form-data">
						
						<div class="input-group mb-3" style="padding-bottom: 5px">
 						 <span class="input-group-text" id="modify" ><i class="fas fa-thin fa-lock"></i></span>
 						 <input type="text" class="form-control" name="user_pw" placeholder="변경할 비밀번호" aria-label="user_pw" aria-describedby="basic-addon1">
						</div>
						<div class="input-group mb-3" style="padding-bottom: 5px">
 						 <span class="input-group-text" id="modify"><i class="fas fa-thin fa-pencil"></i></span>
 						 <input type="text" class="form-control" name="user_nick" placeholder="변경할 닉네임" aria-label="user_nick" aria-describedby="basic-addon1">
						</div>
						<div class="input-group mb-3" style="padding-bottom: 5px">
 						 <span class="input-group-text" id="modify"><i class="fas fa-thin fa-phone"></i></span>
 						 <input type="text" class="form-control" name="user_phone" placeholder="변경할 휴대폰 번호" aria-label="user_phone" aria-describedby="basic-addon1">
						</div>
						
						
						
					<!-- <div class="form-floating">
						<input type="password" name="user_pw" class="form-control-sm"
							placeholder="변경할 비밀번호를 입력하세요">
						<input type="text" name="user_nick" class="form-control-sm"
							placeholder="변경할 닉네임을 입력하세요">
						<input type="text" name="user_phone" class="form-control-sm"
							placeholder="변경할 휴대폰 번호를 입력하세요">
					</div> -->
					
					
					
					<div class="mb-3">
 					 <label for="formFileMultiple" class="form-label">변경하고 싶은 사진을 등록해주세요!</label>
 					 <input class="form-control" type="file" name="user_file" multiple>
					</div>
					<div>
						<button style="margin-top: 10px" type="submit" class="btn btn-success">적용</button>
						<button style="margin-top: 10px" type="button" class="btn btn-secondary" onclick="deleteMember()">회원탈퇴</button>
					</div> 
	

					<script>
					function deleteMember() {
  					alert("회원탈퇴 완료");
  					window.location.href ="MemberDeleteService?user_email=<%=user_email%>";
					}
					</script>
				
					
				</form>
					
					
					
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
	<!-- JavaScript Bundle with Popper -->

</body>
</html>