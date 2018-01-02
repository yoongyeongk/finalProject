package com.hi.project.test;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hi.project.pmf.PmfBoardDTO;
import com.hi.project.pmf.PmfBoardService;

@Controller
@RequestMapping(value="/pmf/*")
public class PmfController {

	@Inject
	private PmfBoardService pmfBoardService;
	
	@RequestMapping("pmfList")
	public String findMemberList(){
		return "community/pmf_list";
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
		
		if(result>0) {
			rd.addFlashAttribute("message", "게시글이 등록되었습니다.");
		}
		
		return "redirect:./pmf_list";
	}
}
