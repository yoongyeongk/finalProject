package com.hi.saveboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.util.RowNum;

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
	
	public List<TradeSaveDTO> selectList (String writer,RowNum rowNum) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writer", writer);
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		return sqlSession.selectList(NAMESPACE+"selectList", map);
	}

	public int getCount (String writer) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getCount", writer);
	}
	
}
