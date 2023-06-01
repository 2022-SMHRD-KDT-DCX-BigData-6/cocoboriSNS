<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.CocoBoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.CocoBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>코코보리</title>
<!--

Template 2094 Mason

http://www.tooplate.com/view/2094-mason

-->

<!-- load stylesheets -->
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:300,400"> <!-- Google web font "Open Sans", https://fonts.google.com/ -->
<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css"> <!-- Font Awesome, http://fontawesome.io/ -->
<link rel="stylesheet" href="css/bootstrap.min.css"> <!-- Bootstrap styles, https://getbootstrap.com/ -->
<link rel="stylesheet" href="css/tooplate-style.css"> <!-- Templatemo style -->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
</head>
<body>
	<%
	List<CocoBoardDTO> board_list = new CocoBoardDAO().showBoard();
	%>
	<div class="container-fluid">
		<div class="tm-body">
			<div class="tm-sidebar sticky">
				<section id="welcome" class="tm-content-box tm-banner margin-b-15">
					<div class="tm-banner-inner">
						<h1><a href="index.jsp" class="tm-banner-title">코코보리</a></h1>
						<p class="tm-banner-subtitle">반려동물 SNS</p>
					</div>
				</section>
				<nav class="tm-main-nav">
					<ul class="tm-main-nav-ul">
						<li class="tm-nav-item"><a href="pet_info.jsp" class="tm-nav-item-link tm-button">반려동물 정보</a></li>
						<li class="tm-nav-item"><a href="board.jsp" class="tm-nav-item-link tm-button active">게시판</a></li>
						<li class="tm-nav-item"><a href="community.jsp" class="tm-nav-item-link tm-button">커뮤니티</a></li>
						<li class="tm-nav-item"><a href="info_me.jsp" class="tm-nav-item-link tm-button">내 주변 정보</a></li>
						<li class="tm-nav-item"><a href="#" class="tm-nav-item-link tm-button">로그인</a></li>
					</ul>
				</nav>
			</div>

			<div class="tm-main-content">
				<div class="container text-center">
					<div class="row">
						<div class="col-md-9">
							<table class="table">
								<tr>
									<td>번호</td>
									<td>제목</td>
									<td>작성자</td>
									<td>시간</td>
								</tr>
								<% for (int i = 0; i < board_list.size(); i++) {%>
								<tr>
									<td><%= i+1%></td>
									<!-- 1. 게시글 목록 세부페이지 기능(제목을 클릭하면 세부페이지 BoardDetail.jsp로 이동)-->
									<td><a href="BoardDetail.jsp?num=<%= board_list.get(i).getB_seq()%>"><%= board_list.get(i).getB_title()%></a></td>
									<td><%= board_list.get(i).getUser_email()%></td>
									<td><%= board_list.get(i).getUploaded_at()%></td>
								</tr>
								<% }%>
								<tr>
									<!-- 2.게시글 작성 -->
									<td>
										<a href="BoardWrite.jsp"><button id="write">작성</button></a>
									</td>
									
									<!-- 3.게시판 검색 -->
									<td align="right" colspan="3">
										<a href="#">
											<select class="form-select" aria-label="Default select example">
												<option value="title">제목</option>
												<option value="content">내용</option>
												<option value="writer">글쓴이</option>
												<option value="comment">댓글</option>
											</select>
											<input type="text"><button id="search">검색</button>
										</a>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<footer class="tm-footer text-right">
			<p>
				Copyright &copy; <span class="tm-current-year">2018</span> Your Company - Designed by 
				<a href="https://www.facebook.com/tooplate" target="_parent">Tooplate</a>
			</p>
		</footer>
	</div> <!-- container-fluid -->

	<!-- load JS files -->
	<script src="js/jquery-1.11.3.min.js"></script>	<!-- jQuery (https://jquery.com/download/) -->
	<script>
		$(document).ready(function(){
		// Update the current year in copyright
			$('.tm-current-year').text(new Date().getFullYear());
		});
	</script>
</body>
</html>