package com.hi.trade;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hi.boardFile.FileDAO;
import com.hi.boardFile.FileSaver;
import com.hi.boardFile.FileService;

@Service
public class TradeBoardService {
	
	@Inject
	TradeBoardDAO tradeBoardDAO;
	@Inject
	FileSaver fileSaver;
	@Inject
	FileService fileService;
	
	
	public int insert(TradeBoardDTO tradeBoardDTO,HttpSession session) throws Exception {
			tradeBoardDTO.setNum(tradeBoardDAO.getNum());
			tradeBoardDAO.insert(tradeBoardDTO);
		return 0;
	}
	
	public List<TradeBoardDTO> selectList() throws Exception{
		List<TradeBoardDTO> ar = null;
		return ar;
	}
	
	public TradeBoardDTO selectOne(int num) throws Exception {
			TradeBoardDTO tradeBoardDTO = null;
		return tradeBoardDTO;
	}
	
	public int update (TradeBoardDTO tradeBoardDTO,HttpSession session) throws Exception {
		
		return 0;
	}
	
	public int delete(int num) throws Exception {
		
	return 0;
	}

	
}
