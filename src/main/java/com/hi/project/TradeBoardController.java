package com.hi.project;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hi.project.util.ListData;
import com.hi.trade.Config;
import com.hi.trade.SendSMS;
import com.hi.trade.TradeBoardDTO;
import com.hi.trade.TradeBoardService;


@Controller
@RequestMapping(value="/trade/*")
public class TradeBoardController {

	@Inject
	TradeBoardService tradeBoardService;
	
	
	@RequestMapping(value="tradeBoardView")
	public Model selectOne (int num,Model model){
			
			try {
				model.addAttribute("one", tradeBoardService.selectOne(num));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return model;
	}
	
	@RequestMapping(value="tradeBoardCheck")
	@ResponseBody
	public int check (String phone) {
		int rd = 0;
		Random random = new Random();
		rd = random.nextInt(50000);
		if(rd < 11111){
			for(int i=0;rd<11111;i++){
				rd = random.nextInt(50000);
			}
		}
		Config config = new Config();
		config.setContent("인증 번호는 ["+rd+"]입니다");
		config.setReceiver(phone);
		
		SendSMS.send(config);
		
		return rd;
	}
	
	@RequestMapping(value="tradeBoardList")
	public ModelAndView selectList (Model model,ListData listData) {
		ModelAndView view = new ModelAndView();
			try {
				view = tradeBoardService.selectList(listData);
				
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
	public ModelAndView update (Model model , int num)  {
			ModelAndView view = new ModelAndView();
			view.addObject("form", "Update");
			try {
				TradeBoardDTO tradeBoardDTO =  tradeBoardService.selectOne(num);
				if(tradeBoardDTO != null){
					view.addObject("one", tradeBoardDTO);
					view.setViewName("trade/tradeBoardWrite");
				}else{
					view.addObject("message"	, "업데이트를 실패했습니다");
					view.setViewName("redirect:/");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return view;
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
	public String deleteAll (int num,Model model,HttpSession session) {
		int result = 0;
		try {
			result = tradeBoardService.deleteAll(num,session);
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
