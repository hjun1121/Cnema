package com.cnema.c1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="theater/*")
public class TheaterController {
	
	@RequestMapping(value="quickReserve")
	public void quickReserve(){
		
	}
	
	@RequestMapping(value="scheduleList")
	public void scheduleList(){
		
	}
	
}
