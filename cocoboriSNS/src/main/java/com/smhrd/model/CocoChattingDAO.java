package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CocoChattingDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	// 친구 코드를 통해 채팅방 찾는 메소드
	public double ChatCode(String FRIEND_EMAIL) {	
		List<CocoFriendDTO> friendList = sqlSession.selectList("com.smhrd.database.CocoChatMapper.ChatCode", FRIEND_EMAIL);
		
		double FriendCode = 0;
		
		for (CocoFriendDTO i : friendList) {
			FriendCode = i.getFriend_seq();
		}
		
		sqlSession.close();
		
		return FriendCode;
	}

	// 채팅 저장 메소드
	public int SaveChat(CocoChattingDTO dto) {
		int cnt = 0;
		
		cnt = sqlSession.insert("com.smhrd.database.CocoChatMapper.SaveChat", dto);
		
		sqlSession.close();
		
		return cnt;
	}
	
	// 채팅 출력 메소드
	public List<CocoChattingDTO> ShowChat(int CR_SEQ) {
		List<CocoChattingDTO> chat_List = sqlSession.selectList("com.smhrd.database.CocoChatMapper.ChatList", CR_SEQ);
		
		sqlSession.close();
		
		return chat_List;
	}
	
	/*
	 * public double FriendCode(String FRIEND_EMAIL) {
	 * 
	 * List<CocoFriendDTO> friendList = new
	 * CocoChattingDAO().ChatCode(FRIEND_EMAIL);
	 * 
	 * double FriendCode = 0;
	 * 
	 * for (CocoFriendDTO i : friendList) { FriendCode = i.getFriend_seq(); }
	 * 
	 * return FriendCode;
	 * 
	 * }
	 */
	
	
}