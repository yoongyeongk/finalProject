package com.hi.project;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hi.saveboard.TradeSaveDTO;
import com.hi.saveboard.TradeSaveService;
import com.hi.util.ListData;

@Controller
@RequestMapping(value="/tradeSave/*")
public class TradeSaveController {

	@Inject
	TradeSaveService tradeSaveService;
	
	@RequestMapping(value="tradeSaveInsert")
	@ResponseBody
	public Map<String, Object> insert (TradeSaveDTO tradeSaveDTO) {
		Map<String, Object> map = new HashMap<String, Object>();
		int result = 0;
		
		try {
	
			result =  tradeSaveService.insert(tradeSaveDTO);
			map.put("save_num", result);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="tradeSaveUpdate")
	@ResponseBody
	public void update (TradeSaveDTO tradeSaveDTO) {
		
		try {
			tradeSaveService.update(tradeSaveDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="saveList")
	public String selectList (String writer,ListData listData) throws Exception {
		
		listData.setPerPage(5);
		tradeSaveService.selectList(writer,listData);
		return "common/saveList"; 
	}
}
