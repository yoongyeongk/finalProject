package com.hi.tender;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.hi.project.util.ListData;
import com.hi.project.util.Pager;
import com.hi.project.util.RowNum;
import com.hi.trade.TradeBoardDTO;

@Service
public class TenderService {

	@Inject
	private TenderDAO tenderDAO;
	
	public ModelAndView selectList (String writer,ListData listData) throws Exception {
			ModelAndView view = new ModelAndView();
			int totalCount = tenderDAO.totalCount(writer);
			RowNum rowNum = listData.makeRow();
			Pager pager = listData.makePage(totalCount);
			
			List<TradeBoardDTO> boardList = tenderDAO.selectList(writer,rowNum);
			List<TenderDTO> tender = tenderDAO.selectTender(writer);
			
			if(boardList.size() == 0){
				pager.setLastNum(1);
			}
			
			view.addObject("list", boardList);
			view.addObject("tender", tender);
			view.addObject("pager", pager);
		return view;
	}
}
