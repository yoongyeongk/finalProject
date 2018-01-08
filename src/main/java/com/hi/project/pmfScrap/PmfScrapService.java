package com.hi.project.pmfScrap;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class PmfScrapService {

	@Inject
	private PmfScrapDAO pmfScrapDAO;
	
	public ModelAndView selectList(String nickname) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<PmfScrapDTO> ar = pmfScrapDAO.selectList(nickname);
		
		mv.addObject("list", ar);
		mv.setViewName("community/listBox");
		
		return mv;
	}
	
	public ModelAndView selectOne(int [] snums) throws Exception {
		List<PmfScrapDTO> ar = new ArrayList<PmfScrapDTO>();
		ModelAndView mv = new ModelAndView();
		
		PmfScrapDTO pmfScrapDTO = null;
		for(int snum: snums) {
			pmfScrapDTO = pmfScrapDAO.selectOne(snum);
			ar.add(pmfScrapDTO);
		}
		mv.addObject("list", ar);
		mv.setViewName("/");		//경로 설정하기
		
		return mv;
	}
	
	public int insert(PmfScrapDTO pmfScrapDTO) throws Exception {
		return pmfScrapDAO.insert(pmfScrapDTO);
	}
	
	public int delete(int snum) throws Exception {
		return pmfScrapDAO.delete(snum);
	}
	
	public int deleteAll(String nickname) throws Exception {
		return pmfScrapDAO.deleteAll(nickname);
	}
}
