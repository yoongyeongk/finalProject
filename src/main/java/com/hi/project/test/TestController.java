package com.hi.project.test;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hi.boardFile.FileDTO;
import com.hi.boardFile.FileSaver;
import com.hi.project.pmf.PmfBoardDAO;

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
	@ResponseBody
	public FileDTO fileUpload(MultipartFile file, HttpSession session, Model model) throws Exception {
		
		FileDTO fileDTO = new FileDTO();
		fileDTO.setOriname(file.getOriginalFilename());
		fileDTO.setFilename(FileSaver.transperSave(file, session, "pmf_files"));

		return fileDTO;
	}
	
	@RequestMapping("login")
	public String login(){
		return "login/loginForm";
	}

	@RequestMapping("payTest")
	public String pay(){
		return "test/payTest";
	}
	
	@RequestMapping("pdfTest")
	public String pdf(){
		return "test/pdfViewTest";
	}
	
	@RequestMapping(value="pdfTest",method=RequestMethod.POST)
	public String pdf(String editor1, Model model){
		System.out.println(editor1);
		model.addAttribute("result", editor1);
		
		return "test/pdfViewTest";
	}
	
	@RequestMapping("googleTest")
	public String google(){
		return "test/googleDriveTest";
	}
	
	
}
