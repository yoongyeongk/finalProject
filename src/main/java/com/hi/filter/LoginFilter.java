package com.hi.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest)request).getSession();
		// UsersDTO usersDTO = (UsersDTO) session.getAttribute("user");
		Object object = session.getAttribute("user");
		if(object == null) {
			request.setAttribute("message", "로그인 후 이용하세요");
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}
	
	
}