package com.smhrd.model;

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
		CocoMemberDTO member = null;
		member = sqlSession.selectOne("com.smhrd.database.CocoMemberMapper.selectMember", dto);
		System.out.println(member);
		sqlSession.close();
		return member;
	}
	
	// 회원정보수정 기능
	public int updateMember(CocoMemberDTO dto) {
		int cnt = 0;
		cnt = sqlSession.update("com.smhrd.database.CocoMemberMapper.updateMember", dto);
		sqlSession.close();
		return cnt ; 
	}
}
