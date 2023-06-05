<%@page import="com.smhrd.model.CocoBoardDAO"%>
<%@page import="java.util.List"%>
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
	<!-- 게시판 수정 -->
	
		<%
		//수정시 사용자 부분 자동 입력되어있게 하려고 가져온값
		//CocoMemberDTO loginMember =(CocoMemberDTO)session.getAttribute("loginMember");
		
		//session에 값 저장
		String BoardB_title  = (String)session.getAttribute("BoardB_title");
		String BoardUser_email  = (String)session.getAttribute("BoardUser_email");
		String BoardB_Content  = (String)session.getAttribute("BoardB_Content");
		String BoardB_file = (String)session.getAttribute("BoardB_file");
		
		int num=Integer.parseInt(request.getParameter("num"));
		%>
	
	
	<div id="update">
		<form action="UpdateBoardService" method="post" enctype="multipart/form-data">
		
			<!-- num은 입력받는 값이 아니니까 hidden으로 넘기기  -->
			<input type="hidden" name="num" value="<%=num%>"/>
			
			<table id="list">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" value="<%=BoardB_title %>"></td>
				</tr>
				<tr>
					<td>작성자</td>
<!-- Q. 회원가입된 테이블에서 가져오는거니까  여튼 확인 한번 해보기 ..?     ----------------------------------------------->
					<%-- <td><%=loginMember.getUser_email()%></td>  --%>
					<td><input type="text" name="writer"></td>
				</tr>
				<tr>
					<td colspan="2">내용</td>
				</tr>
				<tr>
					<td>
					<%	if (BoardB_file != null){ %>
			            <span class="image avatar48">
			               <img alt="" src="<%= "./upload/"+ BoardB_file%>">
			            </span>
			            <%}else{ %>
			            <span class="image avatar48">
			               <img alt="" src="<%= "./images/foot.png"%>">
			            </span><br>
			            <%} %>
			         </td>
				</tr>
				<tr>
					<td colspan="2">
<!---------------------파일 이름값 불러오는거 안됌,,, 나중에 확인하기/ input의 value값 ----------------------------->
						<input type="file" name="filename" value="<%=BoardB_file %>" style="float:right;">
						<textarea row="10" name="content" style="resize:none;"><%=BoardB_Content%></textarea>
						
					</td>
				</tr>
				<tr>
					<td calspan="2">
						<input type="reset" value="초기화">
						<input type="submit" value="수정 업로드">
					</td>
				</tr>
			</table>
			
		</form>
	</div>
	
</body>
</html>