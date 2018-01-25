package com.hi.project.pmfScrap;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.hi.users.UsersDTO;

@Service
public class PmfScrapService {

	@Inject
	private PmfScrapDAO pmfScrapDAO;
	
	public ModelAndView selectList(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		//String nickname = ((UsersDTO)session.getAttribute("user")).getNickname();
		String nickname = "nickname";		//test용
		List<PmfScrapDTO> ar = pmfScrapDAO.selectList(nickname);
		
		for(PmfScrapDTO pmfScrapDTO: ar) {
			int dDay = this.dDayCheck(pmfScrapDTO);
			String fin = "";
			if(dDay > 0) {
				fin = "D-" + String.valueOf(dDay);
			}else {
				fin = "마감";
			}
			pmfScrapDTO.setFin(fin);
		}
	
	mv.addObject("list", ar);
	mv.setViewName("community/pmf_scrap");

	return mv;
	}
	
	//D-Day 계산
	private int dDayCheck(PmfScrapDTO pmfScrapDTO) {
		int dDay = 0;
		if(!pmfScrapDTO.getPmfBoardDTO().getDuration_kind().equals("상시 모집")) {
			Date end_date = pmfScrapDTO.getPmfBoardDTO().getDuration_end();
			
			long today = Calendar.getInstance().getTimeInMillis();
			long end = end_date.getTime()/(1000*60*60*24);
			
			long day = end - today/(1000*60*60*24);
			
			if(day>0) {
				dDay = (int)day;
			}
		}
		return dDay;
	}

	public int scrapCheck(int num, HttpSession session) throws Exception {
		int result = 0;
		String nickname = "nickname";
		//session.getAttribute("member");
		PmfScrapDTO pmfScrapDTO = new PmfScrapDTO();
		pmfScrapDTO.setNickname(nickname);
		pmfScrapDTO.setNum(num);
		PmfScrapDTO pmfScrapDTO2 = pmfScrapDAO.scrapCheck(pmfScrapDTO);
		if(pmfScrapDTO2 != null){
			result = pmfScrapDTO2.getSnum();
		}
		
		return result;
	}
	
	//비교하기
	public ModelAndView selectOne(String snums) throws Exception {
		List<PmfScrapDTO> ar = new ArrayList<PmfScrapDTO>();
		ModelAndView mv = new ModelAndView();
		
		String [] sNums = snums.split(",");
		
		PmfScrapDTO pmfScrapDTO = null;
		for(String snum: sNums) {
			pmfScrapDTO = pmfScrapDAO.selectOne(Integer.parseInt(snum));
			ar.add(pmfScrapDTO);
		}
		mv.addObject("list", ar);
		mv.setViewName("community/scrapResult");
		
		return mv;
	}
	
	@Transactional
	public int insert(String scrapNum, HttpSession session) throws Exception {
		int result = 0;
		PmfScrapDTO pmfScrapDTO = new PmfScrapDTO();
		String nickname = "nickname";
				//((MemberDTO)session.getAttribute("member")).getId();		//세션 정한 후 추가하기
		String [] str = scrapNum.split(",");
		
		for(int i=0; i<str.length; i++){
			int num = Integer.parseInt(str[i]);
			pmfScrapDTO.setNum(num);
			pmfScrapDTO.setNickname(nickname);
			result = pmfScrapDAO.insert(pmfScrapDTO);
		}
		return result;
	}
	
	public int delete(int snum) throws Exception {
		return pmfScrapDAO.delete(snum);
	}
	
	public int deleteAll(String nickname) throws Exception {
		return pmfScrapDAO.deleteAll(nickname);
	}
}
