package com.hi.project;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.tag.TagService;

@Controller
@RequestMapping(value="/tag/*")
public class TagController {

	@Inject
	TagService tagService;
	
	@RequestMapping(value="tagDelete")
	public String deleteOne (int num,Model model){
		
		try {
			 model.addAttribute("data", tagService.deleteOne(num));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "common/ajax	";
	}
}
