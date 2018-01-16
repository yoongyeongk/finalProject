package com.hi.tradeTag;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.trade.TradeBoardDTO;

@Repository
public class TradeTagDAO {

	@Inject
	SqlSession sqlSession;
	private static String NAMESPACE  = "tradeTagMapper.";
	
	public int insert (TradeTagDTO tagDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"insert", tagDTO);
	}

	
	public int deleteOne (int num) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"deleteOne",num);
	}
	
	public int deleteAll (int num) throws Exception {
		return sqlSession.delete(NAMESPACE+"deleteAll", num);
	}
}
