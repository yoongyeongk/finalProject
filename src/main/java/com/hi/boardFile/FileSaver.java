package com.hi.boardFile;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {

	public String transperSave (MultipartFile file,HttpSession session,String path) throws Exception {
		String filePath = session.getServletContext().getRealPath("resources/"+path);
		System.out.println(filePath);
		File f = new File(filePath);
		if(!f.exists()){
			f.mkdirs();
		}
		
		String fileName = file.getOriginalFilename();
		fileName = fileName.substring(fileName.lastIndexOf("."));
		fileName = UUID.randomUUID().toString()+fileName;
		
		File f2 = new File(filePath, fileName);
		
		file.transferTo(f2);
		
		return fileName;
	}
}
