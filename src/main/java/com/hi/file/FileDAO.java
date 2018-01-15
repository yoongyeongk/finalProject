package com.hi.file;

import java.util.List;

public interface FileDAO {

	//selectList
	public List<FileDTO> selectList(int num) throws Exception;
	
	//selectOne
	public FileDTO selectOne(int fnum) throws Exception;
	
	//insert
	public int insert(FileDTO fileDTO) throws Exception;
	
	//update
	public int update(FileDTO fileDTO) throws Exception;
	
	//delete
	public int delete(int fnum) throws Exception;
	
}
