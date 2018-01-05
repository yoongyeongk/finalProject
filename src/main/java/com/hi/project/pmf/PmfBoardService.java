package com.hi.project.pmf;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.hi.boardFile.FileDTO;
import com.hi.boardFile.FileSaver;
import com.hi.project.util.ListData;
import com.hi.project.util.Pager;

@Service
public class PmfBoardService {

	@Inject
	private PmfBoardDAO boardDAO;
	
	//list
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<PmfBoardDTO> ar = boardDAO.selectList(listData.makeRow());
		//페이징 처리
		int totalCount = boardDAO.getTotalCount(listData.makeRow());
		Pager pager = listData.makePage(totalCount);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("community/pmf_list");
		
		return mv;
	}
	
	//view
	public PmfBoardDTO selectOne(int num) throws Exception {
		PmfBoardDTO pmfBoardDTO = boardDAO.selectOne(num);
		boardDAO.hitUpdate(num);
		
		return pmfBoardDTO;
	}
	
	//write 1 - form
	public ModelAndView insert() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<String> major_key = boardDAO.major_key_list();
		List<String> sub_key = boardDAO.sub_key_list("IT/인터넷");
		
		mv.addObject("major_key", major_key);
		mv.addObject("sub_key", sub_key);
		mv.setViewName("community/pmf_write");
		
		return mv;
	}
	
	//write 2 - insert
	public int insert(PmfBoardDTO pmfBoardDTO) throws Exception {
		int result = boardDAO.insert(pmfBoardDTO);
		
		//file insert
		
		
		return result;
	}
	
	
	public void update() throws Exception {
		
	}
	
	public void delete() throws Exception {
		
	}
	
	public List<String> major_key_list() throws Exception {
		return boardDAO.major_key_list();
	}

	public List<String> sub_key_list(String major_key) throws Exception {
		return boardDAO.sub_key_list(major_key);
	}
	
}
