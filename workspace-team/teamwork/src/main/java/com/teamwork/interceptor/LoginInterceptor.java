package com.teamwork.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (request.getRequestURI().indexOf("/login") > 0
				|| request.getRequestURI().indexOf("/dologin") > 0) {
			return true;
		}
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("useremail");
		if (email != null) {
			System.out.println("interceptor info:" + email);
			return true;
		}
		
		request.getRequestDispatcher("/WEB-INF/views/account/login.jsp").forward(request, response);	
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
