package com.hi.project;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.boardFile.FileService;

@Controller
@RequestMapping(value="/file/*")
public class FileController {

	@Inject
	FileService fileService;
	
	
	@RequestMapping(value="fileDelete")
	public void deleteOne (int num) {
		try {
			fileService.deleteOne(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
