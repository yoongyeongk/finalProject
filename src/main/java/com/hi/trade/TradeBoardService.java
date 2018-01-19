package com.hi.trade;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hi.boardFile.TradeBoardFileService;
import com.hi.project.util.ListData;
import com.hi.project.util.Pager;
import com.hi.project.util.RowNum;
import com.hi.tradeTag.TradeTagDTO;
import com.hi.tradeTag.TradeTagService;


@Service
public class TradeBoardService {
	
	@Inject
	TradeBoardDAO tradeBoardDAO;
	@Inject
	TradeBoardFileService tradeBoardFileService;
	@Inject 
	TradeTagService tagService;
	
	public int insert(TradeBoardDTO tradeBoardDTO,HttpSession session) throws Exception {
			tradeBoardDTO.setNum(tradeBoardDAO.getNum());
			tradeBoardDTO.setFileNames(tradeBoardFileService.insert(tradeBoardDTO, session));
			tagService.insert(tradeBoardDTO);
		return tradeBoardDAO.insert(tradeBoardDTO);
	}
	
	public ModelAndView selectList(ListData listData) throws Exception{
			ModelAndView view = new ModelAndView();
			int totalCount = 0;
			Pager pager = null;
			List<TradeBoardDTO> ar = null;
			String [] date = null;
			Calendar sysdate = Calendar.getInstance();
			
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
			List<TradeTagDTO> tag = tradeBoardDAO.getTag();
			List<Long> days = new ArrayList<Long>();
			for (TradeBoardDTO tradeBoardDTO : ar) {
				date = tradeBoardDTO.getClosing_date().toString().split("-");
				Calendar c_d = Calendar.getInstance();
				c_d.set(Integer.parseInt(date[0]),Integer.parseInt(date[1])-1, Integer.parseInt(date[2]));
				long time = c_d.getTimeInMillis() - sysdate.getTimeInMillis();
				days.add(time / (24*60*60*1000));
			}
			
			if(ar.size() == 0){
				pager.setLastNum(1);
			}
			
			view.addObject("date", days);
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
			
				tradeBoardDTO.setFileNames(tradeBoardFileService.insert(tradeBoardDTO, session));
				tagService.insert(tradeBoardDTO);
			
		return tradeBoardDAO.update(tradeBoardDTO);
	}
	
	public int deleteAll(int num) throws Exception {
		int result = 0;
		result = tradeBoardFileService.deleteAll(num);
		if(result > 0){
			tagService.deleteAll(num);
		}
	return tradeBoardDAO.deleteAll(num);
	}
	
}
