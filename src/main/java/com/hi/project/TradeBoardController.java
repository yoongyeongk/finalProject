package com.hi.project;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hi.trade.TradeBoardDTO;
import com.hi.trade.TradeBoardService;

@Controller
@RequestMapping(value="/trade/*")
public class TradeBoardController {

	@Inject
	TradeBoardService tradeBoardService;
	
	@RequestMapping(value="tradeBoardList")
	public String list () {
		
		return "trade/tradeBoardList";
	}
	
	@RequestMapping(value="tradeBoardWrite" , method = RequestMethod.GET)
	public String write () {
		
		return "trade/tradeBoardWrite";
	}
	
	@RequestMapping(value="tradeBoardWrite" , method = RequestMethod.POST)
	public String write (TradeBoardDTO tradeBoardDTO,HttpSession session) {
		int result = 0;
		try {
				result = tradeBoardService.insert(tradeBoardDTO, session);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return "redirect:/";
	}
	
	
}
