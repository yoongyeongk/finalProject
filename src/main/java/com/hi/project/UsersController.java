package com.hi.project;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hi.users.UsersDTO;
import com.hi.users.UsersService;

@Controller
@RequestMapping(value = "/users/*")
public class UsersController {

	@Inject
	private UsersService usersService;

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "users/join";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(UsersDTO usersDTO, HttpSession session) {
		try {
			usersService.join(usersDTO, session);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/users/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void login() {
		
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(UsersDTO usersDTO, Model model, HttpSession session) {
		try {
			usersDTO = usersService.login(usersDTO);
		} catch (Exception e) {
			usersDTO = null;
			e.printStackTrace();
		}
		if (usersDTO != null)
			session.setAttribute("user", usersDTO);
		return "redirect:/";
	}

	@RequestMapping(value = "callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback() throws Exception {
		return "users/callback";
	}

	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/users/login";
	}

	//서연 추가 
	@RequestMapping(value="usersNickCheck",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> nicknameCheck(HttpServletRequest request)throws Exception{
	    String nickname = request.getParameter("nickname");
	    String result =usersService.nicknameCheck(nickname);
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("result", result);
		return map;
	}
	
	//윤경 추가
	//1. 마이페이지
	@RequestMapping(value="myPage")
	public void myPage() {

	}
	
	//2-1. 회원정보 수정 - 페이지 이동
	@RequestMapping(value="usersUpdate", method=RequestMethod.GET)
	public String update() {
		return "users/update";
	}
	
	//2-2. 회원정보 수정 - 수정 프로세스
	@RequestMapping(value="usersUpdate", method=RequestMethod.POST)
	public ModelAndView update(UsersDTO usersDTO) {
		ModelAndView mv = null;

		//회원 정보 수정 프로세스
		mv = usersService.update(usersDTO);

		return mv;
	}

	//3. 회원 탈퇴
	@RequestMapping(value="usersDelete")
	public ModelAndView delete(HttpSession session) {
		ModelAndView mv = null;
		
		//삭제 처리
		mv = usersService.delete(session);
		
		return mv;
	}
	
	//4. 내 글 모아보기
	@RequestMapping(value="myWrite")
	public ModelAndView myWrite(HttpSession session) {
		ModelAndView mv = null;
		
		//글 목록 불러오기
		
		return mv;
	}
	
}
