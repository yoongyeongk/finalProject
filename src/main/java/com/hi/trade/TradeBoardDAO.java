package com.hi.trade;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.project.util.RowNum;
import com.hi.tender.TenderDTO;
import com.hi.tradeTag.TradeTagDTO;

@Repository
public class TradeBoardDAO {

	@Inject
	SqlSession sqlSession;
	private static String NAMESPACE = "tradeMapper.";
	
	
	public int insert(TradeBoardDTO tradeBoardDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"insert", tradeBoardDTO);
	}
	
	public List<TradeBoardDTO> selectList(RowNum rowNum) throws Exception{

		return sqlSession.selectList(NAMESPACE+"selectList", rowNum);
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
	
	public int close (TradeBoardDTO tradeBoardDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"close", tradeBoardDTO);
	}
	
	public int getNum () throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}

	public List<TradeTagDTO> getTag () throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"selectListTag");
	}
	
	public int getCount (RowNum rowNum) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getCount",rowNum);
	}
	
	public int getTagCount (RowNum rowNum) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getTagCount", rowNum);
	}
	
	public List<TradeBoardDTO> selectTagSearch (RowNum rowNum) throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectTagSearch", rowNum);
	}
	
	public int insertAC (TenderDTO tenderDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"insertAC", tenderDTO);
	}
	
	public TenderDTO selectTender (TenderDTO tenderDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"selectTender", tenderDTO);
	}
	
	public int updateAC (TenderDTO tenderDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"updateAC", tenderDTO);
	}
	public int updatePrice (TenderDTO tenderDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"updatePrice", tenderDTO);
	}
	
	public int deleteTender (int num) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"deleteTender", num);
	}
}
