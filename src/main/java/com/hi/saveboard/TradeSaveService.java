package com.hi.saveboard;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hi.util.ListData;
import com.hi.util.Pager;
import com.hi.util.RowNum;

@Service
public class TradeSaveService {

	@Inject
	TradeSaveDAO tradeSaveDAO;
	
	public ModelAndView selectList (String writer,ListData listData) throws Exception {
		int totalCount = 0;
		totalCount = tradeSaveDAO.getCount(writer);
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(totalCount);
		List<TradeSaveDTO> ar = tradeSaveDAO.selectList(writer, rowNum);
		
		ModelAndView view = new ModelAndView();
		
		view.addObject("count", totalCount);
		view.addObject("list", ar);
		view.addObject("pager", pager);
		view.setViewName("common/saveList");
		return view;
	}
	
	public int insert (TradeSaveDTO tradeSaveDTO) throws Exception {
		int result = tradeSaveDAO.getNum();
		int writers = 0;
		writers = tradeSaveDAO.getWriters(tradeSaveDTO);
		
		if(writers < 50){
			tradeSaveDTO.setSave_num(result);
			tradeSaveDAO.insert(tradeSaveDTO);
		}else{
			result = 0;
		}
		return result;
	}
	
	public int update (TradeSaveDTO tradeSaveDTO) throws Exception {
		int result = 0;
		result = tradeSaveDAO.update(tradeSaveDTO);
		
		return result;
	}
	
	public int delete (int save_num) throws Exception{
		int result = 0;
		result = tradeSaveDAO.delete(save_num);
		return result;
	}
	
	public int getTotalCount (String writer) throws Exception{
		int result = 0;
		result = tradeSaveDAO.getCount(writer);
		return result;
	}
}
