package com.hi.project;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.concurrent.ListenableFutureTask;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hi.project.pmf.PmfBoardDAO;
import com.hi.project.pmf.PmfBoardDTO;
import com.hi.project.pmf.PmfBoardService;
import com.hi.project.util.ListData;

@Controller
@RequestMapping(value="/pmf/*")
public class PmfController {

	@Inject
	private PmfBoardService pmfBoardService;
	
	//list
	//1. 페이지 이동
	@RequestMapping(value="pmfList", method=RequestMethod.GET)
	public String selectList() {
		return "community/pmf_list";
	}
	
	//2. 리스트 불러오기
	@RequestMapping(value="pmfList", method=RequestMethod.POST)
	public ModelAndView selectList(ListData listData){
		ModelAndView mv = null;
		try {
			mv = pmfBoardService.selectList(listData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(mv.getModel().get("list") == null) {
			mv.addObject("message", "리스트를 불러올 수 없습니다.");
		}
		
		return mv;
	}
	
	//view
	@RequestMapping(value="pmfView")
	public ModelAndView selectOne(int num) {
		ModelAndView mv = new ModelAndView();
		try {
			PmfBoardDTO pmfBoardDTO = pmfBoardService.selectOne(num);
			
			if(pmfBoardDTO != null) {
				mv.addObject("view", pmfBoardDTO);
				mv.setViewName("community/pmf_view");
			}else {
				mv.addObject("message", "게시글이 존재하지 않습니다.");
				mv.setViewName("community/pmf_list");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
	}
	
	//글쓰기 폼 이동
	@RequestMapping(value="pmfWrite", method=RequestMethod.GET)
	public ModelAndView insert(){
		ModelAndView mv = null;
		try {
			mv = pmfBoardService.insert();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
	}
	
	//글쓰기
	@RequestMapping(value="pmfWrite", method=RequestMethod.POST)
	public String insert(PmfBoardDTO pmfBoardDTO, String [] filename, String [] oriname, String [] size, RedirectAttributes rd){
	
		int result = 0;
		try {
			result = pmfBoardService.insert(pmfBoardDTO, filename, oriname, size);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String message = "게시글 등록에 실패했습니다.";
		String path = "redirect:./pmfWrite";
		
		if(result>0) {
			if(pmfBoardDTO.getTemp() == 0) {
				message = "게시글이 등록되었습니다.";
				path = "redirect:./pmfList";
			}else {
				Calendar cal = Calendar.getInstance();
				SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				Date date = new Date(cal.getTimeInMillis());
				
				message = "임시저장됨 "+fmt.format(date);
				path = "redirect:./pmfList";
			}
		}
		rd.addFlashAttribute("message", message);
		
		return path;
	}
	
	//update 폼 이동
	@RequestMapping(value="pmfUpdate", method=RequestMethod.GET)
	public ModelAndView update(int num) {
		ModelAndView mv = null;
		
		try {
			mv = pmfBoardService.update(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(!mv.isEmpty()) {
			mv.setViewName("community/pmf_update");
		}else {
			mv.addObject("message", "게시글을 수정할 수 없습니다.");
			mv.setViewName("redirect:./pmfList");
		}
		
		return mv;
	}
	
	//update
	@RequestMapping(value="pmfUpdate", method=RequestMethod.POST)
	public String update(PmfBoardDTO pmfBoardDTO, String [] filename, String [] oriname, String [] size, RedirectAttributes rd) {
		int result = 0;
		try {
			result = pmfBoardService.update(pmfBoardDTO, filename, oriname, size);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String message = "게시글 수정에 실패했습니다.";
		if(result>0){
			message = "게시글이 수정되었습니다.";
		}
		rd.addFlashAttribute("message", message);
		
		return "redirect:./pmfView?num="+pmfBoardDTO.getNum();
	}
	
	//delete
	@RequestMapping(value="pmfDelete")
	public String delete(int num, RedirectAttributes rd, HttpSession session) {
		int result = 0;
		try {
			result = pmfBoardService.delete(num, session);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String message = "게시글을 삭제할 수 없습니다.";
		if(result>0) {
			message = "게시글이 삭제되었습니다.";
		}
		rd.addFlashAttribute("message", message);
		
		return "redirect:./pmfList";
	}
	
	
	//sub_key list 불러오기
	@RequestMapping("subKey")
	@ResponseBody
	public List<String> subKey(String major_key){
		List<String> keys = new ArrayList<String>();
		try {
			keys = pmfBoardService.sub_key_list(major_key);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return keys;
	}
	
}
