package com.hi.project;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hi.project.pmfFile.PmfFileService;

@Controller
@RequestMapping(value="/pmfFile/*")
public class PmfFileController {

	@Inject
	private PmfFileService pmfFileService;
	
	@RequestMapping(value="deleteOne")
	public ModelAndView delete(int fnum, HttpSession session) {
		ModelAndView mv = null;
		
		try {
			mv = pmfFileService.deleteOne(fnum, session);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
	}
}
