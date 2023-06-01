<%@page import="com.smhrd.model.CocoFriendDAO"%>
<%@page import="com.smhrd.model.CocoFriendDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.CocoMemberDTO"%>
<%@page import="com.smhrd.model.CocoMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>COCOBORI</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="is-preload">

	<%
		CocoMemberDTO member = (CocoMemberDTO) session.getAttribute("loginMember");
	%>
	
	<!-- Header -->
	<div id="header">

		<div class="top">

			<!-- Logo -->
			<div id="logo">
				<!-- 프로필 사진 넣는 자리 -->
				<span class="image avatar48"><img src="images/retriever.webp"
					alt="" /></span>
				<h1 id="title">COCOBORI</h1>
				<p>
					<% if (member == null) {%>
						친구
					<% } else {%>
						<%=member.getUser_nick()%>
					<% }%>
				</p>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="main.jsp" id="top-link"><span class="icon solid fa-home">HOME</span></a></li>
					<% if (member == null) {%>
						<li><a href="login.jsp" id="login-link"><span class="icon solid fa-envelope">LOGIN</span></a></li>
					<% } else {%>
						<% if (member.getUser_email().equals("admin@admin.com")) {%>
							<li><a href="admin_member.jsp" id="admin-link"><span class="icon solid fa-th">전체회원정보</span></a></li>
							<li><a href="LogoutService" id="logout-link"><span class="icon solid fa-user">로그아웃</span></a></li>
						<% } else {%>
							<li><a href="friend.jsp" id="friend-link"><span class="icon solid fa-envelope">친구</span></a></li>
							<li><a href="chat.jsp" id="community-link"><span class="icon solid fa-envelope">SNS</span></a></li>
							<li><a href="my_page.jsp" id="my-link"><span class="icon solid fa-envelope">마이페이지</span></a></li>
							<li><a href="LogoutService" id="logout-link"><span class="icon solid fa-user">로그아웃</span></a></li>
						<% }%>
					<% }%>
						<li><a href="#" id="petinfo-link"><span class="icon solid fa-envelope">반려동물 정보</span></a></li>
						<li><a href="#" id="loc-link"><span class="icon solid fa-envelope">주변 정보</span></a></li>
				</ul>
			</nav>

		</div>

		<div class="bottom">

			<!-- Social Icons -->
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
				<li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
				<li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
			</ul>

		</div>

	</div>

	<!-- Main -->
	<div id="main">

		<!-- Intro -->
		<section id="top" class="#">
			<div class="container">
				<h1>친구 추가</h1>
				<p>코코보리 - 반려인과 반려동물을 위한 SNS</p>
			</div>
		</section>

		<!-- Portfolio -->
		<section id="#" class="two">

			<div class="friend_list container">
				<div class="row">
					<div id="board">
						<form action="FriendSearch2.jsp">
							<table id="list">
								<tr>
									<td><input type="text" placeholder="이메일을 입력해주세요" name="searchFriend"></td>
									<td><input type="submit" value="검색"></td>
								</tr>
							</table>
						</form>
						<a href="main.jsp"><button id="writer">홈으로가기</button></a>
						<!-- 경로 변경 -->
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>