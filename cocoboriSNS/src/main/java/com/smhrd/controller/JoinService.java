package com.smhrd.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.CocoMemberDAO;
import com.smhrd.model.CocoMemberDTO;


public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	request.setCharacterEncoding("UTF-8");

	
	Date now = new Date();
	
	String user_email = request.getParameter("user_email");
	String user_pw = request.getParameter("user_pw");
	String user_name = request.getParameter("user_name");
	String user_nick = request.getParameter("user_nick");
	String user_phone = request.getParameter("user_phone");
	String user_pet = request.getParameter("user_pet");
	Date user_joindate = now;
	String admin_yn = "N";
	
	CocoMemberDTO dto = new CocoMemberDTO(user_email, user_pw, user_name, user_nick, user_phone, user_pet, user_joindate, admin_yn);
	System.out.println(dto);
	CocoMemberDAO dao = new CocoMemberDAO();
	
	int cnt = dao.insertMember(dto);
	System.out.println(cnt);
	if(cnt > 0) {
		System.out.println("회원가입 성공");
		HttpSession session = request.getSession();
		session.setAttribute("user_email", user_email);
		response.sendRedirect("login.jsp");
	}else {
		System.out.println("회원가입 실패");
		response.sendRedirect("login.jsp");		
	}
	
	}

}
