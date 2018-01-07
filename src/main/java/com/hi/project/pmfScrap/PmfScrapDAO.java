package com.hi.project.pmfScrap;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PmfScrapDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "pmfScrapMapper.";
	
	//list
	public List<PmfScrapDTO> selectList(String nickname) throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectList", nickname);
	}
	
	//view
	public PmfScrapDTO selectOne(int snum) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"selectOne", snum);
	}
	
	//insert
	public int insert(PmfScrapDTO pmfScrapDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"insert", pmfScrapDTO);
	}
	
	//delete
	public int delete(int snum) throws Exception {
		return sqlSession.delete(NAMESPACE+"delete", snum);
	}
	
	//deleteAll
	public int deleteAll(String nickname) throws Exception {
		return sqlSession.delete(NAMESPACE+"delete", nickname);
	}
}
