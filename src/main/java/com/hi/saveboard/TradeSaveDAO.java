package com.hi.saveboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.project.util.RowNum;



@Repository
public class TradeSaveDAO {

	@Inject
	SqlSession sqlSession;
	private static String NAMESPACE = "tradeSaveMapper.";
	
	public int delete (int save_num) throws Exception {
		return sqlSession.delete(NAMESPACE+"delete", save_num);
	}
	
	public int insert (TradeSaveDTO tradeSaveDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"insert",tradeSaveDTO);
	}
	
	public int update (TradeSaveDTO tradeSaveDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"update", tradeSaveDTO);
	}
	
	public int getNum () throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}
	
	public List<TradeSaveDTO> selectList (Map<String, Object> boardMap) throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectList", boardMap);
	}
	
	public TradeSaveDTO selectOne (int save_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"selectOne", save_num);
	}
	
	public int getWriters (TradeSaveDTO tradeSaveDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getWriters", tradeSaveDTO);
	}
	
	public int getCount (String writer) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getCount", writer);
	}
	
	public List<TradeSaveDTO> getList() throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getList");
	}
}
