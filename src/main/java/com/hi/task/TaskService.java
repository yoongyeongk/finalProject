package com.hi.task;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class TaskService {

	@Inject
	private TaskDAO taskDAO;
	
	public List<TaskDTO> list(int project_id) {
		return taskDAO.list(project_id);
	}
	
}
