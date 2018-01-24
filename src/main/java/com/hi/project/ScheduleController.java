package com.hi.project;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hi.partner.PartnerDTO;
import com.hi.schedule.ScheduleDTO;
import com.hi.schedule.ScheduleService;



@Controller
@RequestMapping(value="/schedule/**")
public class ScheduleController {

	@Inject
	ScheduleService ScheduleService;
	
	@RequestMapping(value="scheduleUpdatePOST",method =RequestMethod.POST)
	public String ScheduleUpdate(ScheduleDTO scheduleDTO,Model model,HttpServletRequest request){
		int result = 0;		
		try {			
			result = ScheduleService.ScheduleUpdatePOST(scheduleDTO);
			System.out.println("schnum : "+scheduleDTO.getNum());
			System.out.println("result : "+result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String message = "일정수정이 실패하였습니다.";
		if(result>0){
			message = "수정이 완료되었습니다.";
		}
		model.addAttribute("data", message);
		return "common/updateresult";		
	}		
	@RequestMapping(value="ScheduleUpdate",method=RequestMethod.GET)
	public ModelAndView ScheduleUpdate(int num,HttpServletRequest request)throws Exception{		
		ModelAndView mv = ScheduleService.ScheduleUpdateGET(num, request);
		System.out.println(num);
		mv.setViewName("/schedule/ScheduleUpdate");
		return mv;
	}
	
	//주최자가 파트너 스케줄까지 전체 삭제 버튼 누르면 삭제되게 
	@RequestMapping(value="scheduleDelete",method=RequestMethod.GET)
	public String scheduleDeleteOne(int schnum, RedirectAttributes rd){
		System.out.println("schnum : "+schnum);
		int result = 0;
	try {
		result = ScheduleService.ScheduleDelete(schnum);
		System.out.println("삭제갯수 :" + result);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	String message = "삭제 실패";
	if(result>0){
		message = "삭제 성공";
	}
	rd.addFlashAttribute("message", message);	
	return "redirect:./mainSchedule";
	}
	//파트너 스케줄만  삭제 버튼 누르면 삭제되게 
	@RequestMapping(value="SchdulepartDelete",method=RequestMethod.GET)
	public String SchdulepartDelete(int num,int pnum, RedirectAttributes rd){
		System.out.println("partDelete pnum : "+pnum);
		System.out.println("partDelete num :"+num);
		int result = 0;
	try {
		result = ScheduleService.SchdulepartDelete(num, pnum);
		System.out.println("삭제갯수 :" + result);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	String message = "파트너삭제 실패";
	if(result>0){
		message = "파트너 삭제 성공";
	}
	rd.addFlashAttribute("message", message);	
	return "redirect:./mainSchedule";
	}
	
	//날짜 클릭시 그 날짜의 일정 홛인하는 것 
	@RequestMapping(value="ScheduleDayJson")
	@ResponseBody
	public ModelAndView ScheduleDayJson(ScheduleDTO scheduleDTO,HttpServletRequest request
			,HttpServletResponse response){		
		ModelAndView mv = ScheduleService.getScheduleDayArticles(scheduleDTO, request, response);
		return mv;	
	}
	
	@RequestMapping(value="ScheduleJson")
	@ResponseBody
	public ModelAndView ScheduleJson(String username){		
		ModelAndView mv = ScheduleService.getScheduleArticles(username);
		return mv;	
	}
	
	@RequestMapping(value="ScheduleWrite", method =RequestMethod.POST)
	public String ScheduleWrite(ScheduleDTO scheduleDTO,RedirectAttributes rd,
String []nickname,HttpSession session,HttpServletRequest request){
		int result = 0;
		try {			
				result = ScheduleService.write(scheduleDTO, nickname, session, request);			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String message = "일정등록을 재실행해주세요.";
		if(result>0){
		
			message = "일정이 등록되었습니다.";
		}
		rd.addFlashAttribute("message", message);		
		return "redirect:./mainSchedule";		
	}
	
	@RequestMapping(value="mainSchedule")
	public void mainSchedule(){
		
	}
	
	
}
