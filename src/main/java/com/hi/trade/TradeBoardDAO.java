package com.hi.trade;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.tag.TagDTO;
import com.hi.util.RowNum;

@Repository
public class TradeBoardDAO {

	@Inject
	SqlSession sqlSession;
	private static String NAMESPACE = "tradeMapper.";
	
	
	public int insert(TradeBoardDTO tradeBoardDTO) throws Exception {
			
		return sqlSession.insert(NAMESPACE+"insert", tradeBoardDTO);
	}
	
	public List<TradeBoardDTO> selectList(RowNum rowNum) throws Exception{
		System.out.println(rowNum.getKind());
		System.out.println(rowNum.getSearch());
		return sqlSession.selectList(NAMESPACE+"selectList",rowNum);
	}
	
	public TradeBoardDTO selectOne(int num) throws Exception {
			
		return sqlSession.selectOne(NAMESPACE+"selectOne", num);
	}
	
	public int update (TradeBoardDTO tradeBoardDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"update", tradeBoardDTO);
	}
	
	public int deleteAll(int num) throws Exception {
		
	return sqlSession.delete(NAMESPACE+"deleteAll", num);
	}
	
	public int getNum () throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}

	public List<TagDTO> getTag () throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"selectListTag");
	}
	
	public int getCount () throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getCount");
	}
}
