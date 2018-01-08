package com.hi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter  {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		boolean check = true;
		
		if(obj == null) {
			response.sendRedirect(session.getServletContext().getContextPath());
			check = false;
		}
		
		return check;
	}
}
