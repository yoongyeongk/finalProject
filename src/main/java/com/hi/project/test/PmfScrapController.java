package com.hi.project.test;

import java.util.Enumeration;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hi.project.pmfScrap.PmfScrapDTO;
import com.hi.project.pmfScrap.PmfScrapService;

@Controller
@RequestMapping(value="/scrap/*")
public class PmfScrapController {

	@Inject
	private PmfScrapService pmfScrapService;
	
	@RequestMapping(value="pmfList")
	public ModelAndView selectList(String nickname) {
		ModelAndView mv = null;
		
		try {
			mv = pmfScrapService.selectList(nickname);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping(value="pmfCheck")
	public ModelAndView scrapCheck(int num, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		try {
			result = pmfScrapService.scrapCheck(num, session);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.addObject("data", result);
		mv.setViewName("common/ajax");
		
		return mv;
	}
	
	@RequestMapping(value="pmfViews")
	public ModelAndView selectOne(int [] snums) {
		ModelAndView mv = null;
		
		try {
			mv = pmfScrapService.selectOne(snums);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping(value="pmfAdd", method=RequestMethod.POST)
	public String insert(String scrapNum, Model model, HttpSession session) {
		int result = 0;
		try {
			result = pmfScrapService.insert(scrapNum, session);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("data", result);		//0: 실패 - alert창 , 1: 성공 - confirm창
		
		return "common/ajax";
	}
	
	@RequestMapping(value="pmfDelete")
	public String delete(int snum, Model model) {
		int result = 0;
		try {
			result = pmfScrapService.delete(snum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String message = "삭제에 실패했습니다.";
		if(result>0) {
			message = "삭제되었습니다.";
		}
		model.addAttribute("message", message);
		
		return "community/listBox";
	}
	
	@RequestMapping(value="pmfDeleteAll")
	public String deleteAll(String nickname, Model model) {
		int result = 0;
		try {
			result = pmfScrapService.deleteAll(nickname);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String message = "삭제에 실패했습니다.";
		if(result>0) {
			message = "삭제되었습니다.";
		}
		model.addAttribute("message", message);
		
		return "community/listBox";
	}
}
