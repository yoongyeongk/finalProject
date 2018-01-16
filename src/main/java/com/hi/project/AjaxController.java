package com.hi.project;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hi.users.UsersService;

@RestController
@RequestMapping(value = "/ajax/*")
public class AjaxController {

	@Inject
	private UsersService usersService;

	@RequestMapping(value = "idCheck")
	@ResponseBody
	public int idCheck(String username) {
		return usersService.idCheck(username);
	}

}
