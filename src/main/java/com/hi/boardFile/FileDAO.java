package com.hi.boardFile;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAO {

	@Inject
	SqlSession sqlSession;
	private static String NAMESPACE = "fileMapper.";
	
	public int insert (FileDTO fileDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"insert",fileDTO);
	}
	
	public int deleteOne (int num) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"deleteOne", num);
	}
	
	public int deleteAll (int num) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"deleteAll", num);
	}
}
