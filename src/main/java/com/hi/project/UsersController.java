package com.hi.project;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

}