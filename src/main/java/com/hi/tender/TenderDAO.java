package com.hi.tender;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.project.util.RowNum;
import com.hi.trade.TradeBoardDTO;

@Repository
public class TenderDAO {
	
	@Inject
	SqlSession sqlSession;
	private static String NAMESPACE = "tenderMapper.";
	
	public List<TradeBoardDTO> selectList (String writer,RowNum rowNum) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writer",writer);
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		return sqlSession.selectList(NAMESPACE+"selectList", map);
	}
	
	public List<TenderDTO> selectTender (String writer) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"selectTender", writer);
	}
	
	public int totalCount (String writer) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"totalCount",writer);
	}
}
