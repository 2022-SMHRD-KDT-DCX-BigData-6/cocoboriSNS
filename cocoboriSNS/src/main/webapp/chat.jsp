<%@page import="com.smhrd.model.CocoChattingDTO"%>
<%@page import="com.smhrd.model.CocoChattingDAO"%>
<%@page import="com.smhrd.model.CocoFriendDAO"%>
<%@page import="com.smhrd.model.CocoFriendDTO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.CocoMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>COCOBORI</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script>
		function toggleEmo(){
			const emoticon1 = document.getElementById('emoticon1');
		    if(emoticon1.style.display !== 'none') {
		    	emoticon1.style.display = 'none';
		    }
		    else {
		    	emoticon1.style.display = 'block';
		    }
		    const emoticon2 = document.getElementById('emoticon2');
		    if(emoticon2.style.display !== 'none') {
		    	emoticon2.style.display = 'none';
		    }
		    else {
		    	emoticon2.style.display = 'block';
		    }
		    const emoticon3 = document.getElementById('emoticon3');
		    if(emoticon3.style.display !== 'none') {
		    	emoticon3.style.display = 'none';
		    }
		    else {
		    	emoticon3.style.display = 'block';
		    }
		}
	</script>
</head>
<body class="is-preload">

	<%
		
		CocoMemberDTO member = (CocoMemberDTO)session.getAttribute("loginMember");
		String user_email = member.getUser_email();
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
					<%=member.getUser_nick()%>
				</p>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="main.jsp" id="top-link"><span class="icon solid fa-home">HOME</span></a></li>
					
					<% if (member.getUser_email().equals("admin@admin.com")) {%>
						<li><a href="admin_member.jsp" id="admin-link"><span class="icon solid fa-th">전체회원정보</span></a></li>
						<li><a href="LogoutService" id="logout-link"><span class="icon solid fa-user">로그아웃</span></a></li>
					<% } else {%>
						<li><a href="friend.jsp" id="friend-link"><span class="icon solid fa-envelope">친구</span></a></li>
						<li><a href="my_page.jsp" id="my-link"><span class="icon solid fa-envelope">마이페이지</span></a></li>
						<li><a href="LogoutService" id="logout-link"><span class="icon solid fa-user">로그아웃</span></a></li>
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
				<h1>SNS</h1>
				<p>코코보리 - 반려인과 반려동물을 위한 SNS</p>
			</div>
		</section>

		<!-- Portfolio -->
		<section id="#" class="two">

			<div class="chatting container">
				<div class="row">
					<div class="col-md-9">
	<%
		CocoMemberDTO memberSecond = (CocoMemberDTO)session.getAttribute("member");
		String me = member.getUser_email();
	
		String FRIEND_EMAIL = (String)session.getAttribute("friend_email"); // friend_Email 세션에 담음
		session.setAttribute("me", member.getUser_email());
		int FriendCode = (int)new CocoChattingDAO().ChatCode(FRIEND_EMAIL); // 친구 이메일을 이용하여 친구 코드 가져오는 메소드
		
		List<CocoChattingDTO> chatList = new CocoChattingDAO().ShowChat(FriendCode); // 채팅 리스트 값
		LocalDate now = LocalDate.now(); // 현재 날짜
		String day = now.toString();
	%> 
	
	<form action="ChatService?friend_email=<%= FRIEND_EMAIL%>" method="post">
		<table border="1">
			<tr>
				<td colspan="2"><h2 style="text-align: center;"> <%= FRIEND_EMAIL %>님과의 채팅 </h2></td>
			</tr>
			<tr>
				<td colspan="2">
				<%
					for (CocoChattingDTO i : chatList) {
					String talker = i.getTALKER();
					String talkking = i.getTALKING();
					
					String time = i.getTALKING_AT(); // 테이블에 있는 작성 시간
					int idx = time.indexOf(" "); // 빈 곳 문자열 찾기
					String judgeTime = time.substring(0, idx); // 오늘과 같은 날짜인지 판단을 위한 날짜 추출
					
					if(!talker.equals(me)){ 
				%>
						<h4><%= talker %> - <%= talkking %></h4> <!-- 내가 발화자가 아닐 경우 발화자 부분에 프로필사진을 넣을 수 있는지 고려 -->
						<% if(judgeTime.equals(day)){ %>
						<h5><%= time.substring(time.lastIndexOf(" ")+1) %></h5>
						<% } else { %>
						<h5><%= time %></h5>
						<% } %>
						<br>
				<%
						} else {
				%>		
						<h4 style="text-align: right;"><%= talkking %></h4>
						<% if(judgeTime.equals(day)){ %>
						<h5 style="text-align: right;"><%= time.substring(time.lastIndexOf(" ")+1) %></h5>
						<% } else { %>
						<h5 style="text-align: right;"><%= time %></h5>
						<% } %>
						<br>
				<%			
						}
					}
				%>
				</td>
			</tr>
			<tr style="text-align: center;">
				<td id='emoticon1' style="border: thin; display: none;">
					<input type="button" id="emo1" value="😺" title="고양이에요">
					<script>$("#emo1").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'😺');});</script>
					<input type="button" id="emo2" value="🐶" title="강아지에요">
					<script>$("#emo2").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'🐶');});</script>
					<input type="button" id="emo3" value="🐰" title="토끼에요">
					<script>$("#emo3").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'🐰');});</script>
					<input type="button" id="emo4" value="🐹" title="햄스터에요">
					<script>$("#emo4").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'🐹');});</script>
					<input type="button" id="emo5" value="🐦" title="새에요">
					<script>$("#emo5").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'🐦');});</script>
					<input type="button" id="emo6" value="🐸" title="개구리에요">
					<script>$("#emo6").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'🐸');});</script>
					<input type="button" id="emo7" value="🦎" title="도마뱀이에요">
					<script>$("#emo7").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'🦎');});</script>
				</td>
			</tr>
			<tr style="text-align: center;">
				<td id='emoticon2' style="border: thin; display: none;">	
					<input type="button" id="emo8" value="🐍" title="뱀이에요">
					<script>$("#emo8").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'🐍');});</script>
					<input type="button" id="emo9" value="🐟" title="물고기에요">
					<script>$("#emo9").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'🐟');});</script>
					<input type="button" id="emo10" value="🐛" title="애벌레에요">
					<script>$("#emo10").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'🐛');});</script>
					<input type="button" id="emo11" value="🖐" title="안녕하세요">
					<script>$("#emo11").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'🖐');});</script>
					<input type="button" id="emo12" value="👍" title="좋아요">
					<script>$("#emo12").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'👍');});</script>
					<input type="button" id="emo13" value="👎" title="나빠요">
					<script>$("#emo13").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'👎');});</script>
					<input type="button" id="emo14" value="✌" title="V에요">
				</td>
			</tr>
			<tr style="text-align: center;">
				<td id='emoticon3' style="border: thin; display: none;">
					<script>$("#emo14").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'✌');});</script>
					<input type="button" id="emo15" value="👏" title="박수쳐요">
					<script>$("#emo15").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'👏');});</script>
					<input type="button" id="emo16" value="🙏" title="미안해요">
					<script>$("#emo16").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'🙏');});</script>
					<input type="button" id="emo17" value="❗" title="놀라요">
					<script>$("#emo17").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'❗');});</script>
					<input type="button" id="emo18" value="❓" title="궁금해요">
					<script>$("#emo18").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'❓');});</script>
					<input type="button" id="emo19" value="💤" title="졸려요">
					<script>$("#emo19").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'💤');});</script>
					<input type="button" id="emo20" value="💢" title="화나요">
					<script>$("#emo20").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'💢');});</script>
					<input type="button" id="emo21" value="💕" title="사랑해요">
					<script>$("#emo21").on('click',function() {$('input[name=talking]').val($('input[name=talking]').val()+'💕');});</script>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" id="emo" value="이모티콘" onclick="toggleEmo()">
					<input type="text" name="talking" id="chat" placeholder="채팅 내용을 입력해 주세요" >
					<input type="submit" value="전송">
				</td>
			</tr>
					
		</table>
	</form>
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