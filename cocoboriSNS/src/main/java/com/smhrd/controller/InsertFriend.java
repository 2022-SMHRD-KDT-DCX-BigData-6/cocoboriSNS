package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.CocoChattingDAO;
import com.smhrd.model.CocoFriendDAO;
import com.smhrd.model.CocoFriendDTO;
import com.smhrd.model.CocoMemberDTO;

public class InsertFriend implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		CocoMemberDTO member = (CocoMemberDTO)session.getAttribute("loginMember");
		
		String user_email = member.getUser_email();
		String friend_email = request.getParameter("friend_email");
		
		CocoFriendDTO dto = new CocoFriendDTO(null, user_email, friend_email, null);
		CocoFriendDAO dao = new CocoFriendDAO();
		
		dao.insertFriend(dto);
		
		int FriendCode = (int)new CocoChattingDAO().ChatCode(user_email);
		
		CocoFriendDTO searchDto = new CocoFriendDTO(null, friend_email, user_email, null);
		
		if(dao.searchFriend(searchDto) != null) {
			System.out.println(dao.searchFriend(searchDto));
			double friend_seq = new CocoChattingDAO().ChatCode(user_email);
			System.out.println(friend_seq);
			CocoFriendDTO updateDto = new CocoFriendDTO(friend_seq, user_email, friend_email, null);
			int cnt = dao.updateFriend(updateDto);
			
			if (cnt > 0) {
				System.out.println("수정 성공");
			} else {
				System.out.println("수정 실패");
			}
		}
		
		return null;
		
	}

}
