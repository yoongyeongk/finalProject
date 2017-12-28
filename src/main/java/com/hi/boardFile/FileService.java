package com.hi.boardFile;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hi.trade.TradeBoardDTO;

@Service
public class FileService {

	@Inject
	FileDAO fileDAO;
	@Inject
	FileSaver fileSaver;
	
	public List<FileDTO> insert (TradeBoardDTO tradeBoardDTO,HttpSession session) throws Exception {
		List<FileDTO> files = new ArrayList<FileDTO>();
		FileDTO fileDTO = null;
		for (MultipartFile file : tradeBoardDTO.getImg()) {
			fileDTO = new FileDTO();
			fileDTO.setNum(tradeBoardDTO.getNum());
			fileDTO.setFileName(fileSaver.transperSave(file, session, "upload"));
			fileDTO.setOriName(file.getOriginalFilename());
			files.add(fileDTO);
			fileDAO.insert(fileDTO);
		}
	return files;
	}
}
