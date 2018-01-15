package com.hi.project.pmfReply;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.project.util.RowNum;

@Repository
public class PmfReplyDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "pmfReplyMapper.";
	
	public List<PmfReplyDTO> selectList(RowNum rowNum) throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectList", rowNum);
	}
	
	public PmfReplyDTO selectOne(int rnum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", rnum);
	}
	
	public int insert(PmfReplyDTO pmfReplyDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"insert", pmfReplyDTO);
	}
	
	public int update(PmfReplyDTO pmfReplyDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"update", pmfReplyDTO);
	}
	
	public int delete(int rnum) throws Exception {
		return sqlSession.delete(NAMESPACE+"delete",rnum);
	}
	
	public int deleteAll(int num) throws Exception {
		return sqlSession.delete(NAMESPACE+"deleteAll", num);
	}
	
	public int reply(PmfReplyDTO pmfReplyDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"reply", pmfReplyDTO);
	}
	
	public int stepUpdate(PmfReplyDTO pmfReplyDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"stepUpdate", pmfReplyDTO);
	}
}
