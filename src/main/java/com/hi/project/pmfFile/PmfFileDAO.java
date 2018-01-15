package com.hi.project.pmfFile;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.hi.file.FileDAO;
import com.hi.file.FileDTO;

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(FileDTO fileDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(FileDTO fileDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int fnum) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	//deleteAll
	public int deleteAll(int num) throws Exception {
		return 0;
	}
}
