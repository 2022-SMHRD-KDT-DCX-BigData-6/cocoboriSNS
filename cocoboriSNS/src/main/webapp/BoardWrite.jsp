<%@page import="com.smhrd.model.CocoMemberDTO"%>
<%@page import="com.smhrd.model.CocoBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 게시글 작성 기능 -->
	
	<% 
		//작성자 자동으로 써있게 하려고 가져온값 
		//CocoMemberDTO loginMember =(CocoMemberDTO)session.getAttribute("loginMember");
	%>
	
	<div id="board">
		<form action ="WriteBoardService" method="post" enctype="multipart/form-data">
			<table id="list">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer"></td>
					<%-- <td><%=loginMember.getUser_email()%></td> --%>
				</tr>
				<tr>
					<td colspan="2">내용</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="file" name="filename" style="float:right;">
						<textarea row="10" name="content"  style="resize:none;"></textarea>
					</td>
				</tr>
				<tr>
					<td calspan="2">
						<input type="reset" value="초기화">
						<input type="submit" value="업로드">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	
	
	
</body>
</html>






