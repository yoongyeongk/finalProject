package com.hi.project;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.tradeTag.TradeTagService;

@Controller
@RequestMapping(value="/tradeTag/*")
public class TradeTagController {

	@Inject
	TradeTagService tradeTagService;
	
	@RequestMapping(value="tagDelete")
	public String deleteOne (int num,Model model){
		
		try {
			 model.addAttribute("data", tradeTagService.deleteOne(num));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "common/ajax";
	}
}
