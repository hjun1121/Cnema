package com.cnema.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionController {
	
	@ExceptionHandler(NullPointerException.class)
	public String test(){
		
		return "";
	}
	
	@ExceptionHandler(RuntimeException.class)
	public ModelAndView test2(){
		System.out.println("sda");
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", "error");
		mv.setViewName("common/error");
		return mv;
	}
	
}
