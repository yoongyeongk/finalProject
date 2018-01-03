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
	
	public void selectOne() throws Exception {
		
	}
	
	public int insert(PmfBoardDTO pmfBoardDTO) throws Exception {
		int result = boardDAO.insert(pmfBoardDTO);
		//기타 자료 insert하기, 트랜잭션 처리
		return result;
	}
	
	public void update() throws Exception {
		
	}
	
	public void delete() throws Exception {
		
	}
	
	public void key_value_list() throws Exception {
		
	}
}
