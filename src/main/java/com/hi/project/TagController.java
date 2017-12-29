package com.hi.project;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.tag.TagService;

@Controller
@RequestMapping(value="/tag/*")
public class TagController {

	@Inject
	TagService tagService;
	
	@RequestMapping(value="tagDelete")
	public void delete (int num){
		int result = 0;
		try {
			result = tagService.delete(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(result);
	}
}
