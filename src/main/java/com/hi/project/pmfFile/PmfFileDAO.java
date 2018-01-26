package com.hi.project.pmfFile;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.file.FileDAO;
import com.hi.file.FileDTO;

@Repository
public class PmfFileDAO implements FileDAO{
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "pmfFileMapper.";
	
	@Override
	public List<FileDTO> selectList(int num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FileDTO selectOne(int fnum) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"selectOne", fnum);
	}

	@Override
	public int insert(FileDTO fileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"insert", fileDTO);
	}

	@Override
	public int update(FileDTO fileDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int fnum) throws Exception {
		return sqlSession.delete(NAMESPACE+"delete", fnum);
	}

	//deleteAll
	public int deleteAll(int num) throws Exception {
		return sqlSession.delete(NAMESPACE+"deleteAll", num);
	}
}
