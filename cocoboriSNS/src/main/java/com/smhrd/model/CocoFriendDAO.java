package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CocoFriendDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	public List<CocoFriendDTO> showAllFriends() {
		List<CocoFriendDTO> friend_list = sqlSession.selectList("com.smhrd.database.CocoFriendMapper.showAllFriends");

		sqlSession.close();
		
		return friend_list;
	}

	public CocoFriendDTO selectFriend() {
		CocoFriendDTO selectFriend = sqlSession.selectOne("com.smhrd.database.CocoFriendMapper.selectFriend");
		
		sqlSession.close();
		
		return selectFriend;
	}
	
	public void insertFriend() {
		
		
	}
}
