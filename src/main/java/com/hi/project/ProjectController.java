package com.hi.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/project/*")
public class ProjectController {

	@RequestMapping(value="projectList")
	public String list() {
		return  "project/projectList";
	}
	
}
