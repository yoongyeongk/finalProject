package com.hi.project;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	@RequestMapping(value = "view")
	@ResponseBody
	public ProjectDTO view(int project_id) {
		return projectService.view(project_id);
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	@ResponseBody
	public int create(ProjectDTO projectDTO, HttpSession session) {
		return projectService.create(projectDTO, session);
	}
/*
	@RequestMapping(value = "update", method = RequestMethod.GET)
	@ResponseBody
	public void update() {

	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public void update() {

	}*/

	@RequestMapping(value = "delete")
	public int delete(int project_id) {
		return projectService.delete(project_id);
	}

}
