package com.hi.project;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.boardFile.TradeBoardFileService;

@Controller
@RequestMapping(value="/file/*")
public class FileController {

	@Inject
	TradeBoardFileService fileService;
	
	
	@RequestMapping(value="fileDelete")
	public String deleteOne (int num,Model model) {
		try {
			model.addAttribute("data", fileService.deleteOne(num));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "common/ajax";
	}
}
