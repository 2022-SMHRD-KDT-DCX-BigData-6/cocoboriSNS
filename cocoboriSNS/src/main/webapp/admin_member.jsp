<%@page import="com.smhrd.model.CocoMemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.CocoMemberDAO"%>
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


<%
	CocoMemberDAO dao = new CocoMemberDAO();
	List<CocoMemberDTO> list = dao.selectAllMember();
	%>
	<!-- Header -->
	<div id="header">

		<div class="top">

			<!-- Logo -->
			<div id="logo">
			<span class="image avatar48">
			<img style="width: 20%; height: 20%; margin-top: 10px; margin-left: 20px; border-radius:70% " src="images/admin.png" alt="" /></span>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="main.jsp" id="main-link"><span
							class="icon solid fa-home">홈</span></a></li>
					<li><a href="#portfolio" id="portfolio-link"><span
							class="icon solid fa-th">전체회원정보</span></a></li>
					<li><a href="#about" id="about-link"><span
							class="icon solid fa-user">About Me</span></a></li>
					<li><a href="login.jsp" id="contact-link"><span
							class="icon solid fa-envelope">Contact</span></a></li>
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
			<div class="container">
				<h1>회원정보조회</h1>
				<p>회원삭제가 가능한 관리자 페이지입니다.</p>
			</div>
		</section>
		
		
		<!-- Portfolio -->
		<section id="portfolio" class="two">
			
			<div class="container-b">
				
			<table class="table">
				<thead>

					<%
					for (CocoMemberDTO l : list) {
					%>
					<tr>
						<td><%=l.getUser_email()%></td>
						<td><%=l.getUser_name()%></td>
						<td><%=l.getUser_nick()%></td>
						<td><%=l.getUser_phone()%></td>
						<!-- 쿼리스트링방식 : url?name=value&name=value -->
						<td>
						
						<button type="button" class="btn btn-danger" onclick="location.href='DeleteService?user_email=<%=l.getUser_email()%>'">삭제</button>
						<%-- <a
							href="DeleteService?user_email=<%=l.getUser_email()%>">삭제</a> --%>
						</td>
					</tr>
					<%
					}
					%>
				
				</tbody>
			</table>
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