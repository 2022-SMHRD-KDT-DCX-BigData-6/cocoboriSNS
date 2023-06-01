
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
<link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- CSS only -->
</head>
<body class="is-preload" style="font-family: 'omyu_pretty'">
	<% CocoMemberDTO member = (CocoMemberDTO)session.getAttribute("loginMember"); %>
	<% String user_email = member.getUser_email(); %>
	<%-- <% String user_name = member.getUser_name(); %> --%>
	<!-- Header -->
	<div id="header">

		<div class="top">

			<!-- Logo -->
			<div id="logo">
				<span class="image avatar48"><img src="images/retriever.webp"
					alt="" /></span>
				<h1 id="title">COCOBORI</h1>
				<p>SIGN UP</p>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="main.jsp" id="main-link"><span
							class="icon solid fa-home">HOME</span></a></li>
					<li><a href="login.jsp" id="login-link"><span
							class="icon solid fa-th">LOGIN</span></a></li>
					
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
		<section id="top" class="#">
		<h1>UPDATE</h1>
		</section>
		
		<section id="portfolio" class="two">
			<div class="container-a">
				<h1><%= user_email %></h1>
			<%-- <h1><%= user_name %></h1> --%>
				<form action="UpdateService" method="post" enctype="multipart/form-data">
					<div class="form-floating">
						<input type="password" name="user_pw" class="form-control-sm"
							placeholder="Password">
					</div>
					<div class="form-floating">
						<input type="text" name="user_nick" class="form-control-sm"
							placeholder="Nick name">
					</div>
					<div class="form-floating">
						<input type="text" name="user_phone" class="form-control-sm"
							placeholder="Phone">
					</div>
					<div>
						<input type="file"	name="user_file" value="파일등록">
					</div>
					<div>
						<button style="margin-top: 10px" type="submit" class="btn btn-info">UPDATE</button>
					</div>
					
		
					<%-- <div>
					<button style="margin-top: 10px" type="button" class="btn btn-link" onclick="location.href='MemberDeleteService?user_email=<%=user_email%>'">회원탈퇴</button>
					</div> --%>
				
				

					<%-- <script type="text/javascript">
					alert("회원탈퇴 완료");
					function load()
					{
					window.location.href = "MemberDeleteService?user_email=<%=user_email%>";}
					</script> --%>

					<%-- <div>
					<button style="margin-top: 10px" type="button" class="btn btn-link" onclick="location.href='MemberDeleteService?user_email=<%=user_email%>'">회원탈퇴</button>
					</div> --%>
					
					<div>

					<button style="margin-top: 10px" type="button" class="btn btn-link" onclick="deleteMember()">회원탈퇴</button>
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