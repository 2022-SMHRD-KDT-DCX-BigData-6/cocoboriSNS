package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.CocoChattingDAO;
import com.smhrd.model.CocoChattingDTO;

public class ChatService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String me = (String)session.getAttribute("me");
		
		String FRIEND_EMAIL = "S";
		double FriendCode = new CocoChattingDAO().FriendCode(FRIEND_EMAIL);	// 친구DAO 변경
		
		// 발화자 수정해야 함. 로그인한 내 닉네임 값 가져올 것.
		String talker = me;
		String talking = request.getParameter("talking");
		
		CocoChattingDTO dto = new CocoChattingDTO(FriendCode, talker, talking); // 채팅방 번호는 친구 테이블에서 가져온다.
		CocoChattingDAO dao = new CocoChattingDAO();
		int cnt = dao.SaveChat(dto);
		
		if(cnt > 0) {
			response.sendRedirect("ChatMain.jsp");
		} else {
			response.sendRedirect("ChatMain.jsp");
		}
		
	}

}