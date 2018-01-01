package com.hi.project.pmf;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PmfBoardDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "pmfMapper.";
	
	public void selectList() throws Exception {
		
	}
	
	public void selectOne() throws Exception {
		
	}
	
	public void insert() throws Exception {
		
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
