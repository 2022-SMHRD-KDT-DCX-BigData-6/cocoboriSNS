<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.CocoMemberDTO"%>
<%@page import="com.smhrd.model.CocoFriendDTO"%>
<%@page import="com.smhrd.model.CocoFriendDAO"%>
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
		// CocoMemberDTO member = (CocoMemberDTO)session.getAttribute("member");
		String user_email = "user_email 001"; // member.getUser_email();
	
		List<CocoFriendDTO> friendList = new CocoFriendDAO().showAllFriends(user_email);
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
						<li class="tm-nav-item"><a href="board.jsp" class="tm-nav-item-link tm-button">게시판</a></li>
						<li class="tm-nav-item"><a href="community.jsp" class="tm-nav-item-link tm-button active">커뮤니티</a></li>
						<li class="tm-nav-item"><a href="info_me.jsp" class="tm-nav-item-link tm-button">내 주변 정보</a></li>
						<li class="tm-nav-item"><a href="#" class="tm-nav-item-link tm-button">로그인</a></li>
					</ul>
				</nav>
			</div>
			<!-- side menu -->
			
			<div class="tm-main-content">
				<div class="row mb-4">
					<div class="col-sm mb-4">
						<div class="friendBox p-2">
							<i class="fa fa-3x fa-address-book-o d-block mb-4 text-center"></i>
							<h3 class="text-center">친구</h3>
						</div>
					</div>
					<div class="col-sm mb-4">
						<div class="chatBox p-2">
							<i class="fa fa-3x fa-comments-o d-block mb-4 text-center"></i>
							<h3 class="text-center">채팅</h3>
						</div>
					</div>
				</div>
				<!-- row -->
				
				<div class="friend_list container" style="display: none;">
					<div class="row">
						<div class="col-md-9">
							<table class="table">
								<tr>
									<td>친구</td>
									<td><button type="button" onclick="location.href='Friend.jsp'">친구 추가</button></td>
								</tr>
								<% for (int i = 0; i < friendList.size(); i++) {%>
								<tr>
									<td onclick="location.href='FriendDetail.do?user_email=<%= friendList.get(i).getFriend_email()%>'">
										<img alt="" src="">사진
										<%= friendList.get(i).getFriend_email()%>
									</td>
								</tr>
								<% }%>
							</table>
						</div>
					</div>
				</div>
				<div class="chatting container" style="display: none;">
					<div class="row">
						<div class="col-md-9">
							<table class="table">
								<tr>
									<td>채팅방</td>
								</tr>
								<%-- <% for (int i = 0; i < #.size(); i++) {%> --%>
								<tr>
									<td class="chat">
										<img alt="" src="">사진
										<%-- <%= #.get(i).#()%> --%>
									</td>
								</tr>
								<%-- <% }%> --%>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- tm-main-content -->
		
		<footer class="tm-footer text-right">
			<p>
				Copyright &copy; <span class="tm-current-year">2018</span> Your Company - Designed by 
				<a href="https://www.facebook.com/tooplate" target="_parent">Tooplate</a>
			</p>
		</footer>
	</div>
	<!-- container-fluid -->
	
	<!-- load JS files -->
	<script src="js/jquery-1.11.3.min.js"></script>	<!-- jQuery (https://jquery.com/download/) -->
	<script>
		$(document).ready(function(){
		// Update the current year in copyright
			$('.tm-current-year').text(new Date().getFullYear());
		});
	</script>
	<script type="text/javascript">
		$(".friendBox").click(function () {
			$(".friend_list").toggle();
			$(".chatBox").css("background-color","#ABEBC6");
			$(".chatting").hide();
			
			var friend_dp = $(".friend_list").css("display");

			if (friend_dp == "none") {
				$(".friendBox").css("background-color","#ABEBC6");
			} else {
				$(".friendBox").css("background-color","#58D68D");
			}
		});

		$(".chatBox").click(function () {
			$(".chatting").toggle();
			$(".friendBox").css("background-color","#ABEBC6");
			$(".friend_list").hide();

			var chat_dp = $(".chatting").css("display");
			
			if (chat_dp == "none") {
				$(".chatBox").css("background-color","#ABEBC6");
			} else {
				$(".chatBox").css("background-color","#58D68D");
			}
		});
	</script>
</body>
</html>