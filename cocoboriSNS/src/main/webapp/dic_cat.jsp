<%@page import="com.smhrd.model.CocoMemberDTO"%>
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
	
	.sub_title {
		font-size: 30px;
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
		CocoMemberDTO member = (CocoMemberDTO) session.getAttribute("loginMember");
	%>
	<%
		CocoPetDTO pet = (CocoPetDTO)session.getAttribute("pet");
	%>
   
    <%
		CocoPetDAO dao = new CocoPetDAO();
		List<CocoPetDTO> petList = dao.selAllCat();
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
				<ul>
					<!-- 되돌아가기 : pet정보관련 session을 초기화 시켜주기 -->
					<li><a href="resetPet" id="dic_pet"><span
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
			<img class="icon_pet" alt="" src="./images/icon_cat.gif"><span class="sub_title">고양이 백과사전</span>

		</section>
		<!-- Portfolio -->
		<section id="portfolio" class="two" style="padding-top: 20px; padding-bottom: 20px;">
			<div class="container-a" style="width: 70%; font-size: 18px;">

				<form action="SelectCat" method="post" enctype="multipart/form-data">
					
					<!-- 품종 소분류 -->
					<select style="width:50%; height:50px; margin: auto;" class="form-select"
						aria-label="Default select example" name="pet_breed" id="pet_breed">
						<option selected>상세품종</option>
						
							<%
								for (int i = 0; i < petList.size(); i++) {
							%>
							<option value="<%=petList.get(i).getPet_breed()%>"><%=petList.get(i).getPet_breed()%></option>						
							<%
								}
							%>
					</select>
					<button style="margin-top: 10px;" type="submit" class="btn btn-warning">동물백과 조회</button>
					<button style="margin-top: 10px; background-color: #b37c57;" type="button" class="btn btn-light" onclick="location.href='dic_pet.jsp'">뒤로가기</button>
				</form>

				<%
					if (pet == null) {
				%>
				<!-- 동영상 올리기 -->
				<video style="margin-top: 10px; border-radius: 15px;"  src="./images/cat_sleep.mp4" autoplay="autoplay" muted="muted" loop="loop" width="60%" height="70%">
				</video>
				<%
					}
				%>
				<%
					if (pet != null) {
				%>
				<img alt="X" src="<%="./pet_file/" + pet.getPet_pic()%>"
					width="50%" height="40%" style="margin-bottom: 10px; margin-top: 10px; border-radius: 15px;">
				<h3><%=pet.getPet_breed()%></h3>
				<table class="table">

					<tr>
						<td class="pet-score">친화력 <%=pet.getPet_affno()%></td>
					</tr>
					<tr>
						<td class="pet-state" colspan="3"><%=pet.getPet_aff()%></td>
					</tr>
					<tr>
						<td class="pet-score">활동성 <%=pet.getPet_actno()%></td>
					</tr>
					<tr>
						<td class="pet-state" colspan="3"><%=pet.getPet_act()%></td>
					</tr>
					<tr>
						<td class="pet-score">건강 <%=pet.getPet_healthno()%></td>
					</tr>
					<tr>
						<td class="pet-state" colspan="3"><%=pet.getPet_health()%></td>
					</tr>
					<tr>
						<td class="pet-score">그루밍 난이도 <%=pet.getPet_groomno()%></td>
					</tr>
					<tr>
						<td class="pet-state" colspan="3"><%=pet.getPet_groom()%></td>
					</tr>
					

				</table>
				<%
				}
				%>
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