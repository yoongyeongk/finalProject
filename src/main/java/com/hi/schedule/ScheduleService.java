package com.hi.schedule;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.hi.partner.PartnerDTO;
import com.hi.schedule.ScheduleDTO;
import com.hi.users.UsersDTO;
import com.hi.partner.PartnerDAO;
import com.hi.schedule.ScheduleDAO;

@Service
public class ScheduleService {

	@Inject
	private ScheduleDAO scheduleDAO;
	@Inject
	private PartnerDAO partnerDAO;
	
	//수정을 위한 view 
			public ModelAndView ScheduleUpdateGET(int num,HttpServletRequest request)throws Exception{
				ModelAndView mv= new ModelAndView();
				ScheduleDTO scheduleDTO = null;
				num = Integer.parseInt(request.getParameter("num"));
				System.out.println("dao num : "+num);
				scheduleDTO = scheduleDAO.ScheduleUpdateGET(num);
				scheduleDTO.setStartday(scheduleDTO.getStartday().substring(0, scheduleDTO.getStartday().indexOf(" ")));
				scheduleDTO.setLastday(scheduleDTO.getLastday().substring(0, scheduleDTO.getLastday().indexOf(" ")));
				List<PartnerDTO> nick=	partnerDAO.partnerList(num);
				mv.addObject("nick", nick);
				mv.addObject("view", scheduleDTO);
				return mv;
			}
			//본격 수정 
			public int ScheduleUpdatePOST(ScheduleDTO scheduleDTO)throws Exception{
				System.out.println(scheduleDTO.getUsername());
				return scheduleDAO.ScheduleUpdatePOST(scheduleDTO);
			}
			//주최자가 파트너 스케줄까지 전체 삭제 버튼 누르면 삭제되게 
		public int ScheduleDelete(int schnum) throws Exception {			
			partnerDAO.partnerDelete(schnum);
			int result=scheduleDAO.ScheduleDelete(schnum);	
			return result;
		}
		//참석자가 삭제 
		public int SchdulepartDelete(int num,int pnum)throws Exception{
			
			partnerDAO.SchdulepartDelete(pnum);
			int result = scheduleDAO.SchdulepartDelete(num);
			System.out.println("파트너 삭제 service : "+num);
			return result;
		}
		//클릭한 날짜의 일정 상세정보 보여주기 
		public ModelAndView getScheduleDayArticles(ScheduleDTO scheduleDTO
				,HttpServletRequest request, HttpServletResponse response){
			ModelAndView mv = new ModelAndView();
			scheduleDTO.setStartday(request.getParameter("startday"));
			scheduleDTO.setUsername(request.getParameter("username"));
			String ah = scheduleDTO.getStartday();			
			try {
				List<ScheduleDTO> ar = scheduleDAO.jsonScheduleDayList(scheduleDTO);			
				List<PartnerDTO> part = null;
					System.out.println("success");
					for(int i =0; i<ar.size();i++){
						String st= scheduleDTO.getStartday();
						part=partnerDAO.partnerList(ar.get(i).getSchnum());
					}
					mv.addObject("nick", part);
					mv.addObject("list", ar);
					mv.setViewName("/schedule/dayListSchedule");
					/*System.out.println(part);*/
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			return mv;		
		}
		
		//캘린더에 불러와야할 아아디별 전체 값들
		public ModelAndView getScheduleArticles(String id){
			ModelAndView mv = new ModelAndView();
			List<ScheduleDTO> ar = null;
		//event 한개 객체
			try {
				ar= scheduleDAO.jsonScheduleList(id);
				List<Object> scheduledata = new ArrayList<Object>();//최종 배열
				JSONObject jsondata = null;
				//System.out.println(ar.size());
				for(ScheduleDTO scheduleDTO : ar){
					jsondata = new JSONObject();
					jsondata.put("schnum",scheduleDTO.getSchnum());
					jsondata.put("title", scheduleDTO.getTitle());		
					jsondata.put("color", scheduleDTO.getColor());
			//날짜 파싱
					String sr = scheduleDTO.getStartday();
					sr = sr.substring(0, sr.indexOf(" "));			
				String []dates = sr.split("-");
				//start 객체
				JSONObject start = new JSONObject();
				start.put("years", dates[0]);
				start.put("months",Integer.parseInt(dates[1])-1);
				start.put("days", dates[2]);
				start.put("hours", scheduleDTO.getStart_time());
				jsondata.put("start", start);

				//날짜 파싱	
				String la = scheduleDTO.getLastday();
				la = la.substring(0, la.indexOf(" "));			
			String []datas = la.split("-");
				//last 객체 
				JSONObject end = new JSONObject();
				end.put("years", datas[0]);
				end.put("months", Integer.parseInt(dates[1])-1);
				end.put("days", datas[2]);
				end.put("hours", scheduleDTO.getLast_time());
				jsondata.put("end", end);
				
				//color 객체 
				JSONObject color = new JSONObject();
				
				scheduledata.add(jsondata);
				}
				mv.addObject("data", scheduledata);
				mv.setViewName("common/jsonResult");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return mv;
		}
		
		public int write(ScheduleDTO scheduleDTO,String[]nickname,HttpSession session,HttpServletRequest request) throws Exception {
			int result = 0;
			String host = ((UsersDTO)session.getAttribute("user")).getUsername();
			scheduleDTO.setHost(host);
			result = scheduleDAO.write(scheduleDTO);
			if(nickname !=null){
			for(String s: nickname){
				PartnerDTO partnerDTO = new PartnerDTO();
				partnerDTO.setNickname(s);
				partnerDTO.setSchnum(scheduleDTO.getSchnum());
				result=partnerDAO.partnerinsert(partnerDTO);
				scheduleDTO.setUsername(scheduleDAO.selectUserName(s));
				scheduleDAO.write2(scheduleDTO);
				}
			}
			return  result;
		}
}
