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
			int totalCount = 0;
			Pager pager = null;
			List<TradeBoardDTO> ar = null;
			
			
				if(listData.getSearch() != "" && listData.getSearch().charAt(0) == '#'){
					listData.setSearch(listData.getSearch().substring(1));
					listData.setKind("Tag");
					RowNum rowNum = listData.makeRow();
					totalCount = tradeBoardDAO.getTagCount(rowNum);
					pager = listData.makePage(totalCount);
					ar = tradeBoardDAO.selectTagSearch(rowNum);
					String s = "#"+pager.getSearch();
					
				}
				else{
					RowNum rowNum = listData.makeRow();
					totalCount = tradeBoardDAO.getCount(rowNum);
					pager = listData.makePage(totalCount);
					ar = tradeBoardDAO.selectList(rowNum);
				}

			List<TagDTO> tag = tradeBoardDAO.getTag();
			if(ar.size() == 0){
				pager.setLastNum(1);
			}
			view.addObject("list", ar);
			view.addObject("tags", tag);
			view.addObject("pager", pager);
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
