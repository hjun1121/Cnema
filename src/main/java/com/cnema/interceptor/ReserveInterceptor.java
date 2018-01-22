package com.cnema.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cnema.member.MemberDTO;

public class ReserveInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("member");

		
		int movie_num = 0;
		int theater_num = 0;
		try {
			movie_num = Integer.parseInt(request.getParameter("movie_num"));
			theater_num = Integer.parseInt(request.getParameter("theater_num"));
		} catch (Exception e) {
			
		}
		
		
		String[] ar = request.getParameterValues("seat_num");
		for(String s : ar){
			System.out.println(s);
		}
		

		if(obj == null){
			String message = "로그인 후 사용하세요";
			
			modelAndView.addObject("message", message);
			modelAndView.setViewName("common/login");
		}

		
	}
	
}
