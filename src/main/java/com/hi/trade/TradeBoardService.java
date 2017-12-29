package com.hi.trade;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hi.boardFile.FileDAO;
import com.hi.boardFile.FileDTO;
import com.hi.boardFile.FileSaver;
import com.hi.boardFile.FileService;
import com.hi.tag.TagService;

@Service
public class TradeBoardService {
	
	@Inject
	TradeBoardDAO tradeBoardDAO;
	@Inject
	FileService fileService;
	@Inject 
	TagService tagService;
	
	public int insert(TradeBoardDTO tradeBoardDTO,HttpSession session) throws Exception {
			tradeBoardDTO.setNum(tradeBoardDAO.getNum());
			tradeBoardDTO.setFileNames(fileService.insert(tradeBoardDTO, session));
			tagService.insert(tradeBoardDTO);
			
		return tradeBoardDAO.insert(tradeBoardDTO);
	}
	
	public List<TradeBoardDTO> selectList() throws Exception{
		List<TradeBoardDTO> ar = null;
		return ar;
	}
	
	public TradeBoardDTO selectOne(int num) throws Exception {
			TradeBoardDTO tradeBoardDTO = tradeBoardDAO.selectOne(num);
			
		return tradeBoardDTO;
	}
	
	public int update (TradeBoardDTO tradeBoardDTO,HttpSession session) throws Exception {
			
			tradeBoardDTO.setFileNames(fileService.insert(tradeBoardDTO, session));
			tagService.insert(tradeBoardDTO);
			
		return tradeBoardDAO.update(tradeBoardDTO);
	}
	
	public int deleteAll(int num) throws Exception {
		int result = 0;
		result = fileService.deleteAll(num);
		if(result > 0){
			tagService.deleteAll(num);
		}
	return tradeBoardDAO.deleteAll(num);
	}

	
}
