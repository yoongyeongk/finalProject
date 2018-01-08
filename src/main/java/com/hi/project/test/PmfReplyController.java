package com.hi.project.test;

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
	
	//AJAX처리
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
		System.out.println(mv.getModel().get("curPage"));
		
		return mv;
	}
	
	@RequestMapping(value="pmfReplyUpdate", method=RequestMethod.GET)
	public String update() {
		//수정 폼 불러오기
		return "community/replyForm";
	}
	
	@RequestMapping(value="pmfReplyUpdate", method=RequestMethod.POST)
	public void update(PmfReplyDTO pmfReplyDTO) {
		//댓글 수정
	}
	
	@RequestMapping(value="pmfReplyDelete")
	public void delete(int rnum) {
		//댓글 삭제
	}
	
	@Transactional
	@RequestMapping(value="pmfReReply", method=RequestMethod.POST)
	public void reply(PmfReplyDTO pmfReplyDTO) {
		//대댓글 달기
	}
}