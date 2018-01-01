package com.cnema.c1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/home/**")
public class TestController {

	@RequestMapping(value="{name}")
	public void home(@PathVariable String name){
	}
	
}
