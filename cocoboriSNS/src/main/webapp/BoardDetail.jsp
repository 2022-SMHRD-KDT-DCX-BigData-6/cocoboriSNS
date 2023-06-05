<%-- <%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%> --%>
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
<title>코코보리</title>
</head>
<body>

	<!-- 게시글 세부내용 조회 기능 -->
	<%
	List<CocoBoardDTO> board_list = null;
	try{
		int postId = Integer.parseInt(request.getParameter("num")); //num값 받아오기
		board_list = new CocoBoardDAO().detail_showBoard(postId);
	}catch(Exception e){
		board_list = null;
	};
	
	//board_list에 null값이나 없는 값 넣었을시(주소로 검색했을때 오류처리)
	if(board_list == null || board_list.size() == 0 ) { 
	%>
	
	<h1>입력하신 자료가 없습니다</h1>
	
	<% }else{
		CocoBoardDTO post = board_list.get(0); //board_list로 받아온 값에서는 무조건 인덱스0.(클릭된 값으로 들어갈테니 하나의 값만 받아오기에)
	
		
		//session에 값 저장해주기(무조건 세부사항을 열어야 수정가능하니까 여기에 session사용/ session:창 닫으면 값 없어짐)
		//session.setAttribute("BoardB_seq", post.getB_seq());
		session.setAttribute("BoardB_title",post.getB_title());
		session.setAttribute("BoardUser_email",post.getUser_email());
		session.setAttribute("BoardB_Content", post.getB_content());
		session.setAttribute("BoardB_file", post.getB_file());
	%>
	
	
	<div id = "board">
		<table border = "1" id="list">
			<tr>
				<td>제목</td>
				<td><%=post.getB_title()%></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=post.getUser_email() %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
				
				<% if (post.getB_file()!= null){ %>
	            <span class="image avatar48">
	               <img alt="" src="<%= "./upload/"+ post.getB_file()%>">
	            </span>
	            <%}else{ %>
	            <span class="image avatar48">
	               <img alt="" src="<%= "./images/foot.png"%>">
	            </span>
	            <%} %>
				<br>	
				
				
				<%=post.getB_content() %>
				
				</td>
			</tr>
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="board.jsp"><button>뒤로가기</button></a>
					<a href="BoardUpdate.jsp?num=<%=post.getB_seq()%>"><button>수정</button></a>
                  	<a href ="DeleteBoardService?num=<%=post.getB_seq()%>"><button onclick = "return confirm('정말 삭제 하시겠습니까?');">삭제</button></a>
				</td>  
			</tr>
		</table>
	</div>
	<% } %>
</body>
</html>