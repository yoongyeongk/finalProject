package com.hi.task;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.hi.project.AbstractTest;

public class TaskTest extends AbstractTest {

	@Inject
	private TaskService taskService;

	public void list() {
		List<TaskDTO> list = taskService.list(1);
		for (TaskDTO dto : list) {
			System.out.println("Task ID :\t" + dto.getTask_id());
			System.out.println("Project ID :\t" + dto.getProject_id());
			System.out.println("Commetns :\t" + dto.getTitle());
		}
	}

	@Test
	public void test() {
		this.list();
	}

}
