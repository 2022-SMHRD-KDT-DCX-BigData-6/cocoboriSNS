package com.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.CocoBoardDTO;
import com.smhrd.model.CocoFriendDAO;

public class FriendDetail implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String user_email = request.getParameter("user_email");
		
		CocoFriendDAO dao = new CocoFriendDAO();
		List<CocoBoardDTO> friendDetail = dao.friendDetail(user_email);
		
		HttpSession session = request.getSession();
		session.setAttribute("friendDetail", friendDetail);
		
		return "friendDetail.jsp";
	}

}
