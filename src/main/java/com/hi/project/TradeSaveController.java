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
	public ModelAndView selectList (String writer,ListData listData) {
		ModelAndView view = new ModelAndView();
		listData.setPerPage(5);
		try {
			view = tradeSaveService.selectList(writer,listData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return view; 
	}
	
	@RequestMapping(value="saveDelete")
	public String delete (int save_num,Model model){
		 try {
			model.addAttribute("data", tradeSaveService.delete(save_num));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "common/ajax";
	}
	
	@RequestMapping(value="getTotalCount")
	@ResponseBody
	public Map<String, Object> getTotalCount (String writer) {
		Map<String, Object> map = new HashMap<String, Object>();
			try {
				map.put("count", tradeSaveService.getTotalCount(writer));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return map;
	}
}
