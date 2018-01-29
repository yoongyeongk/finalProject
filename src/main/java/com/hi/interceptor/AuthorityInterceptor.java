package com.hi.interceptor;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hi.project.pmf.PmfBoardDTO;
import com.hi.project.pmfReply.PmfReplyDAO;
import com.hi.project.pmfReply.PmfReplyDTO;
import com.hi.users.UsersDTO;

public class AuthorityInterceptor extends HandlerInterceptorAdapter{
	
	@Inject
	private PmfReplyDAO pmfReplyDAO;

/*	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		UsersDTO usersDTO = (UsersDTO)session.getAttribute("user");
		
		Map<String, Object> map = modelAndView.getModel();
		PmfReplyDTO pmfReplyDTO = (PmfReplyDTO)map.get("view");
		String path = modelAndView.getViewName();
		
		System.out.println(pmfReplyDTO.getWriter());
		System.out.println(path);
		
		if(pmfReplyDTO.equals(usersDTO.getUsername())) {
			response.sendRedirect(path);
		}else {
			response.sendRedirect("../pmf/pmfView?num="+pmfReplyDTO.getNum());
		}
		
	}*/

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean check = true;
		
		String username = ((UsersDTO)request.getSession().getAttribute("user")).getUsername();
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		
		PmfReplyDTO pmfReplyDTO = pmfReplyDAO.selectOne(rnum);
		
		if(username.equals(pmfReplyDTO.getWriter())) {
			check = true;
		}else {
			check = false;
		}
		
		return check;
	}
	
}
