package com.hi.project;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hi.task.ProjectDTO;
import com.hi.task.ProjectService;

@RestController
@RequestMapping(value = "/project/*")
public class ProjectController {

	@Inject
	private ProjectService projectService;

	@RequestMapping(value = "list")
	@ResponseBody
	public List<ProjectDTO> list(Model model, HttpSession session) {
		List<ProjectDTO> list = projectService.list(session);
		return list;
	}
	
	@RequestMapping(value = "create")
	@ResponseBody
	public int create(ProjectDTO projectDTO, HttpSession session) {
		return projectService.create(projectDTO, session);
	}

	@RequestMapping(value = "update")
	public void update() {

	}


	@RequestMapping(value = "delete")
	public void delete() {

	}

	@RequestMapping(value = "task")
	public void view() {

	}
}
