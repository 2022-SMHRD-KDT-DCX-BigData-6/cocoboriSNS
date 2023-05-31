<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Friend.jsp</title>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>

	<div id="board">
	<form action="FriendSearch.jsp">
			<table id="list">
				<tr>
					<td>친구 검색</td>
					<td colspan="2"><input type="text" placeholder ="이메일을 입력해주세요" name="searchFriend"></td>
					<td><input type="submit" value="검색"></td>
				<tr>
				<tr>
				</tr>
			</table>
		</form>
		<a href="index.jsp"><button id="writer">홈으로가기</button></a> <!-- 경로 변경 -->
	</div>
	
</body>
</html>