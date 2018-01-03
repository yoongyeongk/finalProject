package com.hi.project;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hi.trade.TradeBoardDTO;
import com.hi.trade.TradeBoardService;

@Controller
@RequestMapping(value="/trade/*")
public class TradeBoardController {

	@Inject
	TradeBoardService tradeBoardService;
	
	@RequestMapping(value="tradeBoardList")
	public ModelAndView selectList (Model model) {
		ModelAndView view = new ModelAndView();
			try {
				view = tradeBoardService.selectList();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return view;
	}
	
	@RequestMapping(value="tradeBoardWrite" , method = RequestMethod.GET)
	public String write (Model model) {
			model.addAttribute("form", "Write");
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
	
	@RequestMapping(value="tradeBoardUpdate" , method = RequestMethod.GET)
	public String update (Model model , int num)  {
	
			model.addAttribute("form", "Update");
			try {
				model.addAttribute("one", tradeBoardService.selectOne(num));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return "trade/tradeBoardWrite";
	}
	
	@RequestMapping(value="tradeBoardUpdate" , method = RequestMethod.POST)
	public String update (TradeBoardDTO tradeBoardDTO,HttpSession session) {
			try {
				tradeBoardService.update(tradeBoardDTO, session);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return "redirect:/";
	}
	
	@RequestMapping(value="tradeBoardDelete")
	public String deleteAll (int num,Model model) {
		int result = 0;
		try {
			result = tradeBoardService.deleteAll(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String message = "삭제 실패했습니다";
		if(result > 0){
			message = "삭제 됐습니다.";
			model.addAttribute("message", message);
		}else{
			model.addAttribute("message", message);
		}
		return "redirect:/";
	}
}
