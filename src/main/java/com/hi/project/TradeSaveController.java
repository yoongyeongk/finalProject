package com.hi.project;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hi.project.util.ListData;
import com.hi.saveboard.TradeSaveDTO;
import com.hi.saveboard.TradeSaveService;


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
	
	@RequestMapping(value="tradeSaveUpdate", method=RequestMethod.GET)
	public ModelAndView update (int save_num) {
		ModelAndView mv = null;
		
		try {
			mv = tradeSaveService.update(save_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
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
	@ResponseBody
	public ModelAndView selectList (int save_num, String writer, ListData listData) {
		ModelAndView view = new ModelAndView();
		listData.setPerPage(5);
		try {
			view = tradeSaveService.selectList(writer,listData);
			view.addObject("num_compare", save_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return view; 
	}
	
	@RequestMapping(value="saveOne")
	@ResponseBody
	public TradeSaveDTO selectOne (int save_num) {
		TradeSaveDTO tradeSaveDTO = null;
		try {
			tradeSaveDTO = tradeSaveService.selectOne(save_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tradeSaveDTO;
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
	
}
