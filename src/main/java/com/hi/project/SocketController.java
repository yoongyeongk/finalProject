package com.hi.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/chatting/*")
public class SocketController {
		
	@RequestMapping(value="multiChat")
	public String multichatPage(){
		return "chatting/multiChat";
	}
	
	@RequestMapping(value="Messanger")
	public String messangerPage(){
		return "chatting/Messanger";
	}
	
	@RequestMapping(value="chattingPage")
	public String chattingPage(){
		return "chatting/chattingPage";
	}
}
