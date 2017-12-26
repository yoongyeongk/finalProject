package com.hi.project.test;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.hi.boardFile.FileDTO;
import com.hi.boardFile.FileSaver;

@Controller
@RequestMapping(value="/test/*")
public class TestController {

	@Inject
	private FileSaver FileSaver;
	
	@RequestMapping("dadTest")
	public String dragAndDrop() {
		return "test/dragAndDropTest";
	}
	
	@RequestMapping(value="fileUpload", method=RequestMethod.POST)
	public String fileUpload(MultipartFile [] file, HttpSession session, Model model) throws Exception {
		
		for(MultipartFile f: file){
			FileDTO fileDTO = new FileDTO();
			fileDTO.setOriname(f.getOriginalFilename());
			fileDTO.setFilename(FileSaver.transperSave(f, session, "upload"));
			model.addAttribute("data", fileDTO);
		}

		return "common/ajax";
	}
	
	@RequestMapping("payTest")
	public String pay(){
		return "test/payTest";
	}
	
	@RequestMapping("pdfTest")
	public String pdf(){
		return "test/pdfViewTest";
	}
	
	@RequestMapping("googleTest")
	public String google(){
		return "test/googleDriveTest";
	}
}
