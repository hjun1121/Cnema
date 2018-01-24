package com.cnema.c1;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/common/**")
public class CommonController {

	@RequestMapping(value="map", method=RequestMethod.GET)
	public void map(){
		
	}
	
	@RequestMapping(value="result", method=RequestMethod.GET)
	public void result(String message, Model model){
		System.out.println(message);
		model.addAttribute("message", message);
	}
	
	@RequestMapping(value="resultClose", method=RequestMethod.GET)
	public void resultClose(String message, Model model){
		model.addAttribute("message", message);
	}
}
