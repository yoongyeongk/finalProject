package com.hi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter  {
	/*
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
	*/
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// UsersDTO usersDTO = (UsersDTO) request.getSession().getAttribute("user");
		Object obj = request.getSession().getAttribute("user");
		if(obj == null) {
			modelAndView.setViewName("common/result");
			modelAndView.addObject("message", "로그인 후 이용하세요.");
			response.sendRedirect("../users/login");
		}
		
		super.postHandle(request, response, handler, modelAndView);
	}
}
