package com.hi.project;

import java.util.List;

import javax.inject.Inject;

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
	public List<ProjectDTO> list(Model model) {
		List<ProjectDTO> list = projectService.list();
		return list;
	}
	
	@RequestMapping(value = "create")
	public int create(ProjectDTO projectDTO) {
		return projectService.create(projectDTO);
	}

	@RequestMapping(value = "task")
	public void view() {
		
	}

	@RequestMapping(value = "update")
	public void update() {

	}

	@RequestMapping(value = "delete")
	public void delete() {

	}

}
