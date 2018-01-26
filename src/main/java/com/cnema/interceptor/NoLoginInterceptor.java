package com.cnema.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class NoLoginInterceptor extends HandlerInterceptorAdapter {
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("member");

		String method = request.getMethod();
		if(method.equals("POST")){
			
		}else{
			if(obj != null){
				String message = "사용할수 없는 페이지";
				modelAndView.addObject("message", message);
				modelAndView.setViewName("common/result");
			}
		}
		
	}
	
}
