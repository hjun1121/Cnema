package com.cnema.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cnema.member.MemberDTO;
import com.cnema.reserve.Reserve2DTO;
import com.cnema.reserve.ReserveDTO;

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
		
		int movie_num = 0;
		int theater_num = 0;
		String day_num =null;
		int schedule_num = 0;
		int adult_num = 0;
		int teen_num = 0;
		String people = null;
		int pCount = 0;
		int price = 0;
		String seatName = null;
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
			seatName = request.getParameter("seatName");
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
		System.out.println("sn"+seatName);
		String[] ar = request.getParameterValues("seat_num");
		
		ReserveDTO reserveDTO = new ReserveDTO();
		Reserve2DTO reserve2DTO = new Reserve2DTO();
		
		reserveDTO.setMovie_num(movie_num);
		reserveDTO.setTheater_num(theater_num);
		reserveDTO.setDay_num(day_num);
		reserveDTO.setSchedule_num(schedule_num);
		reserve2DTO.setAdult_num(adult_num);
		reserve2DTO.setTeen_num(teen_num);
		reserve2DTO.setpCount(pCount);
		reserve2DTO.setPeople(people);
		reserve2DTO.setPrice(price);
		reserve2DTO.setSeatName(seatName);
		List<Integer> seat_num = new ArrayList<>();
		for(String s : ar){
			int seat = Integer.parseInt(s);
			seat_num.add(seat);
		}
		reserveDTO.setSeat_num(seat_num);
		

		if(obj == null){
			String message = "로그인 후 사용하세요";
			modelAndView.addObject("path", path);
			modelAndView.addObject("reserve", reserveDTO);
			modelAndView.addObject("reserve2", reserve2DTO);
			modelAndView.addObject("seat_num", seat_num);
			modelAndView.addObject("message", message);
			modelAndView.setViewName("common/loginReserve");
		}

		
	}
	
}
