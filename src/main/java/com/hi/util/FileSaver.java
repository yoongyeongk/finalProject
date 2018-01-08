package com.hi.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class FileSaver {
	
	public String fileSave(MultipartFile multipartFile, HttpSession session, String path) throws Exception {
		// 업로드 경로
		String filePath = session.getServletContext().getRealPath("resources/upload");
		// 경로에 파일 생성
		File file = new File(filePath);
		
		// 파일이 존재하지 않으면 디렉토리 생성
		if(!file.exists())
			file.mkdirs();
		
		// 파일 원본명을 가져옴
		String fileName = multipartFile.getOriginalFilename();
		// 파일을 가져올 때 처리
		if(!fileName.isEmpty()) {
			// 파일 원본명 -> UUID
			fileName = fileName.substring(fileName.lastIndexOf("."));
			fileName = UUID.randomUUID().toString() + fileName;
			// UUID 파일명으로 파일 생성
			file = new File(filePath, fileName);
			multipartFile.transferTo(file);
		}
		
		return fileName;
	}

}
