package com.hi.project.pmfReply;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.hi.project.util.ListData;

@Service
public class PmfReplyService {

	@Inject
	private PmfReplyDAO pmfReplyDAO;
	
	public ModelAndView selectList(int num, ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<PmfReplyDTO> ar = pmfReplyDAO.selectList(listData.makeRow(num));
		//System.out.println(listData.getCurPage());
		int curPage = listData.getCurPage();
		
		mv.addObject("list", ar);
		//mv.addObject("curPage", curPage);
		mv.setViewName("community/replyResult");
		
		return mv;
	}
	
	public ModelAndView selectOne(int rnum) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		PmfReplyDTO pmfReplyDTO = pmfReplyDAO.selectOne(rnum);
		mv.addObject("view", pmfReplyDTO);
		mv.setViewName("community/replyForm");
		
		return mv;
	}
	
	public int insert(PmfReplyDTO pmfReplyDTO) throws Exception {
		return pmfReplyDAO.insert(pmfReplyDTO);
	}
	
	public ModelAndView update(PmfReplyDTO pmfReplyDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = pmfReplyDAO.update(pmfReplyDTO);
		
		if(result>0){
			mv.addObject("data", "댓글이 수정되었습니다.");
		}else{
			mv.addObject("data", "댓글을 수정할 수 없습니다.");
		}
		mv.setViewName("common/ajax");
	
		return mv;
	}
	
	public ModelAndView delete(int rnum) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = pmfReplyDAO.delete(rnum);
		
		if(result>0){
			mv.addObject("data", "댓글이 삭제되었습니다.");
		}else{
			mv.addObject("data", "댓글을 삭제할 수 없습니다.");
		}
		mv.setViewName("common/ajax");
		
		return mv;
	}
	
	@Transactional
	public ModelAndView reply(PmfReplyDTO pmfReplyDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		PmfReplyDTO pmfReplyDTO2 = pmfReplyDAO.selectOne(pmfReplyDTO.getRnum());

		pmfReplyDTO2.setWriter(pmfReplyDTO.getWriter());
		pmfReplyDTO2.setContents(pmfReplyDTO.getContents());
		
		pmfReplyDAO.stepUpdate(pmfReplyDTO);
		int result = pmfReplyDAO.reply(pmfReplyDTO2);
		
		if(result>0){
			mv.addObject("data", "댓글이 등록되었습니다.");
		}else{
			mv.addObject("data", "댓글 등록에 실패했습니다.");
		}
		mv.setViewName("common/ajax");
		
		return mv;
	}
}
