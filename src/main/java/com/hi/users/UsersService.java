package com.hi.users;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hi.project.util.FileSaver;

@Service
public class UsersService {

	@Inject
	private UsersDAO usersDAO;

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
	public ModelAndView update(UsersDTO usersDTO) {
		ModelAndView mv = new ModelAndView();
		
		int result = usersDAO.update(usersDTO);
		
		//파일 수정 시 처리
		
		if(result>0) {
			mv.addObject("message", "수정되었습니다.");
			mv.setViewName("redirect:./myPage");
		}else {
			mv.addObject("message", "수정에 실패했습니다.");
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
			mv.setViewName("redirect:./");
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
	
}
