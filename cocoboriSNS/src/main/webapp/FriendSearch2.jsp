<%@page import="com.smhrd.model.CocoMemberDTO"%>
<%@page import="com.smhrd.model.CocoMemberDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>FriendSearch.jsp</title>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>

	<%
		String user_email = request.getParameter("searchFriend");
		List<CocoMemberDTO> friendSearch = new CocoMemberDAO().searchFriend(user_email); //dto 변경 
	%> 

	<div id="board">
	<form action="FriendSearch2.jsp">
			<table id="list">
				<tr>
					<td>친구 검색</td>
					<td colspan="2"><input type="text" placeholder ="이메일을 입력해주세요" name="searchFriend"></td>
					<td><input type="submit" value="검색"></td>
				<tr>
				<tr>
					<td colspan="4"> '<%= user_email %>'에 대한 검색 결과 </td>
				</tr>
				<%
					for (CocoMemberDTO i : friendSearch) {	//dto 변경
				%>
				<tr>
					<td colspan="4">
						<%=i.getUser_email()%>
						<button type="button" onclick="location.href='InsertFriend.do?friend_email=<%=i.getUser_email()%>'">팔로우</button>
					</td>	<!-- 친구 신청으로 들어가게 만들기 -->
				</tr>
				<%
				}
				%>
			</table>
		</form>
		<a href="index.jsp"><button id="writer">홈으로가기</button></a> <!-- 경로 변경 -->
	</div>

</body>
</html>