package com.hi.project.pmf;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hi.boardFile.FileDTO;
import com.hi.boardFile.FileSaver;

@Service
public class PmfBoardService {

	@Inject
	private PmfBoardDAO boardDAO;
	
	public void selectList() throws Exception {
		
	}
	
	public void selectOne() throws Exception {
		
	}
	
	public int insert(PmfBoardDTO pmfBoardDTO) throws Exception {
		int result = boardDAO.insert(pmfBoardDTO);
		//기타 자료 insert하기, 트랜잭션 처리
		return result;
	}
	
	public void update() throws Exception {
		
	}
	
	public void delete() throws Exception {
		
	}
	
	public void key_value_list() throws Exception {
		
	}
}
