package com.hi.project;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hi.comment.CommentDTO;
import com.hi.task.TaskDTO;
import com.hi.task.TaskService;

@Controller
@RequestMapping(value = "/task/*")
public class TaskController {

	@Inject
	private TaskService taskService;

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public ModelAndView main(int project_id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("project_id", project_id);
		mv.setViewName("project/task");
		return mv;
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	@ResponseBody
	public List<TaskDTO> list(int project_id) {
		return taskService.list(project_id);
	}

	@RequestMapping(value = "create")
	@ResponseBody
	public int create(TaskDTO taskDTO) {
		return taskService.create(taskDTO);
	}

	@RequestMapping(value = "update")
	@ResponseBody
	public int update(TaskDTO taskDTO) {
		return taskService.update(taskDTO);
	}

	@RequestMapping(value = "delete")
	@ResponseBody
	public int delete(int task_id) {
		return taskService.delete(task_id);
	}

	@RequestMapping(value = "view")
	@ResponseBody
	public TaskDTO view(int task_id) {
		return taskService.view(task_id);
	}

	@RequestMapping(value = "comment/list")
	@ResponseBody
	public List<CommentDTO> commentList(int task_id) {
		return taskService.commentList(task_id);
	}

	@RequestMapping(value = "comment/write")
	@ResponseBody
	public int commentWrite(CommentDTO commentDTO) {
		return taskService.commentWrite(commentDTO);
	}

	@RequestMapping(value = "comment/update")
	@ResponseBody
	public int commentUpdate(CommentDTO commentDTO) {
		return taskService.commentUpdate(commentDTO);
	}

	@RequestMapping(value = "comment/delete")
	@ResponseBody
	public int commentDelete(int comment_id) {
		return taskService.commentDelete(comment_id);
	}

}
