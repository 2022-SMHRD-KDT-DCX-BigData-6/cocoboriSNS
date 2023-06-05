<%@page import="com.smhrd.model.CocoBoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.CocoMemberDTO"%>
<%@page import="com.smhrd.model.CocoFriendDTO"%>
<%@page import="com.smhrd.model.CocoFriendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>COCOBORI</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
</head>
<body class="is-preload">

	<%
		CocoMemberDTO member = (CocoMemberDTO) session.getAttribute("loginMember");

		// 친구 정보
		@SuppressWarnings("unchecked")
		List<CocoMemberDTO> friendInfo = (List<CocoMemberDTO>)session.getAttribute("friendInfo");
		
		// 친구 활동 내력
		@SuppressWarnings("unchecked")
		List<CocoBoardDTO> friendHistory = (List<CocoBoardDTO>)session.getAttribute("friendHistory");
	%>

	<!-- Header -->
	<div id="header">

		<div class="top">

			<!-- Logo -->
			<div id="logo">
				<!-- 프로필 사진 넣는 자리 -->
				<% if (member.getUser_file() == null) {%>
					<span class="image avatar48">
						<img alt="" src="<%= "./images/foot.png"%>">
					</span>
				<% } else {%>
					<span class="image avatar48">
						<img alt="" src="<%= "./upload/" + member.getUser_file()%>">
					</span>
				<% }%>
				<h1 id="title">COCOBORI</h1>
				<p><%= member.getUser_nick()%>님</p>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="main.jsp" id="top-link"><span class="icon solid fa-home">HOME</span></a></li>
					<% if (member.getUser_email().equals("admin@admin.com")) {%>
						<li><a href="admin_member.jsp" id="admin-link"><span class="icon solid fa-th">전체회원정보</span></a></li>
						<li><a href="LogoutService" id="logout-link"><span class="icon solid fa-user">로그아웃</span></a></li>
					<% } else {%>
						<li><a href="my_page.jsp" id="my-link"><span class="icon solid fa-envelope">마이페이지</span></a></li>
						<li><a href="LogoutService" id="logout-link"><span class="icon solid fa-user">로그아웃</span></a></li>
						<li><a href="friend.jsp" id="friend-link"><span class="icon solid fa-envelope">친구</span></a></li>
					<% }%>
					<li><a href="board.jsp" id="board-link"><span class="icon solid fa-envelope">게시판</span></a></li>
					<li><a href="#" id="petinfo-link"><span class="icon solid fa-envelope">반려동물 정보</span></a></li>
					<li><a href="veterinaryClinic.jsp" id="loc-link"><span class="icon solid fa-envelope">주변 정보</span></a></li>
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
				<h1>친구 정보</h1>
				<p>코코보리 - 반려인과 반려동물을 위한 SNS</p>
			</div>
		</section>

		<!-- Portfolio -->
		<section id="#" class="two">

			<div class="friend_list container" style="width: 1000px;">
				<div class="row" style="justify-content: center;">
					<div class="col-md-9">
						<table class="table">
						<tr>
							<td class="text-center" rowspan="2">
								<% if (friendInfo.get(0).getUser_file() == null) {%>
									<img alt="" src="<%= "./images/foot.png"%>" style="width: 50px; height: 50px;">
								<% } else {%>
									<img alt="" src="<%= "./upload/" + friendInfo.get(0).getUser_file()%>">
								<% }%>
							</td>
							<td class="text-center">
								<%= friendInfo.get(0).getUser_email()%>
								<button type="button" onclick="location.href='DeleteFriend.do?friend_email=<%= friendInfo.get(0).getUser_email()%>'">언팔로우</button>
							</td>
						</tr>
						<tr>
							<td class="text-center" >
								<button type="button" onclick="location.href='chat.jsp'">채팅</button>
							</td>
						</tr>
						<tr>
							<td class="text-center" colspan="2">게시물</td>
						</tr>
						<% for (int i = 0; i < friendHistory.size(); i++) {%>
							<tr>
								<td colspan="2" onclick="location.href='#'"><%= friendHistory.get(i).getB_title()%></td>
							</tr>
						<% }%>
					</table>
					<button id="writer" onclick="location.href='friend.jsp'">친구 페이지</button>
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