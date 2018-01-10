package com.hi.saveboard;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
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
		tradeSaveDAO.selectList(writer, rowNum);
		return null;
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
}
