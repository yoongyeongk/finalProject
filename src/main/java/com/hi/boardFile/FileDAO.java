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
}
