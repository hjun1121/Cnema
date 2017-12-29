package com.cnema.c1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="temp/*")
public class TempController {
	
	@RequestMapping(value="header")
	public void header(){
		
	}
	
	@RequestMapping(value="footer")
	public void footer(){
		
	}
	
}
