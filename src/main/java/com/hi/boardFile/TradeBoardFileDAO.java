package com.hi.boardFile;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TradeBoardFileDAO {

	@Inject
	SqlSession sqlSession;
	private static String NAMESPACE = "tradeBoardFileMapper.";
	
	public int insert (TradeBoardFileDTO fileDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"insert",fileDTO);
	}
	
	public int deleteOne (int num) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"deleteOne", num);
	}
	
	public int deleteAll (int num) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"deleteAll", num);
	}
}
