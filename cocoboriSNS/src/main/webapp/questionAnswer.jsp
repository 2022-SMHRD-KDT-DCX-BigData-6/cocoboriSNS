<%-- <%@page import="com.smhrd.model.CocoMemberDTO"%> --%>
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
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
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

	<% 
		CocoMemberDTO member = (CocoMemberDTO)session.getAttribute("loginMember");
		String num = request.getParameter("num");
	%>
	
	<!-- Header -->
	<div id="header">

		<div class="top">

			<!-- Logo -->
			<div id="logo">
				<!-- 프로필 사진 넣는 자리 -->
				<span class="image avatar48">
					<img alt="" src="<%= "./upload/" + member.getUser_file()%>">
				</span>
				<h1 id="title">COCOBORI</h1>
				<p><%= member.getUser_nick()%>님</p>
			</div>

			<!-- Nav -->
			<nav id="nav">
            <ul>
               <li><a href="main.jsp" id="top-link"><span class="icon solid fa-home">홈</span></a></li>
               <% if (member == null) { %>
               <li><a href="login.jsp" id="login-link"><span class="icon solid fa-envelope">로그인</span></a></li>
               <li><a href="dic_pet.jsp" id="petinfo-link"><span class="icon solid fa-envelope">반려동물 백과사전</span></a></li>
                  <li><a href="veterinaryClinic.jsp" id="loc-link"><span class="icon solid fa-envelope">주변 정보</span></a></li>
               <% } else { %>
                  <% if(member.getUser_email().equals("admin@admin.com")) { %>
                  <li><a href="admin_member.jsp" id="admin-link"><span class="icon solid fa-th">전체회원정보</span></a></li>
                  <li><a href="LogoutService" id="logout-link"><span class="icon solid fa-user">로그아웃</span></a></li>
                  <li><a href="dic_pet.jsp" id="petinfo-link"><span class="icon solid fa-envelope">반려동물 백과사전</span></a></li>
                  <li><a href="veterinaryClinic.jsp" id="loc-link"><span class="icon solid fa-envelope">주변 정보</span></a></li>
                  <li><a href="questionReportAdmin.jsp" id="community-link"><span class="icon solid fa-envelope">문의 및 신고</span></a></li> 
                  <% } else { %>
                  <li><a href="my_page.jsp" id="my-link"><span class="icon solid fa-envelope">마이페이지</span></a></li>
                  <li><a href="board.jsp" id="community-link"><span class="icon solid fa-envelope">커뮤니티</span></a></li>
                  <li><a href="friend.jsp" id="community-link"><span class="icon solid fa-envelope">친구</span></a></li>
                  <li><a href="dic_pet.jsp" id="petinfo-link"><span class="icon solid fa-envelope">반려동물 백과사전</span></a></li>
                  <li><a href="veterinaryClinic.jsp" id="loc-link"><span class="icon solid fa-envelope">주변 정보</span></a></li>
                  <li><a href="question.jsp" id="community-link"><span class="icon solid fa-envelope">문의 및 신고</span></a></li>
                  <li><a href="LogoutService" id="logout-link"><span class="icon solid fa-user">로그아웃</span></a></li>
                  <% } %>
               <% } %>
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
				<h1>문의 및 신고</h1>
				<p>코코보리 - 반려인과 반려동물을 위한 SNS</p>
			</div>
		</section>

		<!-- Portfolio -->
		<section id="#" class="two" style="text-align: center;">
			<div class="container-b">
				<form action="QuestionAnswerService.do" method="post">
					<table id="list">
						<tr>
							<td>번호</td>
							<td><input type="text" name="num" value="<%=num%>"></td>
						</tr>
						<tr>
							<td>답변</td>
							<td><textarea rows="10" name="answer" style="resize: none;" placeholder="답변을 입력하세요(300자 이내)"></textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="reset" value="초기화">
								<input type="submit" value="작성하기">
							</td>
						</tr>
					</table>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous">
	</script>

</body>
</html>