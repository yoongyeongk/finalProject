package com.hi.trade;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TradeBoardDAO {

	@Inject
	SqlSession sqlSession;
	private static String NAMESPACE = "tradeMapper.";
	
	
	public int insert(TradeBoardDTO tradeBoardDTO) throws Exception {
			
		return sqlSession.insert(NAMESPACE+"insert", tradeBoardDTO);
	}
	
	public List<TradeBoardDTO> selectList() throws Exception{
		List<TradeBoardDTO> ar = null;
		return ar;
	}
	
	public TradeBoardDTO selectOne(int num) throws Exception {
			
		return sqlSession.selectOne(NAMESPACE+"selectOne", num);
	}
	
	public int update (TradeBoardDTO tradeBoardDTO) throws Exception {
		
		return 0;
	}
	
	public int delete(int num) throws Exception {
		
	return 0;
	}
	
	public int getNum () throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}

}
