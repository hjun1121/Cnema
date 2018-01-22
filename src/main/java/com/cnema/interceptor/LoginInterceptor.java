package com.cnema.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
/*		HttpSession session = request.getSession();
		Object obj = session.getAttribute("member");
		boolean check = true;
		if(obj == null){
			//session.setAttribute("message", "로그인후 사용");
			String message = URLEncoder.encode("로그인 후 사용", "UTF-8");
			request.setAttribute("message", message);
			//response.sendRedirect("../?message="+message);
			check = false;
		}*/
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("member");
		
		if(obj == null){
			String message = "로그인 후 사용";
			
			modelAndView.setViewName("common/result");
			modelAndView.addObject("message", message);
		}
		
	}
	
}
