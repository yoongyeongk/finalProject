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
		System.out.println(listData.getCurPage());
		int curPage = listData.getCurPage();
		
		mv.addObject("list", ar);
		mv.addObject("curPage", curPage);
		mv.setViewName("community/replyResult");
		
		return mv;
	}
	
	public int insert(PmfReplyDTO pmfReplyDTO) throws Exception {
		return pmfReplyDAO.insert(pmfReplyDTO);
	}
	
	public int update(PmfReplyDTO pmfReplyDTO) throws Exception {
		return pmfReplyDAO.update(pmfReplyDTO);
	}
	
	public int delete(int rnum) throws Exception {
		return pmfReplyDAO.delete(rnum);
	}
	
	@Transactional
	public int reply(PmfReplyDTO pmfReplyDTO) throws Exception {
		int result = pmfReplyDAO.reply(pmfReplyDTO);
		pmfReplyDAO.stepUpdate(pmfReplyDTO);
		
		return result;
	}
}
