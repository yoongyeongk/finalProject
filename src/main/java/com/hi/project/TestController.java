package com.hi.project;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hi.file.FileDTO;
import com.hi.project.util.FileSaver;

@Controller
@RequestMapping(value="/test/*")
public class TestController {

	@Inject
	private FileSaver fileSaver;
	
	@RequestMapping("dadTest")
	public String dragAndDrop() {
		return "test/dragAndDropTest";
	}
	
	@RequestMapping(value="fileUpload", method=RequestMethod.POST)
	@ResponseBody
	public FileDTO fileUpload(MultipartFile file, HttpSession session, Model model) throws Exception {
		
		FileDTO fileDTO = new FileDTO();
		fileDTO.setOriname(file.getOriginalFilename());
		fileDTO.setFilename(fileSaver.fileSave(file, session, "pmf_files"));

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
