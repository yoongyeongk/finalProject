package com.hi.boardFile;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hi.trade.TradeBoardDTO;

@Service
public class TradeBoardFileService {

	@Inject
	TradeBoardFileDAO fileDAO;
	@Inject
	FileSaver fileSaver;
	
	public List<TradeBoardFileDTO> insert (TradeBoardDTO tradeBoardDTO,HttpSession session) throws Exception {
		List<TradeBoardFileDTO> files = new ArrayList<TradeBoardFileDTO>();
		TradeBoardFileDTO fileDTO = null;
		for (MultipartFile file : tradeBoardDTO.getImg()) {
			if(file.getOriginalFilename() != ""){
				fileDTO = new TradeBoardFileDTO();
				fileDTO.setNum(tradeBoardDTO.getNum());
				fileDTO.setFileName(fileSaver.transperSave(file, session, "upload"));
				fileDTO.setOriName(file.getOriginalFilename());
				files.add(fileDTO);
				fileDAO.insert(fileDTO);
			}
		}
	return files;
	}
	
	public int deleteOne (int num) throws Exception {
		int result = 0;
			result = fileDAO.deleteOne(num);
		return result;
	}
	
	public int deleteAll (int num) throws Exception {
		return fileDAO.deleteAll(num);
	}
}
