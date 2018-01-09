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
			if(tradeSaveDTO.getTitle() == ""){
				tradeSaveDTO.setTitle("게시물 이름을 적어주세요");
			}
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
	public void selectList (String writer) throws Exception {
		
	}
}
