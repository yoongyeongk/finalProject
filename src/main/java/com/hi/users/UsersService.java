package com.hi.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hi.project.pmf.PmfBoardDAO;
import com.hi.project.pmf.PmfBoardDTO;
import com.hi.project.util.FileSaver;
import com.hi.project.util.ListData;
import com.hi.saveboard.TradeSaveDAO;
import com.hi.saveboard.TradeSaveDTO;
import com.hi.trade.TradeBoardDAO;
import com.hi.trade.TradeBoardDTO;

@Service
public class UsersService {

	@Inject
	private UsersDAO usersDAO;
	
	@Inject
	private PmfBoardDAO pmfBoardDAO;
	
	@Inject
	private TradeBoardDAO tradeBoardDAO;
	
	@Inject
	private TradeSaveDAO tradeSaveDAO;
	
	@Inject
	private FileSaver fileSaver;

	public int join(UsersDTO usersDTO, HttpSession session) throws Exception {
		MultipartFile file = usersDTO.getFile();
		ProfileImgDTO imgDTO = new ProfileImgDTO();
		imgDTO.setFile_name(fileSaver.fileSave(file, session, "upload"));
		imgDTO.setOriginal_name(file.getOriginalFilename());
		imgDTO.setUsername(usersDTO.getUsername());
		usersDAO.insert(imgDTO);

		return usersDAO.join(usersDTO);
	}
	
	public int idCheck(String username) {
		return usersDAO.idCheck(username);
	}

	public UsersDTO login(UsersDTO usersDTO) {
		return usersDAO.login(usersDTO);
	}

	@Transactional
	public ModelAndView update(UsersDTO usersDTO, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		int result = usersDAO.update(usersDTO);
		
		//파일 수정 시 처리
		
		if(result>0) {
			//session 정보 수정하기
			usersDTO = usersDAO.selectOne(usersDTO.getUsername());
			session.setAttribute("user", usersDTO);
			mv.setViewName("redirect:./myPage");
		}else {
			mv.setViewName("users/usersUpdate");
		}
		
		return mv;
	}

	public ModelAndView delete(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String username = ((UsersDTO)session.getAttribute("user")).getUsername();
		
		int result = usersDAO.delete(username);
		
		if(result>0) {
			session.invalidate();
			mv.addObject("message", "탈퇴되었습니다.");
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("message", "탈퇴할 수 없습니다.");
			mv.setViewName("users/myPage");
		}
		
		return mv;
	}
	
	//서연 추가 
	public String nicknameCheck(String nickname)throws Exception{
		return usersDAO.nicknameCheck(nickname);
	}
	
	//윤경 추가
	//내 글 모아보기
	public ModelAndView myWrite(HttpSession session, ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		String username = ((UsersDTO)session.getAttribute("user")).getUsername();
		Map<String, Object> map = new HashMap<String, Object>();		//전체 board
		
		//1. pmf board 불러오기
		Map<String, Object> boardMap = new HashMap<String, Object>();	//pmf 파라미터 맵
		boardMap.put("writer", username);
		boardMap.put("rownum", listData.makeRow());
		
		List<PmfBoardDTO> pmfList = pmfBoardDAO.myBoard(boardMap);
		map.put("pmf", pmfList);
		
		//2. trade board 불러오기
		List<TradeBoardDTO> tradeList = tradeBoardDAO.myBoard(boardMap);
		map.put("trade", tradeList);
		
		//3. temp 불러오기
		//3-1. pmfBoard
		List<PmfBoardDTO> pmfTemp = pmfBoardDAO.tempList(boardMap);
		
		for(PmfBoardDTO dto: pmfTemp) {
			if(dto.getProject_detail() != null) {
				String beforeRemove = dto.getProject_detail();
				dto.setProject_detail(this.htmlRemove(beforeRemove));
			}else {
				dto.setProject_detail("작성된 내용이 없습니다.");
			}
		}
		
		map.put("pmfTemp", pmfTemp);
		
		//3-2. tradesave
		List<TradeSaveDTO> tradeTemp = tradeSaveDAO.selectList(boardMap);
		
		for(TradeSaveDTO dto: tradeTemp) {
			if(dto.getContents() != null) {
				String beforeRemove = dto.getContents();
				dto.setContents(this.htmlRemove(beforeRemove));
			}else {
				dto.setContents("작성된 내용이 없습니다.");
			}
		}
		
		map.put("tradeTemp", tradeTemp);
		
		mv.addObject("map", map);
		mv.setViewName("users/myWrite");
		
		return mv;
	}
	
	private String htmlRemove(String beforeRemove) throws Exception {
		String afterRemove = beforeRemove.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		
		if(afterRemove.length() > 40) {
			afterRemove = afterRemove.substring(0,40);
		}
		
		return afterRemove;
	}
}
