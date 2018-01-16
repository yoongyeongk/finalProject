package com.hi.project;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hi.project.pmfReply.PmfReplyDTO;
import com.hi.project.pmfReply.PmfReplyService;
import com.hi.project.util.ListData;

@Controller
@RequestMapping(value="/reply/*")
public class PmfReplyController {

	@Inject
	private PmfReplyService pmfReplyService;
	
	//AJAX처리 , 서비스로 옮기고 ModelAndView 형식으로 리턴
	@RequestMapping(value="pmfReplyWrite", method=RequestMethod.POST)
	public String insert(PmfReplyDTO pmfReplyDTO, Model model) {
		//insert 처리
		int result = 0;
		
		try {
			result = pmfReplyService.insert(pmfReplyDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//성공,실패 여부 확인 및 결과 처리
		if(result>0) {
			model.addAttribute("data", "댓글이 등록되었습니다.");
		}else {
			model.addAttribute("data", "댓글 등록에 실패했습니다.");
		}
		
		return "common/ajax";
	}
	
	@RequestMapping(value="pmfReplyList")
	public ModelAndView selectList(int num, ListData listData) {
		//게시글 번호에 해당되는 댓글 불러오기
		ModelAndView mv = null;
		try {
			mv = pmfReplyService.selectList(num, listData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println(mv.getModel().get("curPage"));
		
		return mv;
	}
	
	@RequestMapping(value="pmfReplyUpdate", method=RequestMethod.GET)
	public ModelAndView update(int rnum) {
		ModelAndView mv = null;
		try {
			mv = pmfReplyService.selectOne(rnum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping(value="pmfReplyUpdate", method=RequestMethod.POST)
	public ModelAndView update(PmfReplyDTO pmfReplyDTO) {
		ModelAndView mv = null;
		try {
			mv = pmfReplyService.update(pmfReplyDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping(value="pmfReplyDelete")
	public ModelAndView delete(int rnum) {
		ModelAndView mv = null;
		
		try {
			mv = pmfReplyService.delete(rnum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
	}
	
	
	@RequestMapping(value="pmfReReply", method=RequestMethod.POST)
	public ModelAndView reply(PmfReplyDTO pmfReplyDTO) {
		ModelAndView mv = null;
		try {
			mv = pmfReplyService.reply(pmfReplyDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
	}
}