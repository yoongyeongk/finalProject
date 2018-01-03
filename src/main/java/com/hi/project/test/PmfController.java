package com.hi.project.test;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hi.project.pmf.PmfBoardDTO;
import com.hi.project.pmf.PmfBoardService;
import com.hi.project.util.ListData;

@Controller
@RequestMapping(value="/pmf/*")
public class PmfController {

	@Inject
	private PmfBoardService pmfBoardService;
	
	@RequestMapping("pmfList")
	public ModelAndView findMemberList(ListData listData){
		ModelAndView mv = null;
		try {
			mv = pmfBoardService.selectList(listData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//예외처리
		if(mv.getModel().get("list") == null) {
			mv.addObject("message", "리스트를 불러올 수 없습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping(value="pmfWrite", method=RequestMethod.GET)
	public String memberWrite(){
		return "community/pmf_write";
	}
	
	@RequestMapping(value="pmfWrite", method=RequestMethod.POST)
	public String memberWrite(PmfBoardDTO pmfBoardDTO, RedirectAttributes rd){
		int result = 0;
		
		try {
			result = pmfBoardService.insert(pmfBoardDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String message = "게시글 등록에 실패했습니다.";
		if(result>0) {
			message = "게시글이 등록되었습니다.";
		}
		rd.addFlashAttribute("message", message);
		
		return "redirect:./pmf_list";
	}
}
