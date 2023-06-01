package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CocoFriendDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	public List<CocoFriendDTO> showAllFriends(String user_email) {
		List<CocoFriendDTO> friendList = null;
				
		friendList = sqlSession.selectList("com.smhrd.database.CocoFriendMapper.showAllFriends", user_email);

		sqlSession.close();
		
		return friendList;
	}

	public List<CocoFriendDTO> searchFriend(CocoFriendDTO dto) {
		List<CocoFriendDTO> searchResult = null;
				
		searchResult = sqlSession.selectList("com.smhrd.database.CocoFriendMapper.searchFriend", dto);
		
		sqlSession.close();
		
		return searchResult;
	}
	
	public List<CocoMemberDTO> friendDetail(String user_email) {
		List<CocoMemberDTO> friendInfo = null;
				
		friendInfo = sqlSession.selectList("com.smhrd.database.CocoFriendMapper.friendDetail", user_email);
		
		sqlSession.close();
		
		return friendInfo;
	}
	
	public int insertFriend(CocoFriendDTO dto) {
		int insertResult = 0;
		
		insertResult = sqlSession.insert("com.smhrd.database.CocoFriendMapper.insertFriend", dto);
		
		sqlSession.close();
		
		return insertResult;
	}
	
	public int deleteFriend(CocoFriendDTO dto) {
		int deleteResult = 0;
		
		deleteResult = sqlSession.delete("com.smhrd.database.CocoFriendMapper.deleteFriend", dto);
		
		sqlSession.close();
		
		return deleteResult;
	}
}
