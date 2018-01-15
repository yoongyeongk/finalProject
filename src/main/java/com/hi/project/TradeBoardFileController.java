package com.hi.project;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.boardFile.TradeBoardFileService;

@Controller
@RequestMapping(value="/tradeBoardFile/*")
public class TradeBoardFileController {

	@Inject
	TradeBoardFileService tradeBoardFileService;
	
	
	@RequestMapping(value="fileDelete")
	public String deleteOne (int num,Model model) {
		try {
			model.addAttribute("data", tradeBoardFileService.deleteOne(num));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "common/ajax";
	}
}
