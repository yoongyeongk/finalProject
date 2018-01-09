package com.hi.saveboard;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TradeSaveDAO {

	@Inject
	SqlSession sqlSession;
	private static String NAMESPACE = "tradeSaveMapper.";
	
	public int insert (TradeSaveDTO tradeSaveDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"insert",tradeSaveDTO);
	}
	
	public int update (TradeSaveDTO tradeSaveDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"update", tradeSaveDTO);
	}
	
	public int getNum () throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}
	
	public int getWriters (TradeSaveDTO tradeSaveDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getWriters", tradeSaveDTO);
	}
	
}
