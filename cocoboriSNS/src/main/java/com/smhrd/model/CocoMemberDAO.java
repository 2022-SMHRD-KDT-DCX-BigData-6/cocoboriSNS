package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CocoMemberDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	// 회원가입 기능
	public int insertMember(CocoMemberDTO dto) {
		int cnt =0;
		cnt = sqlSession.insert("com.smhrd.database.CocoMemberMapper.insertMember", dto);
		sqlSession.close();
		return cnt;
	}
	// 로그인 기능
	public CocoMemberDTO selectMember(CocoMemberDTO dto) {
	
		CocoMemberDTO Member = null;
		Member = sqlSession.selectOne("com.smhrd.database.CocoMemberMapper.selectMember", Member);
		sqlSession.close();
		return Member;
	}
	
	// 회원정보수정 기능
	public int updateMember(CocoMemberDTO dto) {
		int cnt = 0;
		cnt = sqlSession.update("com.smhrd.database.CocoMemberMapper.updateMember", dto);
		sqlSession.close();
		return cnt ; 
	}
	
	public List<CocoMemberDTO> searchFriend(String user_email) {
		List<CocoMemberDTO> searchFriend = sqlSession.selectList("com.smhrd.database.CocoMemberMapper.searchFriend", user_email);
		
		sqlSession.close();
		
		return searchFriend;
	}
}
