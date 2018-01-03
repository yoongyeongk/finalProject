package com.hi.project.pmf;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.project.util.RowNum;

@Repository
public class PmfBoardDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "pmfMapper.";
	
	public List<PmfBoardDTO> selectList(RowNum rowNum) throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectList", rowNum);
	}
	
	public PmfBoardDTO selectOne(int num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"selectOne", num);
	}
	
	public int insert(PmfBoardDTO pmfBoardDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"insert", pmfBoardDTO);
	}
	
	public void update() throws Exception {
		
	}
	
	public void delete() throws Exception {
		
	}
	
	public int hitUpdate(int num) throws Exception {
		return sqlSession.update(NAMESPACE+"hitUpdate", num);
	}
	
	public int getTotalCount(RowNum rowNum) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", rowNum);
	}
	
	public void key_value_list() throws Exception {
		
	}
}
