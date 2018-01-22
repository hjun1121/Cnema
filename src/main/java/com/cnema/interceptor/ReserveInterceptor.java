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
		String path = request.getServletPath();
		path = path.substring(1);
		
		System.out.println(path);
		
		int movie_num = 0;
		int theater_num = 0;
		String day_num =null;
		int schedule_num = 0;
		int adult_num = 0;
		int teen_num = 0;
		String people = null;
		int pCount = 0;
		int price = 0;
		int total_price=0;
		String test = null;
		String test1 = null;
		try {
			movie_num = Integer.parseInt(request.getParameter("movie_num"));
			theater_num = Integer.parseInt(request.getParameter("theater_num"));
			day_num = request.getParameter("day_num");
			schedule_num = Integer.parseInt(request.getParameter("schedule_num"));
			adult_num = Integer.parseInt(request.getParameter("adult_num"));
			teen_num = Integer.parseInt(request.getParameter("teen_num"));
			people = request.getParameter("people");
			pCount = Integer.parseInt(request.getParameter("pCount"));
			price = Integer.parseInt(request.getParameter("price"));
			total_price = Integer.parseInt(request.getParameter("total_price"));
			test = request.getParameter("test");
			test1 = request.getParameter("test1");
		} catch (Exception e) {
			
		}
		
		System.out.println("movie_num"+movie_num);
		System.out.println("theater_num"+theater_num);
		System.out.println("day_num"+day_num);
		System.out.println("schedule_num"+schedule_num);
		System.out.println("adult_num"+adult_num);
		System.out.println("teen_num"+teen_num);
		System.out.println("people"+people);
		System.out.println("pCount"+pCount);
		System.out.println("price"+price);
		System.out.println("total_price"+total_price);
		System.out.println("test"+test);
		System.out.println("test1"+test1);
		String[] ar = request.getParameterValues("seat_num");
		for(String s : ar){
			System.out.println("seat"+s);
		}
		

		if(obj == null){
			String message = "로그인 후 사용하세요";
			
			modelAndView.addObject("message", message);
			modelAndView.setViewName("common/login");
		}

		
	}
	
}
