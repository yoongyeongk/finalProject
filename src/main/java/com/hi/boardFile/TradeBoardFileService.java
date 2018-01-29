package com.hi.boardFile;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hi.project.util.FileSaver;
import com.hi.trade.TradeBoardDTO;

@Service
public class TradeBoardFileService {

	@Inject
	TradeBoardFileDAO tradeBoardFileDAO;
	@Inject
	FileSaver fileSaver;
	
	public List<TradeBoardFileDTO> insert (TradeBoardDTO tradeBoardDTO,HttpSession session) throws Exception {
		List<TradeBoardFileDTO> files = new ArrayList<TradeBoardFileDTO>();
		TradeBoardFileDTO fileDTO = null;
		for (MultipartFile file : tradeBoardDTO.getImg()) {
			if(file.getOriginalFilename() != ""){
				fileDTO = new TradeBoardFileDTO();
				fileDTO.setNum(tradeBoardDTO.getNum());
				fileDTO.setFileName(fileSaver.fileSave(file, session, "upload"));
				fileDTO.setOriName(file.getOriginalFilename());
				files.add(fileDTO);
				tradeBoardFileDAO.insert(fileDTO);
			}
		}
	return files;
	}
	
	public List<TradeBoardFileDTO> selectFile (int num) throws Exception {
			
		return tradeBoardFileDAO.selectFile(num);
	}
	
	public int deleteOne (int fnum,HttpSession session) throws Exception {
		int result = 0;
		String path = session.getServletContext().getRealPath("resources/upload");
			TradeBoardFileDTO fileDTO = tradeBoardFileDAO.selectOne(fnum);
			File file = new File(path, fileDTO.getFileName());
			file.delete();
			
			result = tradeBoardFileDAO.deleteOne(fnum);			
			
		return result;
	}
	
	public int deleteAll (int num,HttpSession session) throws Exception {
		List<TradeBoardFileDTO> ar = tradeBoardFileDAO.selectFile(num);
		String path = session.getServletContext().getRealPath("resources/upload");
		for (TradeBoardFileDTO fileDTO : ar) {
			File file = new File(path, fileDTO.getFileName());
			file.delete();
		}
		
		return tradeBoardFileDAO.deleteAll(num);
	}
}
