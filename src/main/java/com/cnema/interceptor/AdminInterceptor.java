package com.cnema.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cnema.member.MemberDTO;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String path = request.getServletPath();
		path = path.substring(1);
		
		if(memberDTO==null){
			String message = "로그인이 필요한 서비스입니다.";
			modelAndView.setViewName("common/login");
			modelAndView.addObject("path", path);
			modelAndView.addObject("message", message);
		}else if(memberDTO.getType() != 20){
			String message = "접근 권한이 없습니다.";
			modelAndView.addObject("message", message);
			modelAndView.setViewName("common/result");
		}

		
	}
	
}
