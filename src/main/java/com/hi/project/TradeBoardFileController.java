package com.hi.project;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hi.boardFile.TradeBoardFileDTO;
import com.hi.boardFile.TradeBoardFileService;

@RestController
@RequestMapping(value="/tradeBoardFile/*")
public class TradeBoardFileController {

	@Inject
	TradeBoardFileService tradeBoardFileService;

	@RequestMapping(value="fileDelete")
	public String deleteOne (int fnum,Model model,HttpSession session) {
		try {
			model.addAttribute("data", tradeBoardFileService.deleteOne(fnum,session));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "common/ajax";
	}
	
	@RequestMapping(value="fileSelect")
	@ResponseBody
	public List<TradeBoardFileDTO> selectFile (int num) {
			List<TradeBoardFileDTO> ar = new ArrayList<TradeBoardFileDTO>();
		try {
				ar = tradeBoardFileService.selectFile(num);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return ar;
	}
}
