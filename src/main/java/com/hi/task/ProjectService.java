package com.hi.task;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ProjectService {

	@Inject
	private ProjectDAO projectDAO;

	public List<ProjectDTO> list() {
		return projectDAO.list();
	}
	
	public int create(ProjectDTO projectDTO) {
		return projectDAO.create(projectDTO);
	}
}
