package com.hi.trade;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hi.boardFile.FileDAO;
import com.hi.boardFile.FileDTO;
import com.hi.boardFile.FileSaver;
import com.hi.boardFile.FileService;
import com.hi.tag.TagDTO;
import com.hi.tag.TagService;
import com.hi.util.ListData;
import com.hi.util.Pager;
import com.hi.util.RowNum;

@Service
public class TradeBoardService {
	
	@Inject
	TradeBoardDAO tradeBoardDAO;
	@Inject
	FileService fileService;
	@Inject 
	TagService tagService;
	
	public int insert(TradeBoardDTO tradeBoardDTO,HttpSession session) throws Exception {
			tradeBoardDTO.setNum(tradeBoardDAO.getNum());
			tradeBoardDTO.setFileNames(fileService.insert(tradeBoardDTO, session));
			tagService.insert(tradeBoardDTO);
			
		return tradeBoardDAO.insert(tradeBoardDTO);
	}
	
	public ModelAndView selectList(ListData listData) throws Exception{
			ModelAndView view = new ModelAndView();
			RowNum rowNum = listData.makeRow();
			int totalCount = tradeBoardDAO.getCount(rowNum);
			
			Pager pager = listData.makePage(totalCount);
			
			
			List<TradeBoardDTO> ar = tradeBoardDAO.selectList(rowNum);
			List<TagDTO> tag = tradeBoardDAO.getTag();
			
			view.addObject("pager", pager);
			view.addObject("list", ar);
			view.addObject("tags", tag);
			view.setViewName("trade/tradeBoardList");
		return view;
	}
	
	public TradeBoardDTO selectOne(int num) throws Exception {
			TradeBoardDTO tradeBoardDTO = tradeBoardDAO.selectOne(num);
			
		return tradeBoardDTO;
	}
	
	public int update (TradeBoardDTO tradeBoardDTO,HttpSession session) throws Exception {
		System.out.println(tradeBoardDTO.getImg());
			
				tradeBoardDTO.setFileNames(fileService.insert(tradeBoardDTO, session));
				tagService.insert(tradeBoardDTO);
			
		return tradeBoardDAO.update(tradeBoardDTO);
	}
	
	public int deleteAll(int num) throws Exception {
		int result = 0;
		result = fileService.deleteAll(num);
		if(result > 0){
			tagService.deleteAll(num);
		}
	return tradeBoardDAO.deleteAll(num);
	}

	
}
