package com.hi.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/task/*")
public class TaskController {
	
	@RequestMapping(value="view")
	public String view() {
		return "task/task";
	}
}
