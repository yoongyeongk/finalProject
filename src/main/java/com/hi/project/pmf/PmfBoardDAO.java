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
	
	//매개변수 수정하기
	public List<PmfBoardDTO> selectList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectList");
	}
	
	public void selectOne() throws Exception {
		
	}
	
	public int insert(PmfBoardDTO pmfBoardDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"insert", pmfBoardDTO);
	}
	
	public void update() throws Exception {
		
	}
	
	public void delete() throws Exception {
		
	}
	
	public void hitUpdate() throws Exception {
		
	}
	
	public void key_value_list() throws Exception {
		
	}
}
