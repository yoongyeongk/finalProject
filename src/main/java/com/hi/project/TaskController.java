package com.hi.project;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hi.task.TaskDTO;
import com.hi.task.TaskService;

@Controller
@RequestMapping(value="/task/*")
public class TaskController {

	@Inject
	private TaskService taskService;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public ModelAndView main(int project_id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("project_id", project_id);
		mv.setViewName("project/task");
		return mv;
	}
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	@ResponseBody
	public List<TaskDTO> list(int project_id) {
		return taskService.list(project_id);
	}
	
	@RequestMapping(value="create")
	@ResponseBody
	public void create(TaskDTO taskDTO) {
		
	}
	
}
