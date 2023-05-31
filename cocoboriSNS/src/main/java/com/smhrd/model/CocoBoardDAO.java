package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CocoBoardDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public List<CocoBoardDTO> showBoard() {
		List<CocoBoardDTO> board_list = sqlSession.selectList("com.smhrd.database.CocoBoardMapper.showBoard");
		
		sqlSession.close();
		
		return board_list;
	}
	
}
