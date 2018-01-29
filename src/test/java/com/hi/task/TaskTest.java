package com.hi.task;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.hi.comment.CommentDTO;
import com.hi.project.AbstractTest;

public class TaskTest extends AbstractTest {

	@Inject
	private TaskService taskService;

	public void list() {
		List<TaskDTO> list = taskService.list(63);
		for (TaskDTO dto : list) {
			System.out.println("Task ID\t:\t" + dto.getTask_id());
			System.out.println("Project ID\t:\t" + dto.getProject_id());
			System.out.println("Commetns\t:\t" + dto.getTitle());
		}
	}
	
	public void view() {
		TaskDTO taskDTO = taskService.view(0);
		System.out.println(taskDTO.getTitle());
		System.out.println(taskDTO.getStatus());
		List<CommentDTO> comment = taskDTO.getComment();
		System.out.println("==== Comment ====");
		for(CommentDTO dto : comment) {
			System.out.println(dto.getComment_id());
			System.out.println(dto.getTask_id());
			System.out.println(dto.getContents());
			System.out.println(dto.getWriter());
			System.out.println(dto.getReg_date());
		}
	}

	@Test
	public void test() {
		this.view();
	}

}
