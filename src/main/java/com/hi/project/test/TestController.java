package com.hi.project.test;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value="/test/*")
public class TestController {

	@RequestMapping("dadTest")
	public String dragAndDrop() {
		return "test/dragAndDropTest";
	}
	
	@RequestMapping("file-upload")
	public String fileUpload(HttpServletRequest request, MultipartFile [] file) {
		Enumeration<String> em = request.getParameterNames();
		
		while(em.hasMoreElements()){
			System.out.println(em.nextElement());
		}
		
		return "";
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
