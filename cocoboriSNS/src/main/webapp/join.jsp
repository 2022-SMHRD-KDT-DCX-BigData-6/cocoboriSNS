
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
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">	
<link rel="stylesheet" href="assets/css/main.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- CSS only -->
</head>
<body class="is-preload" style="font-family: 'omyu_pretty'">
	<%String user_email = (String)session.getAttribute("user_email"); %>
	<!-- Header -->
	<div id="header">

		<div class="top">

			<!-- Logo -->
			<div id="logo">
				<span class="image avatar48"><img src="images/foot.png"
					alt="" /></span>
				<h1 id="title">COCOBORI</h1>

			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="main.jsp" id="main-link"><span
							class="icon solid fa-home">홈</span></a></li>
					<li><a href="login.jsp" id="login-link"><span
							class="icon solid fa-th">로그인</span></a></li>
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
		<h1>회원가입</h1>
		<h3> 귀여운 동물들의 사진과 동영상을 보려면 가입하세요!</h3>
		</section>
		
		<section id="portfolio" class="two">
			<div class="container-a">
				<form action="JoinService" method="post" enctype="multipart/form-data">
				
				<input type="hidden" name="chk" value="0">
				
					<div class="form-floating">
						<input type="email" name="user_email" class="form-control-sm"
							placeholder="이메일주소">
						
						<!-- <button type="button" style="margin-top: 10px" class="btn btn-success" onclick="fn_idcheck()" >중복아이디체크</button> -->
					
					</div>
					<div class="form-floating">
					
						<input type="password" name="user_pw" class="form-control-sm"
							placeholder="비밀번호">
					</div>
					<div class="form-floating">
						<input type="text" name="user_name" class="form-control-sm"
							placeholder="사용자 이름">
					</div>
					<div class="form-floating">
						<input type="text" name="user_nick" class="form-control-sm"
							placeholder="닉네임">
					</div>
					<div class="form-floating" >
						<input type="text" name="user_phone" class="form-control-sm" 
							placeholder="휴대폰 번호">
					</div>
					
					<div class="mb-3">
 					 <label for="formFileMultiple" class="form-label">프로필사진을 등록해주세요!</label>
 					 <input class="form-control" type="file" name="user_file" multiple>
					</div>
					
					<!-- <div>
						<input type="file" name="user_file" value="파일등록">
					</div> -->
					
					
					
					<div>
						<button style="margin-top: 10px" type="submit" class="btn btn-warning" onclick="joinMember()" >회원가입</button>
					</div>
					
					
					<script>
					function joinMember() {
  						window.location.href ="JoinService";
  						if(user_email != null){
  							alert("회원가입 성공");	
  						}else {
  							alert("회원가입 실패");
  						}
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