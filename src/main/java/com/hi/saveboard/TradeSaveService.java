package com.hi.saveboard;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hi.project.util.ListData;
import com.hi.project.util.Pager;
import com.hi.project.util.RowNum;


@Service
public class TradeSaveService {

	@Inject
	TradeSaveDAO tradeSaveDAO;
	
	public ModelAndView selectList (String writer, ListData listData) throws Exception {
		int totalCount = 0;
		totalCount = tradeSaveDAO.getCount(writer);
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(totalCount);
		
		//윤경 수정
		Map<String, Object> boardMap = new HashMap<String, Object>();
		boardMap.put("writer", writer);
		boardMap.put("rownum", rowNum);
		
		List<TradeSaveDTO> ar = tradeSaveDAO.selectList(boardMap);
		//
		
		ModelAndView view = new ModelAndView();
		
		List<TradeSaveDTO> list = tradeSaveDAO.getList();
		Calendar sysdate = Calendar.getInstance();
		String [] date = null;
		for (TradeSaveDTO tradeSaveDTO2 : list) {
			date = tradeSaveDTO2.getReg_date().toString().split("-");
			Calendar rd = Calendar.getInstance();
			rd.set(Integer.parseInt(date[0]), Integer.parseInt(date[1])-1, Integer.parseInt(date[2]));
			long time = sysdate.getTimeInMillis() - rd.getTimeInMillis();
			long day = time / (24*60*60*1000);

			if(day > 31){
				tradeSaveDAO.delete(tradeSaveDTO2.getSave_num());
			}
		}
		
		view.addObject("count", totalCount);
		view.addObject("list", ar);
		view.addObject("pager", pager);
		view.setViewName("common/saveList");
		return view;
	}
	
	public TradeSaveDTO selectOne (int save_num) throws Exception {
		return tradeSaveDAO.selectOne(save_num);
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
	
	//윤경 수정
	//1. 임시저장 내용 불러오기
	public ModelAndView update (int save_num) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		TradeSaveDTO tradeSaveDTO = tradeSaveDAO.selectOne(save_num);
		
		if(tradeSaveDTO != null) {
			mv.addObject("one", tradeSaveDTO);
			mv.setViewName("trade/tradeBoardWrite");
		}else {
			mv.addObject("message", "내용을 불러올 수 없습니다.");
			mv.setViewName("redirect:../users/myWrite");
		}
		
		return mv;
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
	
}
