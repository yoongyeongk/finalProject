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

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonAnyFormatVisitor;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.hi.project.util.ListData;
import com.hi.tender.TenderDTO;
import com.hi.tender.TenderService;
import com.hi.trade.Config;
import com.hi.trade.SendSMS;
import com.hi.trade.TradeBoardDTO;
import com.hi.trade.TradeBoardService;
import com.hi.users.UsersDTO;


@Controller
@RequestMapping(value="/trade/*")
public class TradeBoardController {

	@Inject
	TradeBoardService tradeBoardService;
	@Inject
	TenderService tenderService;
	
	@RequestMapping(value="tenderList")
	public ModelAndView userList (String writer,ListData listData) {
		ModelAndView view = new ModelAndView();
			try {
				view = tenderService.selectList(writer,listData);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return view;
	}
	
	@RequestMapping(value="tenderUserList")
	public List<TradeBoardDTO> userList (String writer) {
		
		return null;
	}
	
	@RequestMapping(value="tradeBoardView")
	@ResponseBody
	public ModelAndView selectOne (int num,String writer,Model model){
			TenderDTO tenderDTO = new TenderDTO();
			ModelAndView view = new ModelAndView();
			try {
				tenderDTO.setNum(num);
				tenderDTO.setWriter(writer);
				tenderDTO = tradeBoardService.selectTender(tenderDTO);
				
				if(tenderDTO == null){
					tenderDTO = new TenderDTO();
					tenderDTO.setBidding_price(0);
				}
				
				view.addObject("tender",tenderDTO);
				view.addObject("one", tradeBoardService.selectOne(num));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return view;
	}
	
	@RequestMapping(value="tradeBoardCheck")
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
		config.setContent("Together! 인증 번호는 ["+rd+"]입니다");
		config.setReceiver(phone);
		
		SendSMS.send(config);
		return rd;
	}
	
	@RequestMapping(value="price")
	@ResponseBody
	public TradeBoardDTO priceAjax (int num) {
		TradeBoardDTO tradeBoardDTO = null;
		try {
			tradeBoardDTO = tradeBoardService.selectOne(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tradeBoardDTO;
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
	public ModelAndView update (Model model , int num,HttpSession session)  {
			ModelAndView view = new ModelAndView();
			UsersDTO usersDTO = (UsersDTO) session.getAttribute("user");
			view.addObject("form", "Update");
			try {
				TradeBoardDTO tradeBoardDTO =  tradeBoardService.selectOne(num);
				if(tradeBoardDTO != null && usersDTO.getNickname().equals(tradeBoardDTO.getWriter())){
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
	public String deleteAll (int num,String writer,Model model,HttpSession session) {
		int result = 0;
		UsersDTO usersDTO = (UsersDTO) session.getAttribute("user");
		try {
			if(usersDTO.getNickname().equals(writer)){
			result = tradeBoardService.deleteAll(num,session);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String message = "삭제 실패했습니다";
		String path = "../";
		if(result > 0){
			message = "삭제 됐습니다.";
			path ="./tradeBoardList?curPage=1";
		}
		model.addAttribute("message", message);
		model.addAttribute("path", path);
		return "common/result";
	}
	
	@RequestMapping(value="tradeBoardAC" , method = RequestMethod.POST)
	public String insertAC (Model model,TenderDTO tenderDTO,int curPage){
			String message = "등록실패했습니다 ,금액을 다시 확인해주세요";
			int result = 0;
			TenderDTO tenderDTO2 = null;
			try {
					tenderDTO2 = tradeBoardService.selectTender(tenderDTO);
					if(tenderDTO2 == null){
						result = tradeBoardService.insertAC(tenderDTO);
					}else{
						result = tradeBoardService.updateAC(tenderDTO);
					}
					 
					if(result > 0){
						message = "등록됐습니다";
						tradeBoardService.updatePrice(tenderDTO);
					}
				 model.addAttribute("message", message);
				 model.addAttribute("path", "./tradeBoardView?num="+tenderDTO.getNum()+"&writer="+tenderDTO.getWriter()+"&curPage="+curPage);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return "common/result";
	}
}
